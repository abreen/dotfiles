# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/git/todo
export PATH

if [ `hostname` = "ice3" ]; then
  PS1='\[\e[44m\e[37m\e[1m\]nice\[\e[2m\] · \W → \[\e[0m\] '
elif [ `hostname` = "csa2" ]; then
  PS1='\[\e[42m\e[37m\e[1m\]\h\[\e[2m\] · \W → \[\e[0m\] '
else
  PS1='\[\e[40m\e[1m\]tuvok\[\e[2m\] · \W → \[\e[0m\] '
fi


todos=`cat ~/todo | wc -l`

if [ "$todos" -gt 0 ]; then
  echo "You have $todos outstanding todos."
fi
