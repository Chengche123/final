0 **容器只是一种特殊的进程**

1 隔离(**Namespace**):
    一:
        在 Linux 系统中创建线程的系统调用是 clone(), 而当我们用 clone() 系统调用创建一个新进程时，就可以在参数中指定 CLONE_NEWPID 参数，比如：int pid = clone(main_function, stack_size, **CLONE_NEWPID | SIGCHLD**, NULL);
        这时，新创建的这个进程将会“看到”一个**全新的进程空间**，在这个进程空间里，它的PID是1。
    二:
        除了我们刚刚用到的 PID Namespace，Linux操作系统还提供了**Mount**、UTS、**IPC**、**Network** 和 **User**这些 Namespace，用来对各种不同的进程上下文进行“障眼法”操作。
        比如，Mount Namespace，用于让被隔离进程只看到当前 Namespace 里的挂载点信息；Network Namespace，用于让被隔离进程看到当前 Namespace 里的网络设备和配置。

2 限制(资源配额 **Cgroups**):
    一:
        Linux Cgroups 的全称是 Linux Control Group。它最主要的作用，就是限制一个进程组能够使用的资源上限，包括**CPU、内存、磁盘、网络带宽**等等。
    二:
        在 Linux 中Cgroups 给用户暴露出来的操作接口是**文件系统**，即它以文件和目录的方式组织在**操作系统的/sys/fs/cgroup**路径下。




