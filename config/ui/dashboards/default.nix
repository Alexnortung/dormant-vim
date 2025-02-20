{ lib, config, ... }:

let
  cfg = config.${lib.name}.ui.dashboards;
in
{
  imports = [
    ./snacks.nix
  ];

  options.${lib.name}.ui.dashboards = {
    enable = lib.mkEnableOption "Enable dashboards";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.ui.dashboards.snacks.enable = lib.mkDefault true;
  };
}
