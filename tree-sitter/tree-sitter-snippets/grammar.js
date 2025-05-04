// Tree-sitter grammar for parsing snippet files
// TODO: bash-style comment lines somewhere between blocks
module.exports = grammar({
  name: 'snippets',

  extras: $ => [
    /\s/, // Whitespace
  ],

  rules: {
    source_file: $ => seq(
      $._language_declaration,
      optional($.python_global_block),
      repeat($.snippet_block),
    ),

    _language_declaration: $ => seq(
      '#', 
      'language=',
      field("language", $.language_name)
    ),

    python_global_block: $ => seq(
      'global',
      /.*/, // Ignore arbitrary tex9t after snippet
      field('python', $.python_global_block_concat),
      'endglobal'
    ),
    python_global_block_concat: $ => seq(
      repeat1($._line)
    ),

    _line: $ => /.+/,

    language_name: $ => /[a-zA-Z_][a-zA-Z0-9_]*/,

    snippet_block: $ => seq(
      'snippet',
      /.*/, // Ignore arbitrary text after snippet
      repeat(choice($.text, $._python_code)),
      'endsnippet'
    ),

    text: $ => /[^`\n]+/, // Matches text that doesn't contain backticks

    _python_code: $ => seq(
      '`!p',  // Start marker for Python code
      field('python_inline', optional($.python_inline)), // Python code content
      '`' // End marker for Python code
    ),

    python_inline: $ => /[^`]+/ // Matches content inside the Python code block

  }
});
