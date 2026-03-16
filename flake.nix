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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "tool";
    pname = "trufflehog";
    vendorHash = "sha256-HB3jD0mNjHFyoHmOxxPJ6UdKbVwC5PJ9d2LHJ3DEhXo=";
    proxyVendor = true;
    description = "TruffleHog - find leaked credentials and secrets in code repositories";
    homepage = "https://github.com/pleme-io/trufflehog";
  };
}
