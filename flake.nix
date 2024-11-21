{
  description = "peglah's dwmblocks-async build";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
      name = "dwmblocks-async";
      src = self;
      nativeBuildInputs = [ pkgs.pkg-config ];
      buildInputs = [ pkgs.libxcb-util ];
      makeFlags = [ "PREFIX=$(out)" ];
      installTargets = "install";
    };
  };
}
