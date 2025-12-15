#===============================generic colorizer========================================
#enable cmake colors in grc
export CLICOLOR_FORCE=1
export CMAKE_COLOR_DIAGNOSTICS=ON
export CMAKE_COLOR_MAKEFILE=ON
export CMAKE_VERBOSE_MAKEFILE=ON
export GCC_COLORS=1
export CLANG_FORCE_COLOR_DIAGNOSTICS=1
export CLICOLOR_FORCE=1
GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/profile.d/grc.sh
alias grc="grc -es --colour=auto --config=$HOME/dev/dotfiles/kio_setup/grc.conf"
#===============================CONFIG========================================
HIST_STAMPS='yyyy-mm-dd'
HISTSIZE=100000
for f in $HOME/.config/kio_setup/*.env; do source $f; done
for f in $HOME/.config/kio_setup/private/*.env; do source $f; done
alias use-snap="export PATH=$PATH:/var/lib/snapd/snap/bin"
backup_folder="/home/kio/backup/apps/bash/"
alias do-backup="rsync -Pv ~/.bashrc ${backup_folder}bashrc$(LANG=en_us_88591; \
    date '+%d-%m-%Y'| sed 's/[[:blank:]:]//g')"
alias pacman="sudo pacman"
alias ipython='python -m IPython'
alias tmr="echo 'systemctl suspend' | sudo at now +"
alias opencvenv="source /home/kio/Documents/projects/opencv/env/bin/activate"
alias ":q"="exit"
alias bash-help="cat ~/.bash-helpers/bash-cmd.txt"
alias vi-help="cat ~/.bash-helpers/vi-help.txt"
alias vihelp="cat ~/.bash-helpers/vi-help.txt"
alias vifmhelp="cat ~/.bash-helpers/vifm-help.txt"
alias vifm-help="vifmhelp"
alias brc="vi ~/.bashrc"
alias vrc="vi ~/.config/nvim/binds.vim"
alias tovrc="cd ~/.config/nvim"
alias vimplug="vi /home/kio/.config/nvim/lua/plugins.lua"
alias sudo="sudo -E"
alias hist-no-num="fc -l -n 1 | sed 's/^\s*//'"
alias untgz="tar -xf $1 --one-top-level"
alias tgz="tar -czvf $1.tar.gz $1"
alias sb="sudo bash"
alias pwdpath=export PATH=$(pwd):$PATH
alias diff="diff --color=always"

cd() {
    if [ "$1" = "help" ]; then
        cd /home/kio/.bash-helpers/; ls
    elif [ "$1" = "helpers" ]; then
        cd /home/kio/.bash-helpers/; ls
    else 
        command cd "$@"
    fi
}

sha3sum() {
  rhash --sha3-256 $1
}

export PATH="/home/kio/.local/bin:$PATH"

envcxx(){
    export CPLUS_INCLUDE_PATH="/usr/include/opencv4/"
    export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/tensorflow"
    echo "exported CPLUS_INCLUDE_PATH as '$CPLUS_INCLUDE_PATH'"
}
envssh(){
  host="$1"
  user="$2"
  passwd="$3"
    if [ -n $host ]; then
      host="192.168.88.165"
    else
      IP_VAR=$host
    fi
    if [ -n $user ]; then
      user="root"
    fi
    if [ -n $passwd ]; then
      passwd="root123"
    fi
    echo "/home/kkk_REMOVE_ME/dev/gui_demo"
    ssh-keygen -R $host
    sshfs $user@$host:/ ~/mnt/ssh
    ssh $user@$host 
  }

#================================Theme=====================================
#OSH_THEME="mairan"
#source "$OSH"/oh-my-bash.sh
PS_BGCOLOR_YELLOW="\[\033[48;5;184m\]"  # Жёлтый фон (код 11)
PS_FGCOLOR_BLUE="\[\033[38;5;20m\]"     # Синий текст (код 32)
PS_BGCOLOR_BLUE="\[\033[48;5;20m\]"     # Синий фон
PS_FGCOLOR_YELLOW="\[\033[38;5;184m\]"   # Жёлтый текст
PS_FGCOLOR_GREEN="\[\033[38;5;46m\]"    # Зелёный текст
PS_BOLD="\[\033[1m\]"                   # Bold text
PS_RESET="\[\033[0m\]"                  # Сброс всех стилей и цветов
PS_BGCOLOR_RED="\[\033[48;5;196m\]"     # Красный фон
PS_FGCOLOR_WHITE="\[\033[38;5;15m\]"     # Ярко-белый текст
PS_FGCOLOR_RED="\[\033[38;5;196m\]"      # Красный текст
PS_BGCOLOR_WHITE="\[\033[48;5;15m\]"     # Ярко-белый фон
PS_BOLD="\[\033[1m\]"                     # Жирный стиль
PS_RESET="\[\033[0m\]"                   # Сброс всех стилей и цветов
PS_username="\[\033[01;36m\]\u"

BASHRC_OWNER=$(stat -c %U $(realpath "${BASH_SOURCE[0]}"))
if [[ "$USER" == "$BASHRC_OWNER" ]]; then
  #PS_TIME_BGMAINCOLOR=$PS_BGCOLOR_YELLOW
  PS_TIME_BGMAINCOLOR=$PS_BGCOLOR_WHITE
  PS_TIME_FGMAINCOLOR=$PS_FGCOLOR_BLUE
  PS_PWD_BGCOLOR=$PS_BGCOLOR_BLUE
  #PS_PWD_FGCOLOR=$PS_FGCOLOR_YELLOW
  PS_PWD_FGCOLOR=$PS_FGCOLOR_WHITE
else
  PS_TIME_BGMAINCOLOR=$PS_BGCOLOR_RED
  PS_TIME_FGMAINCOLOR=$PS_FGCOLOR_WHITE
  PS_PWD_BGCOLOR=$PS_BGCOLOR_WHITE
  PS_PWD_FGCOLOR=$PS_FGCOLOR_RED
fi
PSTIME="${PS_TIME_BGMAINCOLOR}${PS_TIME_FGMAINCOLOR}${PS_BOLD}\D{%H:%M} ${PS_RESET}"
PSPWD="\w"
PSUSERNAME="${PS_PWD_BGCOLOR}${PS_PWD_FGCOLOR}\u: ${PSPWD}${PS_RESET}"
PSSYM="${PS_FGCOLOR_GREEN}\\$ ${PS_RESET}"
PS1="${PSTIME}${PSUSERNAME}${PSSYM}${PS_RESET}"
    
