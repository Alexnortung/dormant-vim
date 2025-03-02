{ lib, config, ... }:
let
  cfg = config.${lib.name}.ui;
in
{
  imports = [
    ./bufferlines
    ./dashboards
    ./filetrees
  ];

  options.${lib.name}.ui = {
    enable = lib.mkEnableOption "Enable UI components for ${lib.name}";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.ui = {
      bufferlines.enable = lib.mkDefault true;
      dashboards.enable = lib.mkDefault true;
      filetrees.enable = lib.mkDefault true;
    };
  };
}
