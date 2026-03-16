{
  description = "TruffleHog - find leaked credentials and secrets in code repositories";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoTool = (import "${substrate}/lib/go-tool.nix").mkGoTool;
    in {
      packages.default = mkGoTool pkgs {
        pname = "trufflehog";
        version = "0.0.0-dev";
        src = self;
        proxyVendor = true;
        vendorHash = "sha256-HB3jD0mNjHFyoHmOxxPJ6UdKbVwC5PJ9d2LHJ3DEhXo=";
        description = "TruffleHog - find leaked credentials and secrets in code repositories";
        homepage = "https://github.com/pleme-io/trufflehog";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
