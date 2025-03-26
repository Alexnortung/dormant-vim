{ lib, config, pkgs, ... }:

let
  cfg = config.${lib.name}.editor.telescope;
in
{
  options.${lib.name}.editor.telescope = {
    enable = lib.mkEnableOption "Enable telescope.nvim";
  };

  config = lib.mkIf cfg.enable {
    plugins.telescope = {
      enable = true;

    };
  };
}
