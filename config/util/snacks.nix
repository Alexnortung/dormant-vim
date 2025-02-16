{ lib, config, ... }:

let
  cfg = config.${lib.name}.snacks;
in
{
  options.${lib.name}.snacks = {
    enable = lib.mkEnableOption "Enable snacks for ${lib.name}";
  };

  config = lib.mkIf cfg.enable {
    plugins.snacks.enable = true;
  };
}
