## Requirements

* RVM
* boson
* awesome_print
* net-http-spy
* wirble
* bond

It is recommended that you add these gems to your `~/.rvm/gemsets/global.gems` to ensure
that they are always available.

## How to install

Clone this repo using git

    git clone git://github.com/logankoester/irbrc.git

Set up your symlinks

    ln -s irbrc ~/.irbrc
    ln -s boson/commands/common ~/.boson/commands/common

Edit your Boson config (`~/.boson/config/boson.yml`)

      ---
      :command_aliases:
        fast_load: fl
        fast_reload: rl
        fast_retry: rt
        print_methods: pm
      :console_defaults:
        - bashlike
        - fast_reload
        - print_methods
        - eval_lines

Run `irb` and enjoy!

These settings will also affect your script/console sessions in Rails

## What you get
* A colorful prompt including the line number, Ruby version, gemset, and current working directory
* Colored output / highlighting
* IRB history that is preserved between sessions
* Detailed HTTP output when calling remote services

... and a few lightweight tools to make IRB a bit friendlier:

|*Module*|*Description*|*Example*|
|------|-----------|-------|
|BashLike|Make IRB feel more bash-like|`clear`, `cd`, `ls`, `pwd`, ...
|EvalLines|Run a few specific lines from a file
|FastReload|Reload the most recent file from fast_load and then repeat the last command
|PrintMethods|Print object methods for a given object or class

For more information, type load up IRB and type `commands`, and explore the source!

Contributions welcome.

Enjoy!
