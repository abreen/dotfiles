function fish_prompt
    set_color green
    echo -n (hname)
    set_color blue
    printf ' %s ' (prompt_pwd)
    set_color normal
end

function hname
    if hostname | grep 'wireless' 1>/dev/null
        echo 'W'
    else
        hostname | cut -d . -f 1
    end
end
