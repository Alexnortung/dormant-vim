{ lib, config, ... }:

let
  cfg = config.${lib.name}.dashboards;
in
{
  imports = [
    ./snacks.nix
  ];

  options.${lib.name}.dashboards = {
    enable = lib.mkEnableOption "Enable dashboards";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.dashboards.snacks.enable = true;
  };
}
