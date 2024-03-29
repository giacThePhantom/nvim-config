-- local set = vim.keymap.set
-- vim.g.jukit_mappings = 0
-- -- Splits
-- set('n', '<leader>jso', ':call jukit#splits#output()<cr>', {silent = true})
-- set('n', '<leader>jst', ':call jukit#splits#term()<cr>', {silent = true})
-- set('n', '<leader>jsh', ':call jukit#splits#history()<cr>', {silent = true})
-- set('n', '<leader>jsoh', ':call jukit#splits#output_and_history()<cr>', {silent = true})
-- set('n', '<leader>jshd', ':call jukit#splits#close_history()<cr>', {silent = true})
-- set('n', '<leader>jsod', ':call jukit#splits#close_output_split()<cr>', {silent = true})
-- set('n', '<leader>jsohd', ':call jukit#splits#close_output_and_history(1)<cr>', {silent = true})
-- set('n', '<leader>jslo', ':call jukit#splits#show_last_cell_output(1)<cr>', {silent = true})
-- set('n', '<leader>jshs', ':call jukit#splits#out_hist_scroll(1)<cr>', {silent = true})
-- set('n', '<leader>jshS', ':call jukit#splits#out_hist_scroll(0)<cr>', {silent = true})
-- set('n', '<leader>jsah', ':call jukit#splits#toggle_auto_hist()<cr>', {silent = true})
-- set('n', '<leader>jssl', ':call jukit#layouts#set_layout()<cr>', {silent = true})
-- -- Sending code
-- set('n', '<leader>jsc', ':call jukit#send#section(0)<cr>', {silent = true})
-- set('n', '<leader>jsl', ':call jukit#send#line()<cr>', {silent = true})
-- set('v', '<leader>jss', ':<C-U>call jukit#send#selection()<cr>', {silent = true})
-- set('n', '<leader>jscc', ':call jukit#send#until_current_section()<cr>', {silent = true})
-- set('n', '<leader>jsl', ':call jukit#send#all()<cr>', {silent = true})
-- -- Cells
-- set('n', '<leader>jco', ':call jukit#cells#create_below(0)<cr>', {silent = true})
-- set('n', '<leader>jcO', ':call jukit#cells#create_above(0)<cr>', {silent = true})
-- set('n', '<leader>jct', ':call jukit#cells#create_below(1)<cr>', {silent = true})
-- set('n', '<leader>jcT', ':call jukit#cells#create_above(1)<cr>', {silent = true})
-- set('n', '<leader>jcd', ':call jukit#cells#delete()<cr>', {silent = true})
-- set('n', '<leader>jcs', ':call jukit#cells#split()<cr>', {silent = true})
-- set('n', '<leader>jcM', ':call jukit#cells#merge_above()<cr>', {silent = true})
-- set('n', '<leader>jcm', ':call jukit#cells#merge_below()<cr>', {silent = true})
-- set('n', '<leader>jck', ':call jukit#cells#move_up()<cr>', {silent = true})
-- set('n', '<leader>jcj', ':call jukit#cells#move_down()<cr>', {silent = true})
-- set('n', '<leader>jJ', ':call jukit#cells#jump_to_next_cell()<cr>', {silent = true})
-- set('n', '<leader>jK', ':call jukit#cells#jump_to_previous_cell()<cr>', {silent = true})
-- set('n', '<leader>jddo', ':call jukit#cells#delete_outputs(0)<cr>', {silent = true})
-- set('n', '<leader>jdda', ':call jukit#cells#delete_outputs(1)<cr>', {silent = true})
-- -- Ipynb conversion
-- set('n', '<leader>jic', ':call jukit#convert#notebook_convert("jupyter-notebook")<cr>', {silent = true})
-- set('n', '<leader>jih', ":call jukit#convert#save_nb_to_file(0,1,'html')<cr>", {silent = true})
-- set('n', '<leader>jirht', ":call jukit#convert#save_nb_to_file(1,1,'html')<cr>", {silent = true})
-- set('n', '<leader>jipd', ":call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>", {silent = true})
-- set('n', '<leader>jirpd', ":call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>", {silent = true})
