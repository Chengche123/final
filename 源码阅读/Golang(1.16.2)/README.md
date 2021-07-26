# ABI

闭包浅析 https://www.processon.com/view/link/60feb59de0b34d4962322ee5  
手写plan9到汇编 64位 https://www.processon.com/view/link/60feb5cbe0b34d4962322f32  
栈帧视图和调整栈代码 https://www.processon.com/view/link/60feb5dc5653bb3ddc1456f9  

# runtime
## gmp
### g
#### g的创建和systemstack函数
一 创建newg https://www.processon.com/view/link/60feb63a1e085366ea5097d5  
二 尝试将newg放进p的本地队列 https://www.processon.com/view/link/60feb6471efad46a20a6eebd  

### m
newm https://www.processon.com/view/link/60feb68d0791294ae0a2d173  
stopm https://www.processon.com/view/link/60feb69a1e085366ea509873  
sysmon https://www.processon.com/view/link/60feb6a7637689719d2823f9  

### m和g
gopark https://www.processon.com/view/link/60feb6c5f346fb1b4f62a934  
goready https://www.processon.com/view/link/60feb6d2637689719d28243f  

### m和p
p换一个m绑定并schedule https://www.processon.com/view/link/60feb707637689719d28249f  
p直接与m解绑, m阻塞 https://www.processon.com/view/link/60feb71f637689719d2824be  

### p
p的初始化 https://www.processon.com/view/link/5e08353fe4b0bb7c58d60486  
