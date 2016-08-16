# This file goes in ~/.bash_profile (the tilde is your home directory)

# ==ENVIROMENT-VARIABLES========================================================
  export EDITOR='atom'                                                          # Set to your text editor
  export PATH="/usr/local/bin:$HOME/bin:$HOME/code/dotfiles/bin:$PATH"          # Look for executables in homebrew first

# ==RVM-VARIABLES===============================================================
  [[ -s "$HOME/.profile" ]] && source "$HOME/.profile"                          # Load the default .profile
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"          # Load RVM into a shell session *as a function*

# ==ALIASES=====================================================================
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad
  # =SYSTEM-ALIASES===========================================================
  alias reload="source ~/.bash_profile"       # Used to reload the bash shell after making changes
  alias bashprofile="atom ~/.bash_profile"    # Open's the .bash_profile in atom editor quickly
  function md { mkdir $1; cd $1; }            # Creates a Directory then CDs right into the new directory

  alias cp='cp -iv'                           # Preferred 'cp' implementation
  alias mv='mv -iv'                           # Preferred 'mv' implementation
  alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
  alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
  alias less='less -FSRXc'                    # Preferred 'less' implementation
  alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
  alias ..='cd ../'                           # Go back 1 directory level
  alias ...='cd ../../'                       # Go back 2 directory levels
  alias .3='cd ../../../'                     # Go back 3 directory levels
  alias .4='cd ../../../../'                  # Go back 4 directory levels
  alias .5='cd ../../../../../'               # Go back 5 directory levels
  alias .6='cd ../../../../../../'            # Go back 6 directory levels
  alias edit='atom'                           # edit:         Opens any file in sublime editor
  alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
  alias ~="cd ~"                              # ~:            Go Home
  alias c='clear'                             # c:            Clear terminal display
  alias which='type -all'                     # which:        Find executables
  alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
  alias show_options='shopt'                  # Show_options: display bash options settings
  alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
  alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
  mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
  trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
  ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
  alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

  # Digital Ocean Droplet Aliases
  alias breynolds.co='ssh breynolds@breynolds.co'

  #   extract:  Extract most know archives with one command
  #   ---------------------------------------------------------
      extract () {
          if [ -f $1 ] ; then
            case $1 in
              *.tar.bz2)   tar xjf $1     ;;
              *.tar.gz)    tar xzf $1     ;;
              *.bz2)       bunzip2 $1     ;;
              *.rar)       unrar e $1     ;;
              *.gz)        gunzip $1      ;;
              *.tar)       tar xf $1      ;;
              *.tbz2)      tar xjf $1     ;;
              *.tgz)       tar xzf $1     ;;
              *.zip)       unzip $1       ;;
              *.Z)         uncompress $1  ;;
              *.7z)        7z x $1        ;;
              *)     echo "'$1' cannot be extracted via extract()" ;;
               esac
           else
               echo "'$1' is not a valid file"
           fi
      }

  # =NETWORK-ALIASES==========================================================
  alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
  alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
  alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
  alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
  alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
  alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
  alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
  alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
  alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
  alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

  #   ii:  display useful host related informaton
  #   -------------------------------------------------------------------
      ii() {
          echo -e "\nYou are logged on ${RED}$HOST"
          echo -e "\nAdditionnal information:$NC " ; uname -a
          echo -e "\n${RED}Users logged on:$NC " ; w -h
          echo -e "\n${RED}Current date :$NC " ; date
          echo -e "\n${RED}Machine stats :$NC " ; uptime
          echo -e "\n${RED}Current network location :$NC " ; scselect
          echo -e "\n${RED}Public facing IP Address :$NC " ; myip
          #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
          echo
      }

  # =GITHUB-ALIASES===========================================================
  alias gs="git status"
  alias ga="git add"
  alias gb="git branch"
  alias gc="git commit"
  # alias gcl="git clone"
  alias gcm="git commit -m"
  alias gca="git commit -m 'This was an aliased commit.'"
  alias gco="git checkout"
  alias hc="hub create"
  alias gpom="git push origin master"
  alias gcom="git checkout master"
  alias gbkup="USER=arturusfury;PAGE=1; curl \"https://api.github.com/users/$USER/repos?page=$PAGE&per_page=100\" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone" # Will clone the first 100 repo's from any user's github account.  Change the PAGE=1 if you need to grab more then a hundred.
  function gclone {
    cd ~/Development/code/arturusfury.github.io/
    reponame=${1##*/}
    reponame=${reponame%.git}
    git clone "$1" "$reponame";
    cd "$reponame";
    bundle install;
    atom .;
  }

  # =OTHER-ALIASES============================================================
  alias dbstart="postgres -D /usr/local/var/postgres"

# ==PATH-ALIASES================================================================
    alias mygit="cd ~/Development/code/arturusfury.github.io/"                  # Moves directly into my local github folder containing all of my repos
    alias dotfiles="cd ~/Development/code/arturusfury.github.io/dotfiles/"      # Moves directly into my dotfiles repo inside my github folder

    # NOTE: Delete this if you are using rvm
    # override cd b/c I always want to list dirs after I cd
    # note that this won't work with rvm b/c it overrides cd.
    cd() {
      builtin cd "$@"
      ls
    }

    # meta-p and meta-n: "starts with" history searching
    # taken from http://blog.veez.us/the-unix-canon-n-p
    bind '"\ep": history-search-backward'
    bind '"\en": history-search-forward'

    # suspended processes
    alias j=jobs

    for i in $(seq 30)
    do
      alias "$i=fg %$i"
      alias "k$i=kill -9 %$i"
    done

    if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
    fi

    # kill jobs by job number, or range of job numbers
    # example: k 1 2 5
    # example: k 1..5
    # example: k 1..5 7 10..15
    k () {
      for arg in $@;
      do
        if [[ "$arg" =~ ^[0-9]+$ ]]
        then
          kill -9 %$arg
        else
          start=$(echo "$arg" | sed 's/[^0-9].*$//')
          end=$(echo "$arg" | sed 's/^[0-9]*[^0-9]*//')

          for (( n=start; n<=end; n++ ))
          do
            kill -9 %$n
          done
        fi
      done
    }

    # kill all jobs
    ka () {
      for job_num in $(jobs | ruby -ne 'puts $_[/\d+/]')
      do
        kill -9 "%$job_num"
      done
    }

    if [ -f ~/.git-completion.bash ]; then
      . ~/.git-completion.bash
    fi

# PROMPT
function parse_git_branch {
  branch=`git rev-parse --abbrev-ref HEAD 2>/dev/null`
  if [ "HEAD" = "$branch" ]; then
    echo "(no branch)"
  else
    echo "$branch"
  fi
}

  function prompt_segment {
    if [[ ! -z "$1" ]]; then
      echo "\[\033[${2:-37};49m\]${1}\[\033[0m\]"
    fi
  }

  function build_mah_prompt {
    # time
    ps1="\n$(prompt_segment " [\[\e[4;97m\]\@\[\e[m\]]")"
    countstr=" [00:00 AM] "

    # git branch
    git_branch=`parse_git_branch`
    if [[ ! -z "$git_branch" ]]; then countstr+=" [$git_branch]- "; fi

    # cwd with coloured current directory
    fullpath=`pwd`
    path="$(dirname "$fullpath")"
    dir="$(basename "$fullpath")"
    countstr+="${path}-"
    countstr+="${dir}--"
    ps1="${ps1} $(prompt_segment "\[\e[90m\]$path/\[\e[m\]")$(prompt_segment "\[\e[1;4;97m\]$dir\[\e[m\]" 34)"


    line="`printf -vch "%${COLUMNS}s" ""; printf "%s" "${ch// /-}"`"
    ps1="${ps1} \[\e[90m\]${line:${#countstr}}\[\e[m\]"

    if [[ ! -z "$git_branch" ]]; then ps1="${ps1} $(prompt_segment " [$git_branch] " 91)"; fi
    # next line
    ps1="${ps1}\n \[\e[1;91m\]➔\[\e[m\]  "

    # output
    PS1="$ps1"

    # PS1="$PS1\e[1m\e[32m${dts}${line:${#dts}}"
  }

  PROMPT_COMMAND='build_mah_prompt'

  eval "$(thefuck --alias)"
