{unstable, ...}: {
  packages = (
    with unstable; [
      rustup
      rust-analyzer
      rustfmt
      clippy
    ]
  );

  env = {
    RUSTUP_HOME = "$HOME/.rustup";
    CARGO_HOME = "$HOME/.cargo";
    PATH = "$CARGO_HOME/bin:$PATH";
  };

  shellHook = ''
    rustup default stable
    echo "🦀 Rust environment loaded"
  '';
}
