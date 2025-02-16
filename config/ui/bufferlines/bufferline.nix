{ lib, config, ... }:
let
  cfg = config.${lib.name}.bufferlines.bufferline;
in
{
  options.${lib.name}.bufferlines.bufferline = {
    enable = lib.mkEnableOption "Enable bufferline";

    keymaps = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable default keymaps";
      };

      afterLeader = lib.mkOption {
        type = lib.types.str;
        default = "b";
        description = "The key after the leader key to trigger the bufferline keymaps";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    plugins.web-devicons = {
      enable = true;
    };

    plugins.bufferline = {
      enable = true;
    };

    keymaps =
      let
        leader = "<leader>${cfg.keymaps.afterLeader}";
        # Lazyvim Keymaps
        # Key	Description	Mode
        # <leader>bl	Delete Buffers to the Left	n
        # <leader>bp	Toggle Pin	n
        # <leader>bP	Delete Non-Pinned Buffers	n
        # <leader>br	Delete Buffers to the Right	n
        # [b	Prev Buffer	n
        # [B	Move buffer prev	n
        # ]b	Next Buffer	n
        # ]B	Move buffer next	n
        # <S-h>	Prev Buffer	n
        # <S-l>	Next Buffer	n
        lazyvimSharedKeys = [
          {
            mode = "n";
            key = "${leader}l";
            action = "<cmd>BufferLineCloseLeft<CR>";
            options = {
              desc = "Delete Buffers to the Left";
            };
          }
          {
            mode = "n";
            key = "${leader}p";
            action = "<cmd>BufferLineTogglePin<CR>";
            options = {
              desc = "Toggle Pin";
            };
          }
          # {
          #   mode = "n";
          #   key = "${leader}bP";
          #   options = {
          #     desc = "Delete Non-Pinned Buffers";
          #   };
          # }
          {
            mode = "n";
            key = "${leader}r";
            action = "<cmd>BufferLineCloseRight<CR>";
            options = {
              desc = "Delete Buffers to the Right";
            };
          }

        ];
        lazyvimKeys = lazyvimSharedKeys ++ [
          {
            mode = "n";
            key = "[b";
            action = "<cmd>BufferLineCyclePrev<CR>";
            options = {
              desc = "Prev Buffer";
            };
          }
          {
            mode = "n";
            key = "[B";
            action = "<cmd>BufferLineMovePrev<CR>";
            options = {
              desc = "Move buffer prev";
            };
          }
          {
            mode = "n";
            key = "]b";
            action = "<cmd>BufferLineCycleNext<CR>";
            options = {
              desc = "Next Buffer";
            };
          }
          {
            mode = "n";
            key = "]B";
            action = "<cmd>BufferLineMoveNext<CR>";
            options = {
              desc = "Move buffer next";
            };
          }
          {
            mode = "n";
            key = "<S-h>";
            action = "<cmd>BufferLineCyclePrev<CR>";
            options = {
              desc = "Prev Buffer";
            };
          }
          {
            mode = "n";
            key = "<S-l>";
            action = "<cmd>BufferLineCycleNext<CR>";
            options = {
              desc = "Next Buffer";
            };
          }
        ];

        customKeys = lazyvimSharedKeys ++ [
          {
            mode = "n";
            key = "<A-h>";
            action = "<cmd>BufferLineCyclePrev<CR>";
            options = {
              desc = "Prev Buffer";
            };
          }
          {
            mode = "n";
            key = "<A-l>";
            action = "<cmd>BufferLineCycleNext<CR>";
            options = {
              desc = "Next Buffer";
            };
          }
          {
            mode = "n";
            key = "<A-H>";
            action = "<cmd>BufferLineMovePrev<CR>";
            options = {
              desc = "Move buffer prev";
            };
          }
          {
            mode = "n";
            key = "<A-L>";
            action = "<cmd>BufferLineMoveNext<CR>";
            options = {
              desc = "Move buffer next";
            };
          }
        ];
      in
      lib.mkIf cfg.keymaps.enable customKeys;
  };
}
