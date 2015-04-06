function fish_right_prompt
    set_color purple
    tput sitm
    __fish_git_prompt
    tput ritm
    set_color normal
end
