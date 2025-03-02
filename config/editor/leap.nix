{ lib, config, pkgs, ... }:

let
  cfg = config.${lib.name}.editor.leap;
in
{
  options.${lib.name}.editor.leap = {
    enable = lib.mkEnableOption "leap";
  };

  config = lib.mkIf cfg.enable {
    plugins.leap = {
      enable = true;
      addDefaultMappings = true;
    };
  };
}
