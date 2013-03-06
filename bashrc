[[ -f /etc/profile ]] && source /etc/profile

DOT="${HOME}/.dot"
MODS="${DOT}/modules"
PATH="${DOT}/bin:~/Sandbox/bin:~/Work/bin:/sbin:/usr/sbin:${PATH}"

source_module() {
	local MODPATH
	local MODRC
	MODPATH="${MODS}/${1}"
	MODRC="${MODPATH}/bashrc"
	if [[ -e "$MODRC" ]]; then
		source $MODRC
	fi
}

ww() {
    which work &> /dev/null || return
    eval `work $@`
}

pygrep() {
	grep -s "$@" $(find ./ -name '*.py')
}

pyegrep() {
	egrep -s "$@" $(find ./ -name '*.py')
}
jgrep() {
	grep -s "$@" $(find ./ -name '*.java')
}

jegrep() {
	egrep -s "$@" $(find ./ -name '*.java')
}

for MOD in $(ls "$MODS"); do
	source_module "$MOD"
done

set -o vi
bind -m vi-insert "\C-l":clear-screen
alias grep="grep -s --color"
alias egrep="egrep --color"

stty start ""
stty stop ""

