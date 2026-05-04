if status is-interactive # Commands to run in interactive sessions can go here

    [ -n $(command -v zoxide) ] && zoxide init fish | source

    [ -n $(command -v starship) ] && starship init fish | source

end

