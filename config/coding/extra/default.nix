{ lib, config, ... }:

let
  cfg = config.${lib.name}.coding.extra;
in
{
  imports = [
    ./autopairs.nix
    ./ts-comments.nix
  ];

  options.${lib.name}.coding.extra = {
    enable = lib.mkEnableOption "Enable coding extras";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.coding.extra = {
      autopairs.enable = lib.mkDefault true;
      ts-comments.enable = lib.mkDefault true;
    };
  };
}
