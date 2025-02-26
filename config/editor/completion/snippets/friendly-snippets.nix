{ lib, config, ... }:

let
  cfg = config.${lib.name}.editor.completion.snippets.friendly-snippets;
in
{
  options.${lib.name}.editor.completion.snippets.friendly-snippets = {
    enable = lib.mkEnableOption "friendly-snippets";
  };

  config = lib.mkIf cfg.enable {
    plugins.friendly-snippets = {
      enable = true;
    };
  };
}
