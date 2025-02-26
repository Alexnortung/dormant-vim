{ lib, config, ... }:

let
  cfg = config.${lib.name}.editor.completion.snippets;
in
{
  imports = [
    ./friendly-snippets.nix
    ./luasnip.nix
  ];

  options.${lib.name}.editor.completion.snippets = {
    enable = lib.mkEnableOption "snippets";
  };

  config = lib.mkIf cfg.enable {
    ${lib.name}.editor.completion.snippets = {
      luasnip.enable = lib.mkDefault true;
      friendly-snippets.enable = lib.mkDefault true;
    };
  };
}
