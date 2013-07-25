# User specific environment and startup programs

PATH=$PATH:$HOME/git/todo
export PATH

todos=`cat ~/todo | wc -l`

if [ "$todos" -gt 0 ]; then
  echo "You have $todos outstanding todos."
fi
