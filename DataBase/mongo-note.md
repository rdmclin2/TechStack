title: "mongodb-start"
tags: [mongodb]

---

##书籍
- [mongodb权威指南](http://product.dangdang.com/23399173.html)
- [深入学习mongodb](http://product.dangdang.com/22591445.html)
- [mongdo小书](https://github.com/justinyhuang/the-little-mongodb-book-cn/blob/master/mongodb.md)

##指令
- 启动mongodb并启动数据库,`mongod --dbpath Data/db`
> $ mongodb默认的数据目录为/data/db/,需要手动创建，也可以用--dbpath参数指定db路径

## shell命令
- `mongo`  进入 mongo shell,
> 顺带说一句，因为我们用的是JavaScript的shell，如果您执行一个命令而忘了加上()，您看到的将是这个命令的实现而并没有执行它。知道这个，您在这么做并看到以function(...){开头的信息的时候就不会觉得惊讶了。比如说如果您输入db.help（后面没有括弧），你就将看到help命令的具体实现。

- `use` 用全局命令use来切换数据库
> 输入use learn。这个数据库是否存在并没有关系，我们创建第一个集合后这个learn数据库就会生成的

### db操作
操作对象`db`来执行针对当前数据库的操作
- db.help() 显示db的帮助信息
- db.stats() 显示数据库状态
- db.getCollectionNames() 获取collection的列表
> system.indexes在每个数据库中都会创建，它包含了数据库中的索引信息。

### collection操作
操作对象db.COLLECTION_NAME来执行针对某一给集合的操作
- db.unicorns.help() 显示collection的帮助信息
- db.unicorns.count() 显示集合中document的数量
- db.unicorns.insert({...}), 如`db.unicorns.insert({name: 'Aurora', gender: 'f', weight: 450})`
> 因为集合是无模式的，我们不需要专门去创建它。我们要做的只是把一个文档插入一个新的集合，这个集合就生成了。您可以像下面一样调用insert命令去插入一个文档：

- db.unicorns.find() 得到集合的文档列表
> 请注意，除了您在文档中输入的各个域，还有一个一个叫做_id的域。每一个文档都必须有一个独立的_id域。您可以自己创建，也可以让MongoDB为您生成这个ObjectId。大部分情况下您还是会让MongoDB为您生成ID的。默认情况下，
`_id`域是被索引了的——这就是为什么会有system.indexes创建出来的原因

- db.unicorns.remove({}) 删除整个集合

### 选择器 find
`{field: value}`用来查找所有field等于value的文档。通过`{field1: value1, field2: value2}`的形式可以实现与操作。$lt、$lte、$gt、$gte以及$e分别表示小于、小于或等于、大于、大于或等于以及不等于。
例如:
```
db.unicorns.find({gender: 'm', weight: {$gt: 700}})
//或者 (效果并不完全一样，仅用来为了演示不同的方法)
db.unicorns.find({gender: {$ne: 'f'}, weight: {$gte: 701}})
```

$exists操作符用于匹配一个域是否存在，比如下面的命令：
```
db.unicorns.find({vampires: {$exists: false}})
```

如果需要或而不是与，可以用$or操作符并作用于需要进行或操作的数组：
```
db.unicorns.find({gender: 'f', $or: [{loves: 'apple'}, {loves: 'orange'}, {weight: {$lt: 500}}]})
//以上命令返回所有或者喜欢苹果，或者喜欢橙子，或者体重小于500磅的雌性独角兽。
```

loves域是一个数组。在MongoDB中数组是一级对象(first class object)。这是非常非常有用的功能。一旦用过，没有了它你可能都不知道怎么活下去。更有意思的是基于数组的选择是非常简单的：{loves: 'watermelon'}就会找到loves中有watermelon这个值的所有文档。


MongoDB为_id域生成的ObjectId也是可以被选择的，就像这样：
```
db.unicorns.find({_id: ObjectId("TheObjectId")})
```
