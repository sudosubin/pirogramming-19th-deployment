{
  description = "sudosubin/pirogramming-19th-deployment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
  };

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs.lib) genAttrs platforms;
      forAllSystems = f: genAttrs platforms.unix (system: f (import nixpkgs { inherit system; }));

    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          venvDir = "./.venv";
          buildInputs = with pkgs; [
            python311
            python311Packages.venvShellHook
          ];
        };
      });
    };
}
