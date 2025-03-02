{ lib, config, ... }:

let
  cfg = config.${lib.name}.editor;
in
{
  imports = [
    ./completion
    ./git

    ./leap.nix
    ./which-key.nix
  ];

  options.${lib.name}.editor = {
    enable = lib.mkEnableOption "editor";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.editor = {
      completion.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      leap.enable = lib.mkDefault true;
      which-key.enable = lib.mkDefault true;
    };
  };
}
