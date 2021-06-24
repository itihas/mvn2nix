{
  description = "Easily package your Maven Java application with the Nix package manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    derivations = import ./default.nix {inherit nixpkgs; inherit system;};
  in
  rec {
    legacyPackages.x86_64-linux = {
      mvn2nix = derivations.mvn2nix;
      mvn2nix-jdk8 = derivations.mvn2nix-jdk8;
      mvn2nix-jdk8-bootstrap = derivations.mvn2nix-jdk8-bootstrap;
      mvn2nix-bootstrap = derivations.mvn2nix-bootstrap;
      buildMavenRepository = derivations.buildMavenRepository;
      buildMavenRepositoryFromLockFile = derivations.buildMavenRepositoryFromLockFile;
    };
    packages.x86_64-linux = { mvn2nix-jdk8 = derivations.mvn2nix-jdk8;};
    defaultPackage.x86_64-linux = legacyPackages.x86_64-linux.mvn2nix;
  };
}
