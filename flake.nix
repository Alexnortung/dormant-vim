{
  description = "dormant-vim is a set of default configurations for neovim using nixvim";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , nixvim
    , flake-utils
    , ...
    }@inputs:
    let
      config = import ./config; # import the module directly
      # Enable unfree packages
      nixpkgsConfig = {
        allowUnfree = true;
      };
    in
    {
      nixvimModule = config;
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        pkgs = import nixpkgs {
          inherit system;
          config = nixpkgsConfig;
          # overlays = [
          #   (final: prev: {
          #     lib = prev.lib // (import ./lib prev);
          #   })
          # ];
        };
        customLib = nixpkgs.lib.extend (final: prev: (import ./lib prev));
        customLibForNixvim = customLib.extend nixvim.lib.overlay;
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit self;
            lib = customLibForNixvim;
          };
        };
      in
      {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = pkgs.lib.name;
          };
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };

        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
