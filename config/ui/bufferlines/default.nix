{ lib, config, ... }:
let
  cfg = config.${lib.name}.bufferlines;
in
{
  imports = [
    ./bufferline.nix
  ];

  options.${lib.name}.bufferlines = {
    enable = lib.mkEnableOption "Enable ${lib.name} default bufferline";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.bufferlines.bufferline.enable = lib.mkDefault true;
  };
}
