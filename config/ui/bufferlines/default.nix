{ lib, config, ... }:
let
  cfg = config.${lib.name}.ui.bufferlines;
in
{
  imports = [
    ./bufferline.nix
  ];

  options.${lib.name}.ui.bufferlines = {
    enable = lib.mkEnableOption "Enable ${lib.name} default bufferline";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.ui.bufferlines.bufferline.enable = lib.mkDefault true;
  };
}
