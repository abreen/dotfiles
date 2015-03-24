function restore --description 'Teleport to last saved directory'
    cd (cat $HOME/.lastdir)
end
