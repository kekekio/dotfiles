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
export PATH="/home/kio/.local/bin:$PATH"
HIST_STAMPS='yyyy-mm-dd'
HISTSIZE=100000
for f in $HOME/.config/kio_setup/*.env; do source $f; done
for f in $HOME/.config/kio_setup/private/*.env; do source $f; done
alias pacman="sudo pacman"
alias ipython='python -m IPython'
alias tmr="echo 'systemctl suspend' | sudo at now +"
alias ":q"="exit"
alias brc="vi ~/.bashrc"
alias sudo="sudo -E"
alias sb="sudo bash"
alias diff="diff --color=always"

#prefere kio-decomp
alias untgz="tar -xf $1 --one-top-level"
alias tgz="tar -czvf $1.tar.gz $1"
alias sha3sum="rhash --sha3-256"

cd() {
  if [ "$1" = "help" ]; then
      cd $HOME/.bash-helpers/; ls
  elif [ "$1" = "helpers" ]; then
      cd $HOME/.bash-helpers/; ls
  else 
      command cd "$@"
  fi
}

#================================Theme=====================================
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
  PS_TIME_BGMAINCOLOR=$PS_BGCOLOR_WHITE
  PS_TIME_FGMAINCOLOR=$PS_FGCOLOR_BLUE
  PS_PWD_BGCOLOR=$PS_BGCOLOR_BLUE
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
    
