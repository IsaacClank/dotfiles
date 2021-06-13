# Environment variables
export ZSH="/home/isaac/.oh-my-zsh"    
export DOT="/home/isaac/Repos/dotfiles"    

# Custom functions
fpath=(
  "${DOT}/zsh/functions"
  "${fpath[@]}"
)

autoload -Uz cheat hint timezsh

# Theme and plugins
ZSH_THEME="spaceship"
plugins=(git k zsh-autosuggestions zsh-syntax-highlighting)

# Additional file to be sourced
source $ZSH/oh-my-zsh.sh   
source "${DOT}/zsh/alias"
