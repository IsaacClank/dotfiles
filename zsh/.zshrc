source /home/isaac/.zplug/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
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
