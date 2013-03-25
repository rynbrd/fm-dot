The Mariner's Dot File Framework
================================

This is a simple, modular framework for versioning and installing dot files
into a user's home directory.


Installing the Dot Files
------------------------

Execute and source the output of the install script:

    cd PATH-TO-DOT-FILES
    eval $(./install)


Directory Structure
-------------------

bin -- A place to put common scripts that need to be called by modules. Also
    useful for storing one-off scripts the user needs on a regular basis. This
    is added to the PATH by the install scripts.

lib -- Libraries and Python modules needed by the bin scripts.

modules -- Where the application specific dot file modules are kept.

sounds -- Where sounds for the ding script are kept.


Module Layout
-------------

A module is a directory under modules that contains an install scripts. The
install script is sourced by the main install script. The following variables
are present when the script is sourced:

DOT -- Path to the root of the dot files directory where the main install
    script lives.

MOD -- The name of the current module.

MODPATH -- Path to the current module directory.

Since the stdout of the install script is expected to be eval'd it is important
that module install scripts also only output to stdout code to be eval'd.
Everything else should go to stderr.

Modules are not kept directly in the main framework repo but are instead linked
as submodules. The install script will do a `git submodule update --init` each
time it is run.


License
-------

This software project is licensed under the BSD-derived license and is
copyright (c) 2013 Ryan Bourgeois. A copy of the license is included in the
LICENSE file. If it is missing a copy can be found on the [project page][1].

[1]: https://github.com/BlueDragonX/fm-dot/blob/master/LICENSE    License
