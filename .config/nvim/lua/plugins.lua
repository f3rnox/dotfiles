return {
  "AlessandroYorba/Alduin",
  "endel/vim-github-colorscheme",
  "junegunn/seoul256.vim",
  "rakr/vim-one",
  "luisiacc/gruvbox-baby",
  "rebelot/kanagawa.nvim",
  "NLKNguyen/papercolor-theme",
  "bluz71/vim-moonfly-colors",
  "yonlu/omni.vim",
  "uncleTen276/dark_flat.nvim",
  "nyoom-engineering/oxocarbon.nvim",
  "yasukotelin/shirotelin",
  "savq/melange-nvim",
  "scottmckendry/cyberdream.nvim",
  "yorik1984/newpaper.nvim",
  "toupeira/vim-desertink",
  "nanotech/jellybeans.vim",
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_enable_italic = true
    end
  },
  {
    'sainnhe/edge',
    lazy = false,
    config = function()
      vim.g.edge_enable_italic = true
    end
  },
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_bold = 1
    end,
  },
  {
    "glepnir/zephyr-nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', opt = true },
  },
  {
    "rakr/vim-two-firewatch",
    config = function()
      vim.g.two_firewatch_italics = 1
    end,
  },
  {
    "serhez/teide.nvim",
    opts = {},
  },
  {
    "tyrannicaltoucan/vim-deep-space",
    config = function()
      vim.g.deepspace_italics = 1
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFocus",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    opts = {
      sort_by = "case_sensitive",
      view = {
        width = 30,
        side = "left",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "lua_ls", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    opts = {},
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "isort", "black" },
          lua = { "luaformatter" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
        })
      })
    end
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = "<leader>t"
    },
  },
  {
    "ashfinal/qfview.nvim",
    event = "UIEnter",
    config = true,
  },
  {
    "wurli/visimatch.nvim",
    opts = {},
  },
  "rktjmp/highlight-current-n.nvim",
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    opts = {},
  },
  "mhinz/vim-grepper",
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
  },
  {
    "ya2s/nvim-cursorline",
    opts = {},
  },
  {
    "josstei/whisk.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
  "schickling/vim-bufonly",
  {
    "chrisgrieser/nvim-puppeteer",
    lazy = false,
  },
  "sitiom/nvim-numbertoggle",
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    setup = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    opts = {},
    config = function()
      require("themery").setup({
        themes = {
          {
            name = "Gruvbox dark",
            colorscheme = "gruvbox-baby",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Seoul256 dark",
            colorscheme = "seoul256",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Seoul256 light",
            colorscheme = "seoul256-light",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Github light",
            colorscheme = "github",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Alduin",
            colorscheme = "alduin",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "One dark",
            colorscheme = "one",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "One light",
            colorscheme = "one",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Kanagawa light",
            colorscheme = "kanagawa",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Kanagawa dark",
            colorscheme = "kanagawa",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "PaperColor dark",
            colorscheme = "PaperColor",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "PaperColor light",
            colorscheme = "PaperColor",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Moonfly",
            colorscheme = "moonfly",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Omni",
            colorscheme = "omni",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Edge dark",
            colorscheme = "edge",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Edge light",
            colorscheme = "edge",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Aurora",
            colorscheme = "aurora",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Zephyr",
            colorscheme = "zephyr",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Teide",
            colorscheme = "teide",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Teide dark",
            colorscheme = "teide-dark",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Teide darker",
            colorscheme = "teide-darker",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Teide dimmed",
            colorscheme = "teide-dimmed",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Teide light",
            colorscheme = "teide-light",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Deep space",
            colorscheme = "deep-space",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Dark flat",
            colorscheme = "dark_flat",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Oxocarbon dark",
            colorscheme = "oxocarbon",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Oxocarbon light",
            colorscheme = "oxocarbon",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Shirotelin",
            colorscheme = "shirotelin",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Melange light",
            colorscheme = "melange",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Melange dark",
            colorscheme = "melange",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Everforest dark",
            colorscheme = "everforest",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Everforest light",
            colorscheme = "everforest",
            before = [[
              vim.opt.background = "light"
            ]],
          },
          {
            name = "Cyberdream",
            colorscheme = "cyberdream",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Desertink",
            colorscheme = "desertink",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
          {
            name = "Jellybeans",
            colorscheme = "jellybeans",
            before = [[
              vim.opt.background = "dark"
            ]],
          },
        }
      })
    end,
  },
  {
    "cdmill/focus.nvim",
    cmd = { "Focus", "Zen", "Narrow" },
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    opts = {}
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    'andymass/vim-matchup',
    opts = {
      treesitter = {
        stopline = 500,
      },
    },
  },
  "sbdchd/neoformat",
  {
    "felixcuello/neovim-cursor",
    opts = {}
  }
}
