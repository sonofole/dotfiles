[ -z "$PS1" ] && return

alias enw='emacs -nw'

function cl {
	builtin cd "$@" && ls -aF 
}

function gitfs {
	git fetch && git status
}

function lazygit {
	git add .
	git commit -a -m "$1"
	git push
}

alias enw='emacs -nw'

function cl {
	builtin cd "$@" && ls -aF 
}

function gitfs {
	git fetch && git status
}

function lazygit {
	git add .
	git commit -a -m "$1"
	git push
}
