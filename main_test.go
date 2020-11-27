package main

import "testing"

func TestReverse(t *testing.T) {
	input := "你好abc123哈哈"
	want := "哈哈321cba好你"
	got := reverse1(input)
	if got != want {
		t.Errorf("reverse1(%q) = %q , want %q", input, got, want)
	}
	got = reverse2(input)
	if got != want {
		t.Errorf("reverse2(%q) = %q , want %q", input, got, want)
	}
}

func BenchmarkReverse1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		reverse1("你好abc123哈哈")
	}
}

func BenchmarkReverse2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		reverse2("你好abc123哈哈")
	}
}
