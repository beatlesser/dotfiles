{lib, ...}: rec {
  excludePaths = [
    "default.nix"
    "variables.nix"
  ];

  pathFilter = path: _type:
    (_type == "directory")
    || (!(builtins.elem path excludePaths) && lib.strings.hasSuffix ".nix" path);

  genPaths = dir:
    builtins.attrNames (
      lib.filterAttrs pathFilter (builtins.readDir dir)
    );

  genImports = dir: builtins.map(path: (dir + "/${path}")) (genPaths dir);
}
