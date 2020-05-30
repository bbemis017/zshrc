# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ===============================
# User configuration
# ===============================

export PATH="/homes/bbemis/bin/.amd64-linux:/homes/bbemis/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.7.3:/usr/games/bin:."

# for docker
export PATH="${PATH}:${HOME}/.local/bin"
export DOCKER_HOST="tcp://localhost:2375"

export ZSHRC_SRC_DIR="/mnt/d/CodeLibrary/tools/zshrc/"

export codelibrary="/mnt/d/CodeLibrary"
export keys="${codelibrary}/security/aws-keys"
export ec2="${codelibrary}/tools/aws"
export BROWSER=/mnt/c/"Program Files (x86)"/Google/Chrome/Application/chrome.exe

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#


# ==============================
# Aliases
# ==============================

# ZSHRC Management Aliases
alias zshconfig="vim ${ZSHRC_SRC_DIR}/.zshrc; sh ${ZSHRC_SRC_DIR}/deploy.sh; source ~/.zshrc"
alias zshcommit="run_within_dir ${ZSHRC_SRC_DIR} git add .zshrc ; run_within_dir ${ZSHRC_SRC_DIR} git commit -m ${1}"
alias zshdir="echo '${ZSHRC_SRC_DIR}'"

# python projects
alias pysource="source local_env/bin/activate"


# ============================
# Bash Functions
# ===========================


run_within_dir() {
    # Runs command within directory and cds back to original directory
    # Example: run_within_dir /zshrc git commit
    target_dir="$1"
    prev_dir=$(pwd)
    shift
    cd "${target_dir}" && "$@"
    cd "${prev_dir}"
}

gitignore_global() {
   git config --global core.excludesfile ~/.gitignore_global
   echo "${1}" >> ~/.gitignore_global
}

gitignore() {
   echo "${1}" > .gitignore
}

git_clone() {
   git clone "git@github.com:bbemis017/${1}.git"
}

git_push() {
  branch=`git branch | sed -n -e 's/^\* \(.*\)/\1/p'`
  git push origin "${branch}"

  repo_path=`git rev-parse --show-toplevel`
  repo_name=`basename ${repo_path}`
  pr_url="https://github.com/bbemis017/${repo_name}/pull/new/${branch}"
  $BROWSER ${pr_url}
}

protect_key() {
   sudo chmod 600 "${1}"
}

ssh_aws() {
   key="${keys}/${AWS_KEYFILE}"
   host="${AWS_USER}@${AWS_HOST}"
   echo "sshing into ${key} ${host}"
   ssh -i "${key}" "${host}"
} 

export_env() {
   temp_file="export_env.temp"
   cat "${1}" | grep -v "^$" | grep -v "^#" > ${temp_file} 
   while IFS= read -r line; do
	  export "${line}"
   done < ${temp_file}
   rm ${temp_file}
}


