" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/theo/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/theo/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/theo/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/theo/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/theo/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  firenvim = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["floating.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/floating.nvim"
  },
  ["jsonc.vim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/jsonc.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-proj"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/nvim-proj"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  onebuddy = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/onebuddy"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  syntastic = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/syntastic"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-horizon"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/vim-horizon"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/theo/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
