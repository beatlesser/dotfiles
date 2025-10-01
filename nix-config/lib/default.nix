{lib, ...}: let
  excludePaths = [
    "default.nix"
    "vars.nix"
  ];

  pathFilter = path: _type:
    (_type == "directory")
    || (!(builtins.elem path excludePaths) && lib.strings.hasSuffix ".nix" path);

  genPaths = dir:
    builtins.attrNames (
      lib.filterAttrs pathFilter (builtins.readDir dir)
    );
in {
  genImports = dir: builtins.map (path: (dir + "/${path}")) (genPaths dir);
}
