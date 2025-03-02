{ lib, config, pkgs, ... }:

let
  cfg = config.${lib.name}.coding.extra.template-string-nvim;
in
{
  options.${lib.name}.coding.extra.template-string-nvim = {
    enable = lib.mkEnableOption "template-string-nvim";
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = with pkgs.vimPlugins; [
      template-string-nvim
    ];
  };
}
