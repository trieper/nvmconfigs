package tree_sitter_snippets_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_snippets "github.com/tree-sitter/tree-sitter-snippets/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_snippets.Language())
	if language == nil {
		t.Errorf("Error loading Snippets grammar")
	}
}
