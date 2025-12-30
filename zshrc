# Created by newuser for 5.9
autoload -Uz compinit
compinit

# Define color codes
autoload -U colors && colors

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Better history behavior
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Git  
prompt_git() {
	local s='';
	local branchName='';
	local repoUrl='';

	# Check if the current directory is in a Git repository.
	git rev-parse --is-inside-work-tree &>/dev/null || return;

	# Check for what branch we’re on.
	# Get the short symbolic ref. If HEAD isn’t a symbolic ref, get a
	# tracking remote branch or tag. Otherwise, get the
	# short SHA for the latest commit, or give up.
	branchName=$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
		git describe --all --exact-match HEAD 2> /dev/null || \
		git rev-parse --short HEAD 2> /dev/null || \
		echo '(unknown)');

	# Early exit for Chromium & Blink repo, as the dirty check takes too long.
	# Thanks, @paulirish!
	# https://github.com/paulirish/dotfiles/blob/dd33151f/.bash_prompt#L110-L123
	repoUrl=$(git config --get remote.origin.url);
	if grep -q 'chromium/src.git' <<< "$repoUrl"; then
		s+='*';
	else
		# Check for uncommitted changes in the index.
		if ! git diff --quiet --ignore-submodules --cached; then
			s+='+';
		fi;
		# Check for unstaged changes.
		if ! git diff-files --quiet --ignore-submodules --; then
			s+='!';
		fi;
		# Check for untracked files.
		if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
			s+='?';
		fi;
		# Check for stashed files.
		if git rev-parse --verify refs/stash &>/dev/null; then
			s+='$';
		fi;
	fi;

	[[ -n $s ]] && s=" [$s]";

	print -r -- "${1}${branchName}${2}${s}";
}

# Path
arrow="→ "
setopt PROMPT_SUBST
PROMPT="%{$fg_bold[cyan]%}$arrow%{$fg[green]%}%1~%{$reset_color%}"
PROMPT+='$(prompt_git "%{$fg[white]%} on %{$fg[magenta]%}" "%{$fg[blue]%}" ) '
PROMPT+='%{$reset_color%}' 
# Aliases
alias cdr='cd ~'

bindkey -e

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
