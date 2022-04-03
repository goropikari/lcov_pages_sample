package foo_test

import (
	"testing"

	"github.com/goropikari/lcov_pages_sample/foo"
)

func TestFoo(t *testing.T) {
	t.Run("test foo", func(t *testing.T) {
		if foo.Foo() != "foo" {
			t.Error("failed")
		}
	})
}
