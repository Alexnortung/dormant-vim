{ lib, config, ... }:

let
  cfg = config.${lib.name};
in
{
  imports = [
    ./coding
    ./editor
    ./treesitter
    ./ui
    ./util

    ./options.nix
  ];

  options.${lib.name} = {
    # enable = lib.mkEnableOption "Enable ${lib.name} defaults";
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable ${lib.name} defaults";
    };
  };

  config = lib.mkIf cfg.enable {
    ${lib.name} = {
      coding.enable = lib.mkDefault true;
      editor.enable = lib.mkDefault true;
      treesitter.enable = lib.mkDefault true;
      ui.enable = lib.mkDefault true;
      options.enable = lib.mkDefault true;
    };
  };
}
