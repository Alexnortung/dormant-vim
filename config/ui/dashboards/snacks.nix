{ lib, config, ... }:

let
  cfg = config.${lib.name}.dashboards.snacks;
in
{
  options.${lib.name}.dashboards.snacks = {
    enable = lib.mkEnableOption "Enable Snacks dashboard";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.snacks.enable = true;

    plugins.snacks.settings.dashboard = {
      preset = {
        header = "Welcome to ${lib.name}";
      };
    };
  };
}
