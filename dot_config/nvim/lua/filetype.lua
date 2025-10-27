local match_shebang = function(pattern, filetype)
  return function(_, bufnr)
    local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
    if first_line:match(pattern) then
      return filetype
    end
  end
end

vim.filetype.add({
  pattern = {
    ["[%a-_]*"] = match_shebang("^#!.*/env%s+-S%s+uv%s+run%s+%-%-script", "python"),
  },
})

