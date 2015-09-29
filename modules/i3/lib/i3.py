"""
API for communicating with the i3 window manager.
"""

import json
import subprocess


class I3Msg(object):
    """Send messages to i3."""

    def __init__(self, socket=None, msgbin=None):
        """
        Initialize the messager.

        @param socket The socket to connect to i3 via.
        @param msgbin The path to i3-msg.
        """
        if msgbin is None:
            msgbin = "i3-msg"
        self.cmd = (msgbin,)
        if socket is not None:
            self.cmd = self.cmd + ('s', socket)

    def call(self, *args):
        """
        Call i3msg and return the parsed output.

        @param args The set of command line arguments to pass to i3-msg.
        @return An object containing the command's response.
        """
        data = subprocess.check_output(self.cmd + args)
        if len(data) == 0:
            return None
        return json.loads(data.decode('utf-8'))

    def command(self, *cmd):
        """
        Return the result of an i3 command.

        @param cmd A list representing the command to execute.
        @return The output of the command.
        """
        return self.call(*cmd)

    def get_workspaces(self):
        """
        Return a list of workspace objects.

        @return Parsed output of i3-msg -t get_workspaces.
        """
        return self.call('-t', 'get_workspaces')

    def get_outputs(self):
        """
        Return a list of output objects.

        @return Parsed output of i3-msg -t get_outputs.
        """
        return self.call('-t', 'get_outputs')

    def get_tree(self):
        """
        Return the i3 container tree.

        @return Parsed output of i3-msg -t get_tree.
        """
        return self.call('-t', 'get_tree')

    def get_marks(self):
        """
        Return a list of marks.

        @return Parsed output of i3-msg -t get_marks.
        """
        return self.call('-t', 'get_marks')

    def get_bar_config(self, id=None):
        """
        Return i3bar config with the given ID or all if no ID is provided.

        @param id The ID of the bar to retrieve configuration for.
        @return Parsed output of i3-msg -t get_bar_config [ID].
        """
        args = ('-t', 'get_bar_config')
        if id is not None:
            args = args + (id,)
        return self.call(*args)

    def get_version(self):
        """
        Return the version of i3 we're connected to.

        @return Parsed output of i3-msg -t get_version.
        """
        return self.call('-t', 'get_version')


class I3Runner(object):
    """Run a series of commands from a file stream."""

    def __init__(self, i3msg=None):
        """
        Initialize the runner.

        @param i3msg The i3msg object. If None then a new object will be
            created with the default arguments.
        """
        if i3msg is None:
            i3msg = I3Msg()
        self.i3 = i3msg

    def commands(self, cmds, ignore=None):
        """
        Run multiple of commands.

        @param cmds An iterable containing commands to run.
        @param ignore A regex used to ignore certain lines. Defaults to None.
        @return A list of results, one for each command.
        """
        results = []
        for cmd in cmds:
            if len(cmd.strip()) == 0 or (
                    ignore is not None and ignore.match(cmd)):
                results.append(None)
            else:
                results.append(self.i3.command(cmd))
        return results

    def loads(self, data, ignore=None):
        """
        Load commands from a string.

        @param data The string to process. Commands should be on individual
            lines.
        @param ignore A regex used to ignore certain lines. Defaults to None.
        @return A list of results, one for each command.
        """
        return self.commands(data.split("\n"))

    def load(self, file, ignore=None):
        """
        Load commands from a file-like object.

        @param file A file-like object to read commands from.
        @param ignore A regex used to ignore certain lines. Defaults to None.
        @return A list of results, one for each command.
        """
        return self.commands(file, ignore)
