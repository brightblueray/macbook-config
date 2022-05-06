# RKR Add Go bin to path
export PATH=$PATH:/Users/rryjewski/go/bin:/Users/rryjewski/Applications/bin
export PATH=/Users/rryjewski/Library/Python/3.8/bin:$PATH


# RKR use xman
function xman {
  open x-man-page://$1
}
alias man=xman

# RKR ls to use color and symbols
alias ls="ls -FG"

#RKR zsh history starts at the beginning
alias history="history 1"

#RKR get auto-comlete working
autoload -Uz +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rryjewski/Applications/bin/terraform terraform


# RKR kubectl completion https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#enable-shell-autocompletion
source <(kubectl completion zsh)
source <(helm completion zsh)
source <(doormat completion zsh)

# complete -o nospace -C /opt/homebrew/bin/terraform terraform

#compdef cdktf
###-begin-cdktf-completions-###
#
# yargs command completion script
#
# Installation: /opt/homebrew/bin/cdktf completion >> ~/.zshrc
#    or /opt/homebrew/bin/cdktf completion >> ~/.zsh_profile on OSX.
#
_cdktf_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /opt/homebrew/bin/cdktf --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _cdktf_yargs_completions cdktf
###-end-cdktf-completions-###

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
