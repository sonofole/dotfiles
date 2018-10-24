
function lazygit {
	param([string]$commitMsg)

	git add .
	git commit -am "$($commitMsg)"
	git push
}

function gitfs {
	git fetch
	git status
}

. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
. $env:github_posh_git\profile.example.ps1

ssh-add.exe ~/.ssh/github_rsa

