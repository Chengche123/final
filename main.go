package main

import (
	"net"
	"time"
)

func main() {
	lis, err := net.Listen("tcp", "127.0.0.1:28001")
	if err != nil {
		panic(err)
	}
	defer lis.Close()

	for {
		time.Sleep(3 * time.Second)
	}
}
