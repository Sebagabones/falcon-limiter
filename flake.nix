{
  description = "devshell for falcon-limiter";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell rec {
        nativeBuildInputs = with pkgs; [
          uv
          ruff
          (python313.withPackages (ps: with ps; [ falcon ]))
        ];

        shellHook = ''
          export PYTHONPATH=$(pwd)
        '';
      };
    };
}
