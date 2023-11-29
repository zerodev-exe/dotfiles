# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
eval "$(zoxide init zsh)"

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=()
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#available free memory
alias free="free -mt"

#continue download
alias wget="aria2c"

#readable output
alias df='df -h'

#Bash aliases
alias reload='source ~/.zshrc'
alias pingme='ping -c64 github.com'
alias cls='clear && neofetch'
alias traceme='traceroute github.com'


#youtube-dl
alias ytv-best='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" --merge-output-format mp4 '

#GiT  command
alias gc='git clone --bare'
alias gcm='git commit -am'
alias 'git clone'='git clone --bare'


#cd/ aliases
alias etc='cd /etc/'
alias music='cd ~/Music'
alias vids='cd ~/Videos/'
alias conf='cd ~/.config'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias dldz='cd ~/Downloads'
alias docs='cd ~/Documents'
alias dev='cd ~/Developer/'
alias school='cd ~/Documents/school/'
alias sapps='cd /usr/share/applications'
alias lapps='cd ~/.local/share/applications'
alias .nvim='cd ~/.config/nvim/'


#Package Info
alias info='sudo pacman -Si '
alias infox='sudo pacman -Sii '

#shutdown or reboot
alias sr="sudo reboot"
alias ssn="sudo shutdown now"


# My aliaces
alias crash=":(){:|:&};:"
alias vi='nvim'

#NOTE: these are my functions

cx() {cd "$@" && l;}

mkschool(){

dir=~/Documents/school/$1
mkdir $dir
cd $dir
cat << EOF > $1.tex
\documentclass[letterpaper,12pt]{article}

\setlength\parindent{0pt}

\renewcommand{\familydefault}{\sfdefault}

\usepackage[english]{babel}
\usepackage{blindtext}

\begin{document}

\title{\Large{\textbf{$1}}}
\author{Insert name here}
\date{Insert date here}

\maketitle



\end{document}
EOF

nvim $1.tex
}

tm(){
    sessions=$(tmux list-sessions -F "#S")

    # fuzzy find session with fzf
    session=$(echo $sessions | tr ' ' '\n' | gum filter)

    # attach to session
    tmux attach-session -t $session
}

dup() {
    typeset -a lines
    typeset -a counts
    lines=()
    counts=()
    while read line; do
        if [[ -n "$line" ]]; then
            if [[ ! " ${lines[@]} " =~ " ${line} " ]]; then
                lines+=("$line")
                counts+=("1")
            else
                index=0
                for i in $(seq 1 ${#lines[@]}); do
                    if [[ "${lines[$i]}" == "$line" ]]; then
                        index="$i"
                        break
                    fi
                done
                ((counts[$index]++))
            fi
        fi
    done < "$1"

  # Print out any lines that appear more than once, along with their counts
  for index in $(seq 1 ${#lines[@]}); do
      count="${counts[$index]}"
      if (( count > 1 )); then
          echo "${lines[$index]} appears $count times"
      fi
  done
}

4file (){
    # Check if a filename was provided as an argument
    # and if a command was provided in the $1 slot

    if [[ -z "$1" ]]; then
        echo "Please provide a command in the first slot"
    elif [[ -z "$2" ]]; then
        echo "Please provide a filename as an argument"
    else
        while read -r line; do
            $1 "$line"
        done < "$2"
    fi
}



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6
