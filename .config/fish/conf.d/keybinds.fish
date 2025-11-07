#! /usr/bin/env fish
function fish_change_vi_mode
  # enable vim mode
  fish_vi_key_bindings
  # jk for escape
  bind -M insert -m default j,k cancel repaint-mode
  # wait 'k' for 200ms
  set -g fish_sequence_key_delay_ms 200
end

# disable jk mode
# fish_change_vi_mode
