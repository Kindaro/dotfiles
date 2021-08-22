setopt interactivecomments
autoload -Uz promptinit
promptinit

set -o vi 
export HISTSIZE=1048576
export SAVEHIST=1048576
export HISTFILE=~/.zsh_history
export KEYTIMEOUT=1
export SAVEHIST=$HISTSIZE

setopt no_hist_ignore_dups
setopt no_hist_ignore_all_dups
setopt share_history
setopt no_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_verify
setopt prompt_subst


alias l='ls -FAtcr'
alias ll='ls -FlAtcr'
alias ls='ls --color=auto '
alias please='sudo '

function set-prompt ()
{
    # Switch prompt color when changing modes.
    NPS1='%{[31m%}%B%#%b%{[00m%} '
    EPS1='%{[32m%}%B%#%b%{[00m%} '
    PS1="${${KEYMAP/vicmd/$NPS1}/(main|viins)/$EPS1}"

    # Display some information in the terminal window title.

    if command -v git >/dev/null
    then
        git_branch=`git rev-parse --verify --abbrev-ref --short @ 2>/dev/null`
        git_branch_status=$?
        if [[ $git_branch_status -eq 0 ]]
        then
            RPS_GIT_BRANCH=" ${git_branch}"
        else
            RPS_GIT_BRANCH=""
        fi
    fi

    if command -v nix >/dev/null && [ "$NIX_STORE" ]
    then
        RPS_NIX=' nix'
    else
        RPS_NIX=''
    fi

    TITLE=`pwd`
    TITLESHORT="${TITLE#"${HOME}"}"
    if [ "$TITLE" = "$HOME" ]
    then TITLE=''
    else
        if ! [ "$TITLE" = "$TITLESHORT" ]
        then TITLE="~${TITLESHORT}"
        fi
        if ! [ -z "$RPS_GIT_BRANCH" ]
        then TITLE="${TITLE}${RPS_GIT_BRANCH}${RPS_NIX}"
        fi
    fi
    echo -n -e "\033]0;$TITLE\007"
}

set-prompt

function zle-line-init zle-keymap-select zle-line-finish TRAPALRM
# Update prompt when needed.
{
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export EDITOR=vim
export PATH=~/.ghcup/bin/:~/.local/bin:~/.gem/ruby/2.6.0/bin:~/.cabal/bin:$PATH

bindkey -M vicmd '	' edit-command-line
autoload edit-command-line; zle -N edit-command-line
bindkey -M viins '\e.' insert-last-word

# This is not working:
unix-word-rubout () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}

zle -N unix-word-rubout
bindkey -M viins '^W' unix-word-rubout

alias git-log='git log --oneline --graph --branches --tags --color -n 47'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[7m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias t='tree -Flatr -I ".git|dist|dist-newstyle|node_modules|bower_components|.spago"'

_zsh_cli_fg() { fg; }
zle -N _zsh_cli_fg
bindkey '^Z' _zsh_cli_fg

# opam configuration
test -r /home/kindaro/.opam/opam-init/init.zsh && . /home/kindaro/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Fix nix ghc locale. (https://github.com/NixOS/nixpkgs/issues/64603)
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

alias ps="ps -H -u $USER"


#manpath updated by cli-setup
export MANPATH=$HOME/.local/share:$MANPATH

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome pushd_ignore_dups
alias dh='dirs -v'

alias jour="date +'%A, %-d of %B %Y'"

# https://stackoverflow.com/a/13021677
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

function success
{
    play  --no-show-progress -n synth 2.0 sine C4
    echo '\n[32;1m\tsuccess[0m\n'
}

function failure
{
    play  --no-show-progress -n synth 0.2 sine E5
    echo '\n[31;1m\tfailure[0m\n'
}

function try
{
    if eval "$@"
    then success
    else failure
    fi
}

function gitwatch
{
    inotifywait --event close_write --recursive `git ls-files`
}

function open
{
    target="$1"
    stat "$target" >/dev/null || return 1
    zathura "$target" & disown
}

function edit
{
    target="$1"
    emacsclient --create-frame "$target" & disown
}
