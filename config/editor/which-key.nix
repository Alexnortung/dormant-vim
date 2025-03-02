{ lib, config, pkgs, ... }:

let
  cfg = config.${lib.name}.editor.which-key;
  optional = lib.optional;
in
{
  options.${lib.name}.editor.which-key = {
    enable = lib.mkEnableOption "which-key";
  };

  config = lib.mkIf cfg.enable {
    plugins.which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          group = "+";
          separator = ""; # ➜
        };
      };
    };
  };
}
