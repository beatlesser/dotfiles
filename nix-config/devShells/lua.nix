{ unstable, ... }:

{
  packages = (
    with unstable;
    [
      lua5_4_compat
      luarocks
    ]
  );

  shellHook = ''
    echo "🌙 Lua environment loaded"
  '';
}
