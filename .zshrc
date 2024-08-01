# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/joachims/.zshrc'

autoload -Uz compinit
compinit

eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path () {
	fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir () {
	fd --type=d --hidden --exclude .git . "$1"
}


# End of lines added by compinstall
alias config="sudo nix run $HOME/.config/nixvim /etc/nixos/configuration.nix"
alias rebuild="sudo nixos-rebuild switch"
alias zshconfig="sudo  nix run $HOME/.config/nixvim $HOME/.zshrc"
alias zshreload="source ~/.zshrc"
alias tmuxconfig="sudo nvim ~/.config/tmux/tmux.conf"
alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias normalls="ls"
alias treels="eza --tree --level=2 --icons=always"
alias nxim="nix run $HOME/.config/nixvim ."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tre --color=always {} | head -200'"

_fzf_comprun() {
	local command=$1
	shift

	case "$command" in
		cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@";;
		export|unset) fzf --preview "eval 'echo \$' {}"	"$@" ;;
		ssh) fzf --preview 'dig{}'	"$@" ;;
		*) fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
	esac

}
