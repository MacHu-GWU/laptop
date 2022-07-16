# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Display international characters properly
# See https://superuser.com/questions/583031/how-can-i-get-zsh-to-display-international-characters-properly
export LANG="en_US.UTF-8"

#------------------------------------------------------------------------------
# Enable zsh-autocomplete plugin
#
# - plugin homepage: https://github.com/marlonrichert/zsh-autocomplete repo
# - has to be cloned to ~/Documents/GitHub directory
# - add this source at or near the top of your .zshrc
#------------------------------------------------------------------------------
# source ~/Documents/GitHub/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/sanhehu/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell" # Default minimal
ZSH_THEME="agnoster" # My favorite

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

#------------------------------------------------------------------------------
# ZSH Theme agnoster customization
# This has to be after ``source $ZSH/oh-my-zsh.sh``
# Because it load the theme content from ~/.oh-my-zsh folder
# Then we can override some function used in the theme
#------------------------------------------------------------------------------
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\n$(date +"%Y-%m-%d %H:%M:%S%z") $%{%f%}"
  CURRENT_BG=''
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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


#------------------------------------------------------------------------------
# Open JDK
#------------------------------------------------------------------------------

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

export PATH="/opt/homebrew/Cellar/graphviz/3.0.0/bin:$PATH"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="$PATH:$HOME/gs-venv/bin"
export PATH="$PATH:/Library/TeX/texbin"

#------------------------------------------------------------------------------
# Enable zsh-autosuggestions plugin
#
# - plugin homepage: https://github.com/zsh-users/zsh-autosuggestions repo
# - has to be cloned to ~/Documents/GitHub directory
# - "auto suggestion" is not the same as "auto complete"
#------------------------------------------------------------------------------
source ~/Documents/GitHub/zsh-autosuggestions/zsh-autosuggestions.zsh

#------------------------------------------------------------------------------
# Enable zsh-syntax-highlighting plugin
#
# - plugin homepage: https://github.com/zsh-users/zsh-syntax-highlighting repo
# - has to be cloned to ~/Documents/GitHub directory
# - This line has to be at the end of .zshrc file, see why https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
#------------------------------------------------------------------------------
source ~/Documents/GitHub/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#------------------------------------------------------------------------------
# Enable zsh-history-substring-search plugin
#
# - plugin homepage https://github.com/zsh-users/zsh-history-substring-search
# - has to be cloned to ~/Documents/GitHub directory
# - MAKE SURE this line is later than zsh-syntax-highlighting.zsh line
#------------------------------------------------------------------------------
# source ~/Documents/GitHub/zsh-history-substring-search/zsh-history-substring-search.zsh

# bindkey '^[[A' up-line-or-history
# bindkey '^[[B' down-line-or-history


# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-select
