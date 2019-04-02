#!/usr/bin/env bash

# Sets some Bash options to encourage well formed code.
# For example, some of the options here will cause the script to terminate as
# soon as a command fails. Another option will cause an error if an undefined
# variable is used.
# See: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html

# Any trap on ERR is inherited by shell functions, command substitutions, and
# commands executed in a subshell environment. The ERR trap is normally not
# inherited in such cases.
set -o errtrace

# Any trap on DEBUG and RETURN are inherited by shell functions, command
# substitutions, and commands executed in a subshell environment. The DEBUG and
# RETURN traps are normally not inherited in such cases.
set -o functrace

# Exit if any command exits with a non-zero exit status.
set -o errexit

# Exit if script uses undefined variables.
set -o nounset

# Prevent masking an error in a pipeline.
# Look at the end of the 'Use set -e' section for an excellent explanation.
# see: https://www.davidpashley.com/articles/writing-robust-shell-scripts/
set -o pipefail

# Make debugging easier when you use `set -x`
# See: http://wiki.bash-hackers.org/scripting/debuggingtips#making_xtrace_more_useful
export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'


# Saves file descriptors so they can be restored to whatever they were before
# redirection or used themselves to output to whatever they were before the
# following redirect.
exec 3>&1 4>&2

# Restore file descriptors for particular signals. Not generally necessary since
# they should be restored when the sub-shell exits.
trap 'exec 2>&4 1>&3' 0 1 2 3

# Redirect stdout to file log.out then redirect stderr to stdout.
# Note that the order is important when you want them going to the same file.
# stdout must be redirected before stderr is redirected to stdout.
exec 1>log.out 2>&1

# From then on, to see output on the console (maybe), you can simply redirect to &3. For example,
# echo "$(date) : part 1 - start" >&3
# will go to wherever stdout was directed, presumably the console, prior to executing line 3 above.
