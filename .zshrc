# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# Zsh completion
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh prompt
if [ "$UID" -eq 0 ]; then
    export PROMPT="
%F{135}%n%f@%F{166}%m%f %F{118}%~%f
%# "
else
    export PROMPT="
%F{135}%n%f@%F{166}%m%f %F{118}%~%f
\$ "
fi

# Rust
source "$HOME/.cargo/env"

# Helix
# For WSL
if [[ -e "$HOME/software/helix" ]]; then
    export PATH="$PATH:$HOME/software/helix"
fi

alias vi='hx'
alias vim='hx'
alias nvim='hx'

# FZF
source ~/.scripts/utilities/fzf.zsh

# bat
export BAT_DEFAULT_OPTS='--style=header,grid'
alias bat="batcat $BAT_DEFAULT_OPTS"
alias cat="batcat $BAT_DEFAULT_OPTS"
