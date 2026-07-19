function fish_prompt -d "Write out the prompt"
        set pwd (prompt_pwd | string split /)[-1]
        printf '[%s %s%s%s]$ ' (prompt_login) (set_color yellow) $pwd (set_color normal)
end
