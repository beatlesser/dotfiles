{lib, ...}: {
  relativeToRootPath = lib.path.append ../.;

  collectPaths = prefix:
    builtins.map (path: (prefix + "/${path}")) (
      builtins.attrNames (
        lib.attrsets.filterAttrs (
          path:fileType: (
            (fileType == "directory") #include directory
            || (
              (path != "default.nix")
              && (lib.strings.hasSuffix ".nix") #include .nix files
            )
          )
        )
      ) (builtins.readDir prefix)
    );
}
