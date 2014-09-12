function fish_right_prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname | cut -d . -f 1)
    end

    set_color cyan
    printf '%s ' (date +%R)
    set_color blue
    printf '%s' $__fish_prompt_hostname
    set_color normal
end
