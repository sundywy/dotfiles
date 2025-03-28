# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sundyyaputra/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$(pyenv root)/shims:$PATH
export PATH=$HOME/.local/bin:$PATH

export GOPRIVATE="bitbucket.org/ntuclink"
export GOPATH=$HOME/go 
export PATH=$PATH:$GOPATH/bin

export EDITOR=hx
export BITBUCKET_CREDENTIAL="sundy_yaputra:u4mZPLbGdvDD7F8hM4XQ"

# export DB_HOST=localhost
# export DB_USER=sundy
# export DB_PASSWORD=password
# export REDIS_HOST=localhost
# export BERGLAS_CONTINUE_ON_ERROR=true

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# opam configuration
test -r /Users/sundyyaputra/.opam/opam-init/init.zsh && . /Users/sundyyaputra/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export NODE_OPTIONS='--http-parser=legacy'

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$(rbenv root)/shims:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


export PATH=/usr/local/smlnj/bin:$PATH
# export PATH=$(brew --prefix llvm)/bin:$PATH
[ -f "/Users/sundyyaputra/.ghcup/env" ] && source "/Users/sundyyaputra/.ghcup/env" # ghcup-env
export PATH="$PATH:/Users/sundyyaputra/.dotnet/tools"
# export PATH="/opt/homebrew/opt/go@1.17/bin:$PATH"

eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PATH=$HOME/.roswell/bin:$PATH

# alias code=code-insiders
export HOMEBREW_GITHUB_API_TOKEN=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
export PATH="$PATH:/Users/sundyyaputra/Library/Application Support/Coursier/bin"
# export PATH="/Library/Java/JavaVirtualMachines/graalvm-ce-java17-22.3.1/Contents/Home/bin:$PATH"
# export PATH="/Library/Java/JavaVirtualMachines/graalvm-ce-java19-22.3.1/Contents/Home/bin:$PATH"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/graalvm-ce-java19-22.3.1/Contents/Home"
# export HELIX_RUNTIME=/home/user-name/src/helix/runtime

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/graalvm-community-openjdk-22/Contents/Home"


export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"

# bun completions
[ -s "/Users/sundyyaputra/.bun/_bun" ] && source "/Users/sundyyaputra/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# source /opt/homebrew/opt/asdf/bin/asdf
# export PATH="/opt/homebrew/opt/go@1.22/bin:$PATH"
# export PATH="$HOME/.phpenv/bin:$PATH"
# eval "$(phpenv init -)"

# export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
 

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
