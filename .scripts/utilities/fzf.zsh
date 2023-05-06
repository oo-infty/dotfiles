#!/usr/bin/env zsh

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export FD_DEFAULT_OPTS='--follow --color=always -E ".git" -E "build" -E "target" -E "node_modules"'

export FZF_DEFAULT_OPTS='--ansi --reverse --scroll-off=5 --cycle --preview="$HOME/.scripts/executables/preview.zsh {}" --preview-window=border-left'
export FZF_DEFAULT_COMMAND="fd $FD_DEFAULT_OPTS ."

_fzf_compgen_path() {
    eval "fd $FD_DEFAULT_OPTS . \"$1\""
}

_fzf_compgen_dir() {
    eval "fd --type d $FD_DEFAULT_OPTS . \"$1\""
}

rgi() {
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="${*:-}"
    FZF_DEFAULT_COMMAND="if [[ -n \"$INITIAL_QUERY\" ]]; then; $RG_PREFIX $(printf %q \"$INITIAL_QUERY\"); fi || true" \
    fzf --ansi \
        --disabled --query "$INITIAL_QUERY" \
        --bind "change:reload:sleep 0.2; if [[ -n {q} ]]; then; $RG_PREFIX {q}; fi || true" \
        --bind='enter:execute(hx {1} +{2})' \
        --delimiter=':' \
        --preview='if [[ -n {1} ]]; then; batcat --style=numbers,header --color=always --highlight-line={2} {1}; fi' \
        --preview-window=border-left
}
