package main

import "fmt"

type anony struct {
	x, y int
}

type myType struct {
	*anony
	z, w int
}

type myType2 struct {
	anony
	z, w int
}

func main() {
	var x myType
	x.x = 1
	fmt.Println(x)
}
