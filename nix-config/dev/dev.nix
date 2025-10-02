{ unstable, ... }:
unstable.mkShell {
  buildInputs =
    # --- Node.js/JS ---
    (with unstable; [
      nodejs_22
      node2nix
    ])
    ++ (with unstable.nodePackages; [
      yarn
      pnpm
      eslint_d
    ])
    ++
      # --- Python ---
      (with unstable; [
        python312
        pyright
      ])
    ++ (with unstable.python312Packages; [
      uv
      requests
      pyquery
      gpustat
      ruff
    ])
    ++
      # --- C/C++ ---
      (with unstable; [
        gcc
        gdb
        clang
        lldb
        cmake
      ])
    ++
      # --- Lua ---
      (with unstable; [
        lua5_4_compat
        luarocks
      ])
    ++
      # --- Rust ---
      (with unstable; [
        rust-analyzer
        rustfmt
        clippy
      ]);

  shellHook = ''
    echo "🛠️ Welcome to the Dev Shell"
    export PYTHONBREAKPOINT=ipdb.set_trace
  '';
}
