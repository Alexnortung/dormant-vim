lib:
rec {
  name = "dormant-vim";
  mkEnableKeymaps = pluginName: lib.mkEnableOption "Enable default ${name} keymaps for ${pluginName}";
}
