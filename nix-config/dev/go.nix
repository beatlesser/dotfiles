{unstable, ...}: {
  packages = (
    with unstable; [
      go
      gotools # goimports, godoc, etc.
      golangci-lint # https://github.com/golangci/golangci-lint
    ]
  );

  env = {
    GOPATH = "$HOME/.config/go:$GOPATH";
    PATH = "$GOPATH/bin:$PATH";
  };

  shellHook = ''
    echo "🐹 Go environment loaded"
  '';
}
