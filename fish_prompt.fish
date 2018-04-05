function fish_prompt

    set -g __fish_prompt_char "⋊ "

    set -l last_status $status

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints true

    set -l normal (set_color normal)
    set -l magenta (set_color magenta)
    set -l cyan (set_color cyan)
    set -l green (set_color green)
    set -l red (set_color red)
    # directory_color
    # repository_color

    if test "$VIRTUAL_ENV"
        set venv_name (basename $VIRTUAL_ENV)
        set venv "[$venv_name]: "
    else
        set venv " "
    end

    set -l status_color $magenta
    if [ $last_status -ne 0 ]
        set status_color $red
    end

    # Top
    echo -n $cyan$USER$normal at $green$__fish_prompt_hostname$normal in $green(prompt_pwd)$normal
    __fish_git_prompt


    echo


    echo -n $status_color$__fish_prompt_char$normal$venv$normal

end
