# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

if [ "$TERM" = "xterm" ]; then
    export TERM="xterm-256color"
fi

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "/home/ferron/.gvm/scripts/gvm" ]] && source "/home/ferron/.gvm/scripts/gvm"

if [ -d "$HOME/.pyenv" ] ; then 
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi