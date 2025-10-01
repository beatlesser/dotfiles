{
  inputs,
  myLib,
  ...
}: {
  imports = myLib.genImports ./. ++ [inputs.nixos-wsl.nixosModules.default];
}
