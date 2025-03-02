{ lib, config, pkgs, ... }:

let
  cfg = config.${lib.name}.coding.commenting;
in
{
  options.${lib.name}.coding.commenting = {
    enable = lib.mkEnableOption "Enable commenting";
  };

  config = lib.mkIf cfg.enable {
    plugins.ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = false;
    };
  };
}

