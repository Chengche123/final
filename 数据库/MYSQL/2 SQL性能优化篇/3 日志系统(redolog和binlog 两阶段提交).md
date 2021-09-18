1 redo log:
    一: 如果每一次的更新操作都需要写进磁盘，整个过程IO成本、查找成本都很高。
    二: WAL Write-Ahead Logging: **先写日志，再写磁盘**
        利用 WAL 技术，数据库将随机写转换成了顺序写，大大提升了数据库的性能。
    (框架)三: 当有一条记录需要更新的时候，**InnoDB引擎会先把记录写到redo log里面，并更新内存,在适当的时候将这个操作记录更新到磁盘里面**
    四: crash-safe: 即使数据库发生异常重启，之前提交的记录都不会丢失

2 redolog和binlog的区别:
    一: **redo log 是 InnoDB 引擎特有的**；**binlog** 是 MySQL 的 Server 层实现的，**所有引擎都可以使用**。
    二: binlog 日志只能用于归档,没有 crash-safe 能力
    三: redo log 是物理日志，binlog 是逻辑日志
    (框架)四: **redo log 是循环写的，空间固定会用完；**
        **binlog 是可以追加写入的**。“追加写”是指 binlog 文件写到一定大小后会切换到下一个，并不会覆盖以前的日志。

3 两阶段提交:
    一: 将 redo log 的写入拆成了两个步骤：prepare 和 commit，这就是"两阶段提交"。
    (框架)二: redo log 和 binlog 都可以用于表示事务的提交状态，而两阶段提交就是让这两个状态保持逻辑上的一致。

4 参数:
    一: redo log: innodb_flush_log_at_trx_commit 设置成 1 的时候，表示每次事务的 redo log 都直接持久化到磁盘
    二: binlog: sync_binlog 这个参数设置成 1 的时候，表示每次事务的 binlog 都持久化到磁盘



