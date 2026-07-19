if status is-interactive 

    fish_config theme choose catppuccin-mocha

    [ -n $(command -v zoxide) ] && zoxide init fish | source
    [ -n $(command -v tv) ] && tv init fish | source
end

