local clip_setup = require("clipboard-image").setup
local paste_img = require("clipboard-image.paste").paste_img
local mock = require "luassert.mock"
print(vim.fn.getcwd())
describe("this plugin", function()
  it("should paste correctly with the default setup", function()
    -- Idk why but test start at line 0. So I move it to line 1 with this
    vim.cmd [[norm o]]
    clip_setup { default = { img_name = "image" }}
    paste_img()

    local current_line = vim.fn.getline('.')
    assert.are.equal("img/image.png", current_line)
  end)
end)
