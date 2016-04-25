git clone --recursive git@github.com:ferronrsmith/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sh ~/personal_git/dotfiles/zsh/zsh_links.sh

chsh -s /bin/zsh
