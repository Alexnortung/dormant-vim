{ lib, config, ... }:

let
  cfg = config.${lib.name}.editor;
in
{
  imports = [
    ./completion
  ];

  options.${lib.name}.editor = {
    enable = lib.mkEnableOption "editor";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.editor.completion.enable = lib.mkDefault true;
  };
}
