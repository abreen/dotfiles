function fish_right_prompt
    set_color blue
    tput sitm
    prompt_pwd
    tput ritm
    set_color normal
end
