{ lib, config, pkgs, ... }:

let
  cfg = config.${lib.name}.coding.extra.editorconfig;
in
{
  options.${lib.name}.coding.extra.editorconfig = {
    enable = lib.mkEnableOption "editorconfig";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      editorconfig-nvim
    ];
  };
}
