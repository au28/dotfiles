##profile


#Paths
PATH="${PATH//${HOME}\/.local\/bin:/}"
PATH="${PATH//${HOME}\/shll:/}"
export PATH="${HOME}/shll:${HOME}/.local/bin:${PATH}"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
export DOWNLOADS="${HOME}/dl"
export SOURCES="${HOME}/src"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export KPSS_DIR="${XDG_DATA_HOME}/pass"
export KPSS_KEY="5F48FC0A00DA717169ABF80E29A7C5C548EF4B92"
export HISTFILE="${XDG_CACHE_HOME}/bash_history"
export LESSHISTFILE="${XDG_CACHE_HOME}/less_history"
export FINANCES_JOURNAL="${XDG_DATA_HOME}/finances"
export CALCHISTFILE="${XDG_CACHE_HOME}/calc_history"
export PULSE_COOKIE="${XDG_DATA_HOME}/pulse/cookie"

#SSH Agent
#unset SSH_AGENT_PID
#export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

#Options
readonly TMOUT=300

#Source shellrc
if [ -f "${XDG_CONFIG_HOME}/shellrc" ]
then
  . "${XDG_CONFIG_HOME}/shellrc"
fi

#Startup
if ! [ $(pgrep --uid "$(id --user)" gpg-agent) ]
then 
  gpg-agent --daemon --quiet
fi
if [ "$(tty)" = "/dev/tty1" ] && [ "$(id --user --name)" != "root" ]
then
  dbus-run-session sway
fi
