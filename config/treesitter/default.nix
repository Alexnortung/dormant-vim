{ lib, config, ... }:

let
  cfg = config.${lib.name}.treesitter;
in
{
  options.${lib.name}.treesitter = {
    enable = lib.mkEnableOption "Enable treesitter";
  };

  config = lib.mkIf cfg.enable {
    plugins.treesitter = {
      enable = true;
      nixGrammars = true;
      # settings = {
      #   auto_install = true;
      #   ensure_installed = [
      #     "bash"
      #     "c"
      #     "diff"
      #     "html"
      #     "javascript"
      #     "jsdoc"
      #     "json"
      #     "jsonc"
      #     "lua"
      #     "luadoc"
      #     "luap"
      #     "markdown"
      #     "markdown_inline"
      #     "printf"
      #     "python"
      #     "query"
      #     "regex"
      #     "toml"
      #     "tsx"
      #     "typescript"
      #     "vim"
      #     "vimdoc"
      #     "xml"
      #     "yaml"
      #   ];
      # };
    };
  };
}
