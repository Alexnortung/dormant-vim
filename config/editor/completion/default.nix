{ lib, config, ... }:

let
  cfg = config.${lib.name}.editor.completion;
in
{
  imports = [
    ./cmp.nix
    ./snippets
  ];

  options.${lib.name}.editor.completion = {
    enable = lib.mkEnableOption "completion";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.editor.completion = {
      cmp.enable = lib.mkDefault true;
      snippets.enable = lib.mkDefault true;
    };
  };
}
