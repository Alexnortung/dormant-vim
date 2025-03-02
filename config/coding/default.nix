{ lib, config, ... }:
let
  cfg = config.${lib.name}.coding;
in
{
  imports = [
    ./commenting
    ./extra
    ./formatting
    ./linting
    ./lsp
  ];

  options.${lib.name}.coding = {
    enable = lib.mkEnableOption "Enable ${lib.name} default coding tools";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.coding = {
      commenting.enable = lib.mkDefault true;
      extra.enable = lib.mkDefault true;
      formatting.enable = lib.mkDefault true;
      linting.enable = lib.mkDefault true;
      lsp-nvim.enable = lib.mkDefault true;
    };
  };
}
