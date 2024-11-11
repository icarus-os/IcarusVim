local cmp_config = {
  "hrsh7th/nvim-cmp",
  --lazy = false, -- do it automatically
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    -- Pictograms added to the completion
    "onsails/lspkind.nvim",
    -- "lukas-reineke/cmp-under-comparator", -- Better sort completion items starting with underscore (Python)

    -- Completion Sources
    "hrsh7th/cmp-nvim-lua", -- for vim.lsp.* completions
    "hrsh7th/cmp-nvim-lsp-document-symbol", -- for autocompletions on `/` searches

    -- For luasnip
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Config
    PlugHook({
      "nvim-cmp",
      pre_load = function()
        -- Lazy load all vscode like snippets
        --require("luasnip/loaders/from_vscode").lazy_load()
      end,
      on_load = function()
        local cmp = require("cmp")

        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
        })
      end,
    }),
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    local has_words_before = function()
      unpack = unpack or table.unpack -- depends on the installation of lua
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
      preselect = cmp.PreselectMode.Item,
      --completion = { autocomplete = true }, -- Make completion only on demand
      enabled = function()
        local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
        if in_prompt then
          return false
        end

        -- Do NOT put completions inside comments or strings
        local context = require("cmp.config.context")
        return not (
          context.in_treesitter_capture("comment")
          or context.in_syntax_group("Comment")
          or context.in_treesitter_capture("string")
          or context.in_syntax_group("String")
        )
      end,
      window = {
        --completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      formatting = {
        format = function(entry, vim_item)
          -- Fancy icons and a name of kind
          vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-t>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Go to the previous portion of the snippet
        ["<A-bs>"] = cmp.mapping(function(fallback) -- ALT + Backspace
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Enter and go to the next part of the snippet
        ["<CR>"] = cmp.mapping(function(fallback) -- Enter
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- they way you will only jump inside the snippet region
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        --["<C-b>"] = cmp.mapping.scroll_docs(-4),  -- the mouse can do this
        --["<C-f>"] = cmp.mapping.scroll_docs(4),   -- the mouse can do this
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-i>"] = cmp.mapping.abort(), -- interpretation: CTRL + Insert (get back to insertion!!!)
        ["<Tab>"] = cmp.mapping.confirm({
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
    }
  end,
}

return cmp_config
