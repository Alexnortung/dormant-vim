{ lib, config, ... }:

let
  cfg = config.${lib.name}.editor.completion.snippets.luasnip;
in
{
  options.${lib.name}.editor.completion.snippets.luasnip = {
    enable = lib.mkEnableOption "luasnip";
  };

  config = lib.mkIf cfg.enable {
    plugins.luasnip = {
      enable = true;
      fromVscode = [
        { }
      ];
    };
  };
}
