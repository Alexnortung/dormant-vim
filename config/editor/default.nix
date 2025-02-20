{ lib, config, ... }:

let
  cfg = config.${lib.name}.editor;
in
{
  imports = [
    ./completion/cmp.nix
  ];

  options.${lib.name}.editor = {
    enable = lib.mkEnableOption "editor";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.editor.completion.cmp.enable = lib.mkDefault true;
  };
}
