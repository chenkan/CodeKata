### 创建

When sending the second parameter, the same object will be used as the value for all the array elements:

```
a = Array.new(2, Hash.new)
a # => [{}, {}]
a[0]['cat'] = 'feline'
a # => [{"cat"=>"feline"}, {"cat"=>"feline"}]
a[1]['cat'] = 'Felix'
a # => [{"cat"=>"Felix"}, {"cat"=>"Felix"}]
```

Since all the Array elements store the same hash, changes to one of them will affect them all.

If multiple copies are what you want, you should use the block version which uses the result of that block each time an element of the array needs to be initialized:

```
a = Array.new(2) { Hash.new }
a[0]['cat'] = 'feline'
a # => [{"cat"=>"feline"}, {}]
```

### 赋值

```
a = Array.new
a[4] = "4";                 #=> [nil, nil, nil, nil, "4"]
a[0, 3] = [ 'a', 'b', 'c' ] #=> ["a", "b", "c", nil, "4"]
a[1..2] = [ 1, 2 ]          #=> ["a", 1, 2, nil, "4"]
a[0, 2] = "?"               #=> ["?", 2, nil, "4"]
a[0..2] = "A"               #=> ["A", "4"]
a[-1]   = "Z"               #=> ["A", "Z"]
a[1..-1] = nil              #=> ["A", nil]
a[1..-1] = []               #=> ["A"]
```

### 运算

```
[ 1, 2, 3 ] + [ 4, 5 ]    #=> [ 1, 2, 3, 4, 5 ]
[ 1, 1, 2, 2, 3, 3, 4, 5 ] - [ 1, 2, 4 ]  #=>  [ 3, 3, 5 ]
[ 1, 2, 3 ] * 3    #=> [ 1, 2, 3, 1, 2, 3, 1, 2, 3 ]
[ 1, 1, 3, 5 ] & [ 1, 2, 3 ]   #=> [ 1, 3 ]
```

### 增减

```
[ 1, 2 ] << "c" << "d" << [ 3, 4 ] #=>  [ 1, 2, "c", "d", [ 3, 4 ] ]
```

```
a = [ "a", "b", "b", "b", "c" ]
a.delete("b")                   #=> "b"
```

```
a = %w( ant bat cat dog )
a.delete_at(2)    #=> "cat"
a                 #=> ["ant", "bat", "dog"]
```

```
a = [ "a", "b", "c" ]
a.delete_if {|x| x >= "b" }   #=> ["a"]
```

```
a = %w{ a b c d }
a.insert(2, 99)         #=> ["a", "b", 99, "c", "d"]
a.insert(-2, 1, 2, 3)   #=> ["a", "b", 99, "c", 1, 2, 3, "d"]
```

### 取值

```
a = [ "a", "b", "c", "d", "e" ]
a[1, 2]                #=> [ "b", "c" ]
a[1..3]                #=> [ "b", "c", "d" ]
a[-3, 3]               #=> [ "c", "d", "e" ]
```

```
a = [ "q", "r", "s", "t" ]
a.first     #=> "q"
a.first(2)  #=> ["q", "r"]
```

```
a = [ "w", "x", "y", "z" ]
a.last     #=> "z"
a.last(2)  #=> ["y", "z"]
```

### 变换

```
a = [ "a", "b", "c", "d" ]
a.collect {|x| x + "!" }   #=> ["a!", "b!", "c!", "d!"]
a                          #=> ["a", "b", "c", "d"]
```

```
a = [ "a", "b", "c", "d" ]
a.collect! {|x| x + "!" }
a             #=>  [ "a!", "b!", "c!", "d!" ]
```

```
[ "a", "b" ].concat( ["c", "d"] ) #=> [ "a", "b", "c", "d" ]
```

```
[ "a", "b", "c" ].join        #=> "abc"
[ "a", "b", "c" ].join("-")   #=> "a-b-c"
```

### 统计与查询

```
ary = [1, 2, 4, 2]
ary.count             #=> 4
ary.count(2)          #=> 2
ary.count{|x|x%2==0}  #=> 3
```

```
a = [ "a", "b", "c" ]
a.include?("b")   #=> true
a.include?("z")   #=> false
```

```
[ 1, 2, 3, 4, 5 ].length   #=> 5
```

```
[].empty?   #=> true
```

### 其它

```
a = [ "a", "b", "c" ]
a.each {|x| puts x }
a = [ "a", "b", "c" ]
a.each_index {|x| puts x } # passes the index of the element instead of the element itself
```

### TODO 
pop(n) → new_ary