##profile


#Paths
PATH="${PATH//${HOME}\/src\/scripts:/}"
PATH="${PATH//${HOME}\/.local\/bin:/}"
export PATH="${HOME}/src/scripts:${HOME}/.local/bin:${PATH}"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export HISTFILE="${XDG_CACHE_HOME}/bash_history"
export LESSHISTFILE="${XDG_CACHE_HOME}/less_history"
export CALCHISTFILE="${XDG_CACHE_HOME}/calc_history"
export PULSE_COOKIE="${XDG_DATA_HOME}/pulse/cookie"

#Options
readonly TMOUT=300

#GPG Agent
if ! (pgrep --euid "$(id --user)" gpg-agent 1>/dev/null 2>&1)
then 
  gpg-agent --daemon --quiet
fi
unset SSH_AGENT_PID
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

#Graphical Session
if [ "$(tty)" = "/dev/tty1" ] && [ "$(id --user)" != "0" ]
then
  dbus-run-session sway
fi

#Source shellrc
if [ -f "${XDG_CONFIG_HOME}/shellrc" ]
then
  . "${XDG_CONFIG_HOME}/shellrc"
fi
