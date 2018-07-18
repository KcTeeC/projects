#
# ~/.bash_profile
#

# settings and options
set -o xtrace
set -0 nounset

set -o noclobber

shopt -s checkwinsize

shopt -s extglob
shopt -s dotglob
shopt -s nocaseglob

for f in $HOME/.bash*; do
	source $f;
done

[[ -f ~/.bashrc ]] && . ~/.bashrc
