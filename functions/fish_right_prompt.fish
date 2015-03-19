function fish_right_prompt
    if test $PWD = $HOME;
        return
    end

    set_color blue
    tput sitm
    prompt_pwd
    tput ritm
    set_color normal
end
