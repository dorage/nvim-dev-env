# Neovim setup

### package manager

[vim-plug](https://github.com/junegunn/vim-plug)


### LSP configuration

[lsp-zero](https://lsp-zero.netlify.app/v3.x/)

[nvim-lspconfig-server\_configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

### Key

*lsp-zero*

| Keycode | Description |
|---|---|
| K | Displays hover information about the symbol under the cursor in a floating window. |
| gd | Jumps to the definition of the symbol under the cursor. |
| gD | Jumps to the declaration of the symbol under the cursor (some servers don |t support). |
| gi | Lists all the implementations for the symbol under the cursor in the quickfix window. |
| go | Jumps to the definition of the type of the symbol under the cursor. |
| gr | Lists all the references to the symbol under the cursor in the quickfix window. |
| gs | Displays signature information about the symbol under the cursor in a floating window. |
| \<F2> | Renames all references to the symbol under the cursor. |
| \<F3> | Format code in current buffer. |
| \<F4> | Selects a code action available at the current cursor position. |
| gl | Show diagnostics in a floating window. |
| [d | Move to the previous diagnostic in the current buffer. |
| ]d | Move to the next diagnostic. |

*panel*

| Keycode | Description |
|---|---|
| Ctrl + b | open nvim-tree |
| Ctrl + g | open lazygit |
| Ctrl + d | unlock zellij |

*tabline*

| Keycode | Description |
|---|---|
| Move to previous/next |
| Alt +  | | BufferPrevious |
| Alt + . | BufferNext |
| Re-order to previous/next |
| Alt + < | BufferMovePrevious |
| Alt + > | BufferMoveNext |
| Goto buffer in position... |
| Alt + 1 | BufferGoto 1 |
| Alt + 2 | BufferGoto 2 |
| Alt + 3 | BufferGoto 3 |
| Alt + 4 | BufferGoto 4 |
| Alt + 5 | BufferGoto 5 |
| Alt + 6 | BufferGoto 6 |
| Alt + 7 | BufferGoto 7 |
| Alt + 8 | BufferGoto 8 |
| Alt + 9 | BufferGoto 9 |
| Alt + 0 | BufferLast |
| Pin/unpin buffer |
| Alt + p | BufferPin |
| Close buffer |
| Alt + c | BufferClose |
| Magic buffer-picking mode |
| Ctrl + p | BufferPick |
| Sort automatically by... |
| Space + bb | BufferOrderByBufferNumber |
| Space + bd | BufferOrderByDirectory |
| Space + bl | BufferOrderByLanguage |
| Space + bw | BufferOrderByWindowNumber |

*completion*

| Keycode | Description |
|---|---|
| Tab | cmp_action.luasnip_supertab() |
| Shift + Tab | cmp_action.luasnip_shift_supertab() |
| Ctrl + y | cmp.mapping.confirm({select = false}) |
| Ctrl + e | cmp.mapping.abort() |
| Up | cmp.mapping.select_prev_item({behavior = select}) |
| Down | cmp.mapping.select_next_item({behavior = select}) |

*telescope*


| Keycode | Description |
|---|---|
| \ + ff | builtin.find_files |
| \ + fg | builtin.live_grep |
| \ + fb | builtin.buffers |
| \ + fh | builtin.help_tags |
