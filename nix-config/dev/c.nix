{ unstable, ... }:
{
  packages =
    with unstable;
    [
      clang-tools
      cmake
      codespell
      conan
      cppcheck
      doxygen
      gtest
      lcov
      vcpkg
      vcpkg-tool
    ]
    ++ (if system == "aarch64-darwin" then [ ] else [ gdb ]);
  nativeBuildInputs = [ unstable.pkg-config ];
  env = {
    LIBRARY_PATH = "${unstable.zlib}/lib";
    CPATH = "${unstable.zlib.dev}/include";
  };
  shellHook = ''
    echo "🛠️ C/C++ environment loaded"
  '';
}
