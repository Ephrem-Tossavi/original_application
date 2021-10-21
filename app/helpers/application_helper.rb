module ApplicationHelper

    def markdown(text)
        options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks, :tables, :highlight, :underline, :quote, :superscript]
        Markdown.new(text, *options).to_html.html_safe
    end
end
