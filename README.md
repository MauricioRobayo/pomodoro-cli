# Command Line Pomodoro Timer

The infamous poorman Pomodoro Timer written in `GNU bash, version 4.4.12` for the command line.

To use it just invoke the script on your shell:

    $ ./pomodoro.sh

This will run a default pomodoro timer with 4 pomodoros of 25 minutes work time, 5 minutes short breaks, and 15 minutes long break.

You can also specify a custom pomodoro timer in the following form:

    $ ./pomodoro.sh 2 10 5 10

Which will run 2 pomodoros of 10 minutes work time, 5 minutes short breaks, and 10 minutes long break.

If you prefer to measure in seconds, you can add a final s argument:

    $ ./pomodoro.sh 2 10 5 10 s

This will run 2 pomodoros of 10 seconds work time, 5 seconds short breaks, and 10 seconds long break.