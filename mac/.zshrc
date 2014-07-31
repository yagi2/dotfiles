alias dg='df -g'
alias ls='gls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lla='ll -a'
alias more='less'
alias ipconfig='ifconfig'
alias cp='cp -p'
alias mkdir='mkdir -p'
alias x='exit'
alias sublime='subl'
alias sl='ls'
alias ks='ls'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-universal)
export EDITOR='subl -w'

autoload -U compinit
compinit
setopt list_types
setopt auto_menu
setopt interactive_comments
setopt magic_equal_subst
setopt complete_in_word

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

setopt auto_cd
setopt correct

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz vcs_info
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload colors
colors
local p1="%F{blue}%n@%m%f:%F{green}[%d]%f"
local p2="%1(v|%F{red}%1v%f|)"
PROMPT=$p1$p2$' \xF0\x9f\x8d\xba \n$ '

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.rvm/scripts/rvm
