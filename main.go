package main

import (
	"container/heap"
	"fmt"
)

type intHeap []int

func (h intHeap) Less(i, j int) bool { return h[i] < h[j] }
func (h intHeap) Len() int           { return len(h) }
func (h intHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *intHeap) Push(x interface{}) {
	*h = append(*h, x.(int))
}
func (h *intHeap) Pop() interface{} {
	n := len(*h)
	x := (*h)[n-1]
	*h = (*h)[:n-1]
	return x
}

func main() {
	h := &intHeap{2, 4, 5, 4}
	heap.Init(h)
	heap.Push(h, 1)
	for range *h {
		fmt.Printf("%d\t", heap.Pop(h)) // 1       2       4       4       5
	}
}
