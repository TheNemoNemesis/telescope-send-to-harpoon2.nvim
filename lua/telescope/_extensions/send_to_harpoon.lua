local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("This plugin requires nvim-telescope/telescope.nvim")
end

local has_harpoon, harpoon = pcall(require, "harpoon")
if not has_harpoon then
    error("This plugin requires theprimeagen/harpoon")
end

local actions = require("telescope.actions")
local actions_state = require("telescope.actions.state")
local from_entry = require("telescope.from_entry")

local get_selections = function(prompt_bufnr)
    local picker = actions_state.get_current_picker(prompt_bufnr)
    local selections = {}

    if #picker:get_multi_selection() > 0 then
        selections = picker:get_multi_selection()
    else
        table.insert(selections, actions_state.get_selected_entry())
    end

    return selections
end

local send_selected_to_harpoon = function(prompt_bufnr)
    local selections = get_selections(prompt_bufnr)
    local projectpath = vim.fn.getcwd() .. "/"
    local projectpathlen = string.len(projectpath) + 1

    for _, entry in ipairs(selections) do
        local filename = from_entry.path(entry, false, false)

        if filename then
            if string.find(filename, projectpath, 1, true) ~= nil then 
              filename = string.sub(filename, projectpathlen)
            end 
            harpoon:list():add({value=filename, context={col=1, row=1}})
        end
    end

    actions.close(prompt_bufnr)
end

return telescope.register_extension({
    exports = {
        actions = {
            send_selected_to_harpoon = send_selected_to_harpoon
        }
    }
})
