local map = vim.keymap.set

map('v', "<leader>jv", ":<C-u>MagmaEvaluateVisual<CR>")
map('n', "<leader>jl", ":MagmaEvaluateLine<CR>")
map('n', "<leader>jp", ":MagmaEvaluateOperator<CR>")
map('n', "<leader>jc", ":MagmaReevaluateCell<CR>")
map('n', "<leader>jd", ":MagmaDelete<CR>")
map('n', "<leader>jo", ":MagmaShowOutput<CR>")
