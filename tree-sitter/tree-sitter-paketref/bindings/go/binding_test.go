package tree_sitter_paketref_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_paketref "github.com/tree-sitter/tree-sitter-paketref/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_paketref.Language())
	if language == nil {
		t.Errorf("Error loading Paketref grammar")
	}
}
