vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = ThePrimeagen_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})

-- define function to execute git add . and prompt for commit message
function git_commit_and_push()
  -- execute git add .
  vim.cmd('silent !git add .')

  -- prompt for commit message
  local commit_msg = vim.fn.input('Commit message: ')

  -- execute git commit with commit message
  vim.fn.system('git commit -m "' .. commit_msg .. '"')

  -- push changes using fugitive
  vim.fn.system('git push')
end

-- map <leader>gp to execute git_commit_and_push()
vim.api.nvim_set_keymap('n', '<leader>gp', ':lua git_commit_and_push()<CR>', { noremap = true, silent = true })
