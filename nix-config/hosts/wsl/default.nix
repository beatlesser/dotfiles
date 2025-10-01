{myLib, ...}: {
  imports = myLib.collectPaths ./. // [../../system];
}
