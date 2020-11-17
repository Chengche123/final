package main

import (
	"fmt"
	"io"
	"os"
)

type myT struct {
	x int
}

func main() {
	var x interface{} = os.Stdout
	var y io.Writer = os.Stdout
	fmt.Println(x == y) // true
}
