{ unstable, ... }:

let
  python-packages = unstable.python3.withPackages (
    ps: with ps; [
      uv
      requests
      pyquery # needed for hyprland-dots Weather script
      gpustat # gpu status
      ruff
    ]
  );
in
{
  packages = with unstable; [
    python-packages
    pyright
  ];
  env = {
    PYTHONBREAKPOINT = "ipdb.set_trace";
  };
  shellHook = ''
    echo "🐍 Python environment loaded"
  '';
}
