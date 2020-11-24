package main

import (
	"fmt"
	"time"
)

func main() {
	timer := time.NewTicker(1 * time.Second)
	for {
		<-timer.C
		fmt.Println(time.Now())
		time.Sleep(3 * time.Second)
		<-timer.C
		fmt.Println(time.Now())
		<-timer.C
		fmt.Println(time.Now())
	}
}
