#------------------------------
# Prompt
#------------------------------
autoload -U promptinit
promptinit
#prompt adam2 gray blue green white
source "/home/ahmed/agnoster.zsh-theme"

#------------------------------
# Window title
#------------------------------
case $TERM in
    *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () { print -Pn "\e]0;%n@%M%~\a" }
    preexec () { print -Pn "\e]0;%n@%M%~ $1\a" }
    ;;
    screen)
	precmd () {
	    print -Pn "\e]83;title \"$1\"\a"
	    print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a"
	}
	preexec () {
	    print -Pn "\e]83;title \"$1\"\a"
	    print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
	}
	;;
esac

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ahmed/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

#source /etc/profile.d/autojump.zsh

alias ls='ls --color=auto -F'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias f='find |grep'
alias c="clear"
alias gemacs='emacs'
alias ..='cd ..'
alias emacs='emacs -nw'
alias packer='packer-color'

# End of lines added by compinstall
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# Using projectors
alias xp-1024x768='xrandr --output LVDS1 --primary --mode 1366x768 --output VGA1 --mode 1024x768 --right-of LVDS1'
alias xp-1920x1080='xrandr --output LVDS1 --primary --mode 1366x768 --output VGA1 --mode 1920x1080 --right-of LVDS1'
alias xs='xrandr --output LVDS1 --primary --mode 1366x768 --output VGA1 --mode 1440x900 --above LVDS1'
alias xh='xrandr --output LVDS1 --primary --mode 1366x768 --output VGA1 --off'

# mosml
export PATH="${PATH}:/opt/mosml/bin"

# ruby
export PATH="${PATH}:$(ruby -rubygems -e "puts Gem.user_dir")/bin"

# set terminal to xterm for compatibility
export TERM=xterm

# clean alias
alias clean='sudo pacman -Syuq --noconfirm;sudo pacman -Rns $(pacman -Qqtd) --noconfirm;sudo pacman -Sc --noconfirm'
