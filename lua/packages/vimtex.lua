vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_toc_config = {
    mode = 1,
    fold_enable = 0,
    hide_line_numbers = 1,
    resize = 0,
    refresh_always = 1,
    show_help = 0,
    show_numbers = 1,
    split_pos = 'leftabove',
    split_width = 30,
    tocdeth = 3,
    indent_levels = 1,
    todo_sorted = 1,
}

vim.wo.conceallevel = 2
vim.g.tex_conceal = 'abdmgs'

vim.g.vimtex_compiler_latexmk = {
         aux_dir = '',
         out_dir = 'build',
         callback = 1,
         continuous = 1,
         executable = 'latexmk',
         hooks = {},
         options = {
           '-verbose',
           '-file-line-error',
           '-synctex=1',
           '-interaction=nonstopmode',
         },
        }

vim.g.vimtex_quickfix_open_on_warning = 0
