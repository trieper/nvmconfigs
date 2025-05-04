;query
((python_global_block_concat) @injection.content
  (#set! injection.language "python"))

;query
((python_inline) @injection.content
  (#set! injection.language "python"))

; (#set! injection.language @language")))
;extends

; (source_file
;   language: (language_name) @language_name
;   (snippet_block
;     ((text) @injection.content
;       (#set! injection.language @language_name))))
;
; Irgendein problem mit alias wenn man @language_name verwenden will
(source_file
  language: (language_name) @language_name
  (snippet_block
    ((text) @injection.content
      (#eq? @language_name "sql")
      (#set! injection.language "sql"))))

(source_file
  language: (language_name) @language_name
  (snippet_block
    ((text) @injection.content
      (#eq? @language_name "fsharp")
      (#set! injection.language "fsharp"))))

(source_file
  language: (language_name) @language_name
  (snippet_block
    ((text) @injection.content
      (#eq? @language_name "python")
      (#set! injection.language "python"))))

(source_file
  language: (language_name) @language_name
  (snippet_block
    ((text) @injection.content
      (#eq? @language_name "lua")
      (#set! injection.language "lua"))))

;
; (#match? @comment "^#+( )*[tT][yY][pP][eE][sS][cC][rR][iI][pP][tT]( )*")
; (#set! injection.language "typescript")))))
