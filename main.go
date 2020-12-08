package main

import (
	"log"
	_ "net/http/pprof"
	"os"
	"os/signal"
	"runtime"
	"runtime/pprof"
	"syscall"
	"test/testmodule"
	"time"
	"unicode/utf8"
)

func main() {
	var i testmodule.Pair
	i.Next()
}

func main1() {
	runtime.SetBlockProfileRate(1)

	f, err := os.Create("cpu.prof")
	if err != nil {
		log.Panic(err)
	}
	defer f.Close()
	err = pprof.StartCPUProfile(f)
	if err != nil {
		log.Panic(err)
	}
	defer pprof.StopCPUProfile()

	chs := make(chan struct{}, 2)
	done := make(chan struct{})
	tempC := make(chan struct{})
	go func() {
		tempC <- struct{}{}

		sig := make(chan os.Signal, 1)
		signal.Notify(sig, syscall.SIGTERM, os.Kill, os.Interrupt)
		<-sig

		close(done)
	}()
	<-tempC

	go func() {
		defer func() {
			chs <- struct{}{}
		}()

		var result []string
	loop:
		for {
			select {
			case <-done:
				break loop
			default:
			}
			time.Sleep(1 * time.Second)
			result = append(result, reverse1("你好abc123哈哈"))
		}
	}()

	go func() {
		defer func() {
			chs <- struct{}{}
		}()

		var result []string
	loop:
		for {
			select {
			case <-done:
				break loop
			default:
			}
			time.Sleep(1 * time.Second)
			result = append(result, reverse2("你好abc123哈哈"))
		}
	}()

	// 	var result []string
	// loop:
	// 	for {
	// 		select {
	// 		case <-done:
	// 			break loop
	// 		default:
	// 		}
	// 		result = append(result, reverse1("你好abc123哈哈"))
	// 		time.Sleep(1 * time.Second)
	// 	}

	<-chs
	<-chs

	blockFile, err := os.Create("block.prof")
	if err != nil {
		panic(err)
	}
	err = pprof.Lookup("block").WriteTo(blockFile, 0)
	if err != nil {
		panic(err)
	}
	blockFile.Close()

	memf, err := os.Create("mem.prof")
	if err != nil {
		panic(err)
	}
	err = pprof.WriteHeapProfile(memf)
	if err != nil {
		panic(err)
	}
	memf.Close()
}

func reverse1(s string) string {
	rs := []rune(s)
	for p, r := 0, len(rs)-1; p < r; p, r = p+1, r-1 {
		rs[p], rs[r] = rs[r], rs[p]
	}
	return string(rs)
}

func reverse2(src string) string {
	n := utf8.RuneCountInString(src)
	rs := make([]rune, n)
	for _, v := range src {
		rs = append([]rune{v}, rs...)
	}
	return string(rs[:n])
	// var newS string
	// for _, v := range src {
	// 	newS = string(v) + newS
	// }
	// return newS
}
