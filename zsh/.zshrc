source /home/isaac/.zplug/init.zsh

zplug "sindresorhus/pure", as:theme
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit; prompt pure

zplug "b4b4r07/zplug-doctor", lazy:yes
zplug "b4b4r07/zplug-cd", lazy:yes
zplug "b4b4r07/zplug-rm", lazy:yes
zplug "plugins/git", from:oh-my-zsh
zplug "zpm-zsh/ls"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "modules/completion/", from:prezto

export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"

if ! zplug check --verbose; then
  zplug install
  echo
fi

zplug load

alias refresh="exec zsh"
alias 'cd..'='cd ..'
alias tasks='gh issue list --assignee @me'
alias task='gh issue'
