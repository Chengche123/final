package main

import (
	"fmt"
)

type fooS struct {
	f1 uint32
	f2 byte
}

type barS struct {
	f1 uint32
	f2 byte
	f3 string
}

func output(int) (int, int, int) // 汇编函数声明

func main() {

	a, b, c := output(987654321)
	fmt.Println(a, b, c)
}
