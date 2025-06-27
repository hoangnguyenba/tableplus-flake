{
  description = "Flake to install TablePlus AppImage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      tableplusAppImage = pkgs.fetchurl {
        url = "https://tableplus.com/release/linux/x64/TablePlus-x64.AppImage";
        sha256 = "02104v34p84yn1fpqy0pcy12b5a1vi1drb4sfarcq8d9da8hywp0";
      };

      tableplusBin = pkgs.writeShellScriptBin "tableplus" ''
        exec ${pkgs.appimage-run}/bin/appimage-run ${tableplusAppImage} "$@"
      '';
    in {
      packages.${system} = {
        tableplus = tableplusBin;
        default = tableplusBin;
      };
    };
}
