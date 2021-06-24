self: super: {
  jdk = super.jdk11_headless;

  mvn2nix = self.callPackage ./derivation.nix { };

  mvn2nix-bootstrap = self.callPackage ./derivation.nix { bootstrap = true; };

  maven-jdk8 = super.maven.override { jdk = super.jdk8; };

  mvn2nix-jdk8 = self.callPackage ./derivation.nix {
    jdk = super.jdk8;
    maven = self.maven-jdk8;
  };

  mvn2nix-jdk8-bootstrap = self.callPackage ./derivation.nix {
    jdk = super.jdk8;
    maven = self.maven-jdk8;
    bootstrap = true;
  };

  buildMavenRepository =
    (self.callPackage ./maven.nix { }).buildMavenRepository;

  buildMavenRepositoryFromLockFile =
    (self.callPackage ./maven.nix { }).buildMavenRepositoryFromLockFile;
}
