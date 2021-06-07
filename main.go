package main

//go:noinline
func foo(a int32) {}

func output(int) (int, int, int) // 汇编函数声明

//go:noinline
func add(a, b int32) (int32, bool) {
	var c int32 = 999
	foo(c)
	return a + b, true
}

func main() {

	add(10, 32)
	output(999)
}
