{
  lib,
  stable,
  unstable,
  ...
}: let
  modules = {
    default = [
      "node"
      "python"
      "c"
      "rust"
      "lua"
      "go"
    ];
    dev = [
      "node"
      "python"
    ];
    node = ["node"];
    python = ["python"];
    rust = ["rust"];
    lua = ["lua"];
    go = ["go"];
    c = ["c"];
  };
  extrasPkgs = with stable; [
    fish
  ];

  loadModules = moduleList: let
    imported = map (name: import ./${name}.nix {inherit stable unstable;}) moduleList;
  in {
    packages = lib.flatten (map (m: m.packages or []) imported) ++ extrasPkgs;
    nativeBuildInputs = lib.flatten (map (m: m.nativeBuildInputs or []) imported);
    propagatedBuildInputs = lib.flatten (map (m: m.propagatedBuildInputs or []) imported);
    propagatedNativeBuildInputs = lib.flatten (
      map (m: m.propagatedNativeBuildInputs or []) imported
    );
    inputsFrom = lib.flatten (map (m: m.inputsFrom or []) imported);
    env = builtins.foldl' (acc: m: acc // (m.env or {})) {} imported;
    shellHook = builtins.concatStringsSep "\n" (map (m: m.shellHook or "") imported);
  };

  shells = builtins.mapAttrs (_name: mods: loadModules mods) modules;
in
  builtins.mapAttrs (
    name: s:
      stable.mkShell {
        buildInputs = s.packages;
        nativeBuildInputs = s.nativeBuildInputs;
        propagatedBuildInputs = s.propagatedBuildInputs;
        propagatedNativeBuildInputs = s.propagatedNativeBuildInputs;
        inputsFrom = s.inputsFrom;

        shellHook = ''
          ${s.shellHook}
          ${builtins.concatStringsSep "\n" (
            map (k: "export ${k}=\"${s.env.${k}}\"") (builtins.attrNames s.env)
          )}
          echo "✅ ${name} DevShell ready"
        '';
      }
  )
  shells
