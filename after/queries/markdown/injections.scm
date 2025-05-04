; Tree-sitter query for Markdown
(; Match snippet block
(fenced_code_block
  (info_string) @info
  (#eq? @info "snippet")
  (code_fence_content) @injection.content
  (#set! @injection.content "python"))
; Match endsnippet block (ignored for injection content)
(fenced_code_block
  (info_string) @info
  (#eq? @info "endsnippet")))
