source ~/personal_git/dotfiles/zsh/shared.sh

# work related scripts
source ~/personal_git/dotfiles/zsh/work.sh

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

if [ "$TERM" = "xterm" ]; then
    export TERM="xterm-256color"
fi

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "/home/ferron/.gvm/scripts/gvm" ]] && source "/home/ferron/.gvm/scripts/gvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(/usr/local/share/zsh-completions $fpath)
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval "$(zoxide init zsh)"

# added patch from :
# https://github.com/yankeexe/git-worktree-switcher/issues/11
wt_fld=~/personal_git/dotfiles/zsh/extensions/wt/wt
type -f "${wt_fld}" &> /dev/null &&
wt()
{
    local dirfile="$HOME/.wt.dir"
    rm -f "$dirfile"
    command "$wt_fld" "$@"
    if [ -f "$dirfile" ]; then
        if [ "$(< "$dirfile")" != "$(pwd)" ]; then
            cd -- "$(< "$dirfile")"
        fi
    fi
}