function restore --description 'Teleport to last saved directory'
    cd (cat ~/.lastdir)
end
