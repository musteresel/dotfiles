


shopt -s nocaseglob # Case insensitive globbing
shopt -s cdspell # Correct spelling when cd'ing
shopt -s autocd # cd **/foo to ./baz/bar/foo
shopt -s globstar # Recursive globbing: echo */**.c


alias l='ls -lF --color'
alias la='ls -laF --color'
alias ls='command ls --color'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias dotfiles='git --git-dir=~/.dotfiles.git --work-tree=~'
complete -o default -o nospace -F _git dotfiles # Inherit git completion
