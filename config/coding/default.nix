{ lib, config, ... }:
let
  cfg = config.${lib.name}.coding;
in
{
  imports = [
    ./extra
    ./lsp
  ];

  options.${lib.name}.coding = {
    enable = lib.mkEnableOption "Enable ${lib.name} default coding tools";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.coding = {
      extra.enable = lib.mkDefault true;
      lsp-nvim.enable = lib.mkDefault true;
    };
  };
}
