第一页
	1. 高吞吐量的分布式发布订阅消息系统, 易扩容的
	2. 一个实时数据流流处理的类库。 它不是一个框架， 和其他流处理框架（  Apache Flink ,  Spark Streaming ）相比它比较轻量级， 
	3. Confluent 是一个基于 Kafka 和 Kafka stream 做的流数据平台。 流处理和 Kafka 的概念都一样， 主要是提供了一套配置和管理工具， 然后可以很方便的搭建 Kafka 流处理框架

第二页
1. Topic：用于划分Message的逻辑概念，一个Topic可以分布在多个Broker上。
2. Partition：是Kafka中横向扩展和一切并行化的基础，每个Topic都至少被切分为1个Partition。
3. Offset：消息在Partition中的编号，编号顺序不跨Partition。
4. Consumer：用于从Broker中取出/消费Message。
5. Producer：用于往Broker中发送/生产Message， 同时它也要管理和每个 partition leader 之间的 load balance。
6. Replication：Kafka支持以Partition为单位对Message进行冗余备份，每个Partition都可以配置至少1个Replication(当仅1个Replication时即仅该Partition本身)。
7. Leader：每个Replication集合中的Partition都会选出一个唯一的Leader，所有的读写请求都由Leader处理。其他Replicas从Leader处把数据更新同步到本地，过程类似大家熟悉的MySQL中的Binlog同步。
8. Broker：Kafka中使用Broker来接受Producer和Consumer的请求，并把Message持久化到本地磁盘。

第三页
	1. broker， producer, consumer 上面都有些机制来优化这个吞吐量
	2. Replication 给消息做备份， 还有滚动重启
	3. 可以通过 consumer 和 partition 上的一些配置来模拟这两种消息模式、
	4.  kafka使用文件存储消息(append only log)
	5. Partition
第四页  高吞吐量
	1. Partition
	2. 压缩消息， GZ, SNAPPY、
	3. 延迟收发， producer， consumer 上面把消息 buffer 起来， 隔一段时间来收发， 或者 cache 到达多少size 的时候批量收发。
	4. Append log， ,因此磁盘检索的开支是较小的， 也是 buffer 消息， 统一 flush 到磁盘
	5. Consumer 和 producer 之间没有“路由层”
第五页   I/O 优化
	1. 如果在Heap内管理缓存，JVM的GC线程会频繁扫描Heap空间，带来不必要的开销。如果Heap过大，执行一次Full GC对系统的可用性来说将是极大的挑战。
	2. 如果Kafka重启，所有的In-Process Cache都会失效，而OS管理的PageCache依然可以继续使用。
	3. 利用操作系统的 pagecache 来做， 当上层有写操作时，操作系统只是将数据写入PageCache
	4. PageCache还只是第一步，Kafka为了进一步的优化性能还采用了Sendfile技术， 一般从硬盘读数据是需要四个系统调用
		1. OS从硬盘把数据读到内核区的PageCache。
		2. 用户进程把数据从内核区Copy到用户区。
		3. 然后用户进程再把数据写入到Socket，数据流入内核区的Socket Buffer上。
		4. OS再把数据从Buffer中Copy到网卡的Buffer上，这样完成一次发送
		节省了一次系统调用
第六页　高可用
	1. Replication, 如果producer 发送失败， 会尝试重新发送， 但是有可能导致小子堵在那里， 或者消息丢掉了（基于 producer 消息发送的配置）。 在没有Replication的情况下，一旦某机器宕机或者某个Broker停止工作则会造成整个系统的可用性降低
	2. Leader election： Producer和Consumer只与这个Leader交互，其它Replica作为Follower从Leader中复制数据。原来的方式是：所有Follower都在ZooKeeper上设置一个Watch，一旦Leader宕机，其对应的ephemeral znode会自动删除，此时所有Follower都尝试创建该节点，而创建成功者（ZooKeeper保证只有一个能创建成功）即是新的Leader，其它Replica即为Follower。
	3. controller会将Leader的改变直接通过RPC的方式通知需为为此作为响应的Broker。同时controller也负责增删Topic以及Replica的重新分配。
	4. 通过 zookeeper 来管理 producer，broker， consumer 的加入和删除，  producer 也可以通过 zookeeper 来发现 broker， 无需配置 broker list
	5. http://www.infoq.com/cn/articles/kafka-analysis-part-2/
第七页　消息模式
	1. 介绍两种模式
	2. 并不是真正支持这两种模式， 但是它可以模拟出累似的模式来。对于 topic partition, 是一个 consumer group 来消费， 可以有多个 group 的 consumer来消费， 但是同一个 group 只能有一个 consumer。 如果一个组里的 consumer 都消费同一个 topic 的不同 partition， 那就是 queue， 如果每个 consumer 都在不同的组里面， 那就类似于 broadcast
第八页  消息存储
	1. Kafka把topic中一个parition大文件分成多个小文件段，通过多个小文件段，就容易定期清除或删除已经消费完文件，减少磁盘占用。
	2. 通过索引信息可以快速定位message和确定response的最大大小。
	3. 通过index元数据全部映射到memory，可以避免segment file的IO磁盘操作。
第九页 高并发
第十页  负载均衡
	1. 三个方面的负载均衡， 一个 是producer, broker， consumer
	2. Producer和 broker 端的 负载均衡
	3. Consumer， broker, consumer 的删减都会触发。 通过 controler 来进行。 目前consumer rebalance的控制策略是由每一个consumer通过Zookeeper完成的。一个 consumer 可能会监听多个 partition

