function home --description '"E.T. phone home!"'
    who -m | tr -s ' ' '\t' | rev | cut -f 1 | rev | tr -d '()'
end
