return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
        enable_autocmd = false,
    },
    init = function()
        vim.filetype.get_option = function(filetype, option)
            if option ~= "commentstring" then
                return vim.filetype.get_option(filetype, option)
            end

            local calculated_comment_string = require(
                "ts_context_commentstring.internal"
            ).calculate_commentstring()

            if calculated_comment_string then
                return calculated_comment_string
            end

            return vim.filetype.get_option(filetype, option)
        end
    end,
}
