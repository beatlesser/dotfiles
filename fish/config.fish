function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Set default editor 
    set -gx EDITOR nvim

    #fzf integration
    fzf --fish | source

    #zoxide integration
    zoxide init fish | source

    # Use starship
    starship init fish | source

    #alias
    alias vi 'nvim'
    alias ls 'lsd'
    alias df 'duf'
    alias du 'dust'
    alias cd 'z'
    
end

