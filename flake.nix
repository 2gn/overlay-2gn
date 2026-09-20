{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    netwatch = {
      url = "github:matthart1983/netwatch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dnsglobe = {
      url = "github:514-labs/dnsglobe";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    concord = {
      url = "github:chojs23/concord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pwndbg = {
      url = "github:pwndbg/pwndbg";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    diskwatch = {
      url = "github:matthart1983/diskwatch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vortix = {
      url = "github:Harry-kp/vortix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agent-skills.url = "github:Kyure-A/agent-skills-nix";

    anthropic-skills = {
      url = "github:anthropics/skills";
      flake = false;
    };

    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae = {
      url = "github:vicinaehq/vicinae";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-matlab = {
      url = "gitlab:doronbehar/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-cli-nix = {
      url = "github:joegoldin/antigravity-cli-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixfmt-rs = {
      url = "github:Mic92/nixfmt-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mandible = {
      url = "github:AS-FOSS/mandible";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, ... }: {
    overlays.default = final: prev:
      let
        packageFlakes = builtins.removeAttrs inputs [ "self" ]      ;
      in
        builtins.mapAttrs (name: flake: flake.packages.${prev.system}.default) packageFlakes;
  };
}
