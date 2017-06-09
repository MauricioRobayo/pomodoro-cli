# Command Line Pomodoro Timer [![GitHub issues](https://img.shields.io/github/release/archimiro/pomodoro-cli.svg)](https://github.com/archimiro/pomodoro-cli/releases)

The infamous poorman Pomodoro Timer for the command line, written in `GNU bash, version 4`. No intended to be POSIX standard compatible.

To use it, clone the repository and execute the `pomodoro` script:

    $ git clone https://github.com/archimiro/pomodoro-cli.git
    $ cd pomodoro-cli
    $ chmod u+x pomodoro
    $ ./pomodoro

This will run a default pomodoro timer with 4 pomodoros of 25 minutes work time, 5 minutes short breaks, and 15 minutes long break.

You can also specify a custom pomodoro interval with the `-i` option, in the following form:

    $ ./pomodoro -i "2 10 5 10"

Which will run 2 pomodoros of 10 minutes work time, 5 minutes short breaks, and 10 minutes long break.

If you prefer to measure in seconds, you can add the `-s` option:

    $ ./pomodoro.sh -s

Will run the default pomodoro but will measure time in seconds rather than in minutes.

    $ ./pomodoro -s -i "2 10 5 10"

Will run a custom pomodoro interval of 2 pomodoros of 10 seconds work time, 5 seconds short breaks, and 10 seconds long break.
