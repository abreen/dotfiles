function fish_right_prompt
    set_color purple
    tput sitm
    hostname | cut -d '.' -f 1
    tput ritm
    set_color normal
end
