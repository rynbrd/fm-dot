"""
Config file generation using Mustache.
"""

import os
from configparser import SafeConfigParser
from pystache import defaults, Renderer


class ConfigGenerator(object):

    """
    Generate config files using other config files. A single ini-like config
    file is loaded containing the data to substitute in the config file
    templates. Each section in the file is a different substitution context
    that can be used to generate different config files from the same template.
    """
    
    def __init__(self, contexts=None, nodefaults=None):
        """
        Initialize the config generator.

        @param templates A path to the directory where the configuration
            templtaes are stored.
        @param contexts A path to the context file. Defaults to None in which
            case you can add them manually or use load(). If this is a list
            then the config from each file will be loaded. Values in later
            files in the same context will override previous values.
        @param nodefaults A list/tuple of context names not to inject defaults
            for.
        """
        if nodefaults is None:
            nodefaults = ()
        self.renderer = Renderer()
        self.contexts = {'default': {}}
        self.nodefaults = nodefaults
        if contexts is not None:
            if hasattr(contexts, '__iter__'):
                for context in contexts:
                    self.load_context(context)
            else:
                self.load_context(contexts)
        self.load_defaults()

    def get(self, context, key, default=None):
        """
        Get a value from a context.

        @param context The name of the context to get the value from.
        @param key The name of the value to retrieve.
        @param default The default value to return if the context or key does
            not exist. Defaults to None.
        @return The value of the key in the given context or the value of
            default if it does not exist.
        """
        if context not in self.contexts or key not in self.contexts[context]:
            return default
        return self.contexts[context][key]

    def set(self, context, key, value):
        """
        Set a value in a context. The context and value are created if they do
        not exist.

        @param context The name of the context to set the value in.
        @param key The name of the config key.
        @param value The value to set the key to.
        """
        if context not in self.contexts:
            self.contexts[context] = {}
        self.contexts[context][key] = value

    def has(self, context, key):
        """
        Return true if the key exists in the given context or false if it does
        not.

        @param context The context to check.
        @param key The key to check.
        @return True if the key exist and false if it does not.
        """
        return context in self.contexts and key in self.contexts[context]

    def load_context(self, context):
        """
        Load substitutions from an ini-like file. Each section of the file
        contains a different set of substitutions that can be used to generate
        different config files. If a context named default exists it will be
        used as the default for missing keys.

        @param contexts A path to the context file. The context file is an
            ini-like file. Each section represents a different context.
        """
        conf = SafeConfigParser()
        conf.optionxform = str
        with open(context) as fp:
            conf.readfp(fp)

        for context in conf.sections():
            if context not in self.contexts:
                self.contexts[context] = {}
            self.contexts[context].update(dict(conf.items(context)))

    def load_defaults(self):
        for context in self.contexts.keys():
            if context != 'default' and context not in self.nodefaults:
                for key, value in self.contexts['default'].items():
                    if key not in self.contexts[context]:
                        self.contexts[context][key] = value

    def generate(self, context, template):
        """
        Generate a configuration from the given template using the provided
        context for substitutions.

        @param context The name of the context to use.
        @param template The name of the template to use.
        @return The generated configuration.
        """
        if context not in self.contexts:
            context = 'default'
        with open(template, 'r') as f:
            template_data = f.read()
        return self.renderer.render(template_data, self.contexts[context])

    def generate_file(self, context, template, outfile):
        """
        Call generate() and write the output to a file.

        @param context The name of the context to use.
        @param template The name of the template to use.
        @param outfile The file to write the config to.
        """
        with open(outfile, 'w') as fp:
            fp.write(self.generate(context, template))
