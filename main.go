package main

import (
	"context"
	"encoding/base64"
	"encoding/hex"
	"errors"
	"fmt"
	"log"
	_ "net/http/pprof"
	"os"
	"os/signal"
	"runtime"
	"runtime/pprof"
	"sync"
	"syscall"
	"time"
	"unicode/utf8"
)

func main() {
	fmt.Println(base64.RawStdEncoding.EncodeToString([]byte("Hello Gopher!")))
	fmt.Println(hex.EncodeToString([]byte("Hello Gopher!")))
}

func main3() {
	var wg sync.WaitGroup
	type result struct {
		v   int
		err error
	}
	ch := make(chan *result)
	ctx, cancel := context.WithCancel(context.Background())

	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(v int, c context.Context) {
			defer wg.Done()

			select {
			case <-c.Done():
				return
			default:
			}

			if v == 5 {
				ch <- &result{
					v:   v,
					err: errors.New("test"),
				}
			} else {
				ch <- &result{
					v:   v,
					err: nil,
				}
			}

		}(i, ctx)
	}

	go func() {
		wg.Wait()
		close(ch)
	}()

	for v := range ch {
		if v.err != nil {
			cancel()
			log.Println(v.err)
			for range ch {
			}
			return
		}

		fmt.Println(v.v)
	}
}

func main2() {
	log.Println("ok")

	now := time.Now()
	for i := 1; i <= 100; i++ {
		for j := 1; j <= 1000; j++ {
			for k := 1; k <= 10000; k++ {

			}
		}
	}
	fmt.Println(time.Now().Sub(now))

	now = time.Now()
	for i := 1; i <= 10000; i++ {
		for j := 1; j <= 1000; j++ {
			for k := 1; k <= 100; k++ {

			}
		}
	}
	fmt.Println(time.Now().Sub(now))
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
