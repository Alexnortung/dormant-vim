{ lib, config, ... }:

let
  cfg = config.${lib.name}.coding.extra.ts-comments;
in
{
  options.${lib.name}.coding.extra.ts-comments = {
    enable = lib.mkEnableOption "ts-comments";
  };

  config = lib.mkIf cfg.enable {
    plugins.ts-comments = {
      enable = true;
    };
  };
}
