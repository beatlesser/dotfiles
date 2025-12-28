{ mylib, ... }@args:
{
  hjem = {
    extraModules = mylib.importAllFrom ./.;
    specialArgs = args;
  };
}
