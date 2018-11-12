//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension Int {
    mutating func square() {
        self = self * self
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
//        // 一、基础
//        self.base()
//        // 二、运算符
//        self.baseOperators()
//        // 三、字符串
//        self.stringFunc()
//        // 四、集合
//        self.collection()
//        // 五、IF、FOR_IN、WHILE、REPEAT_WHILE、WHITCH、
//        // 结束控制 continue、break、fallthrough、return、throw
//        self.control()
//        // 六、方法
//        self.functions()
//        // 七、Closures
//        self.closures()
//        // 八、枚举
//        self.enumFuc()
        // 九、结构体、类
//        self.structAndClass()
        // 十、错误处理
//        self.errorHandle()
        // 十一、类型判断转换
//        self.typeCasing()
        // 十二、extension
//        self.extensionFuc()
        // 十三、协议
//        self.protoclFuc()
        // 十四、泛型
//        self.generics()
        
       
    }
    
    // 一、基础
    func base() {
        // 常量变量
        var name = "Jone"
        name = "joker"
        let age = 20
        print("他的名字",name,"他的年龄\(age)")
        
        // 整数，浮点  整数和浮点转换
        let number:Int64 = 2
        let numberF:Float = 0.2
        let numberD:Double = 0.2
        let num_F = 2 + Int(2.0);
        print(number,numberF,numberD,num_F)
        
        // 别名类型
        typealias MyInt = Int
        let myIntNumber:MyInt = MyInt.min
        print(myIntNumber)
        
        // !强制解包 ?可选
        
        // 错误处理
        // 1.1 try catch
        
        func canThrowAnError() throws {
            // this function may or may not throw an error
        }
        do {
            try canThrowAnError()
            // no error was thrown
        } catch {
            // an error was thrown
        }
        
        
        // 1.2 断言
        let ages = 1
        assert(ages >= 0, "A person's age can't be less than zero.")
        
        // 1.3 执行先决条件
        let index = 2
        precondition(index > 0, "Index must be greater than zero.")
        
    }
    
    
    // 二、运算符
    func baseOperators(){
        // 1.1 赋值运算
        // 和oc不同，赋值操作不会返回任何值，此功能可防止在实际=使用等于operator（==）时意外使用赋值运算符
        let (x, y) = (1, 2)
        print(x,y)
        // if x = y {
            // This is not valid, because x = y does not return a value.
        // }
        
        // 2.2 +-*/%运算符 和OC相同
        // 2.3 复合赋值运算符 += -=
        // 2.4 比较运算符 == != > < >= <= 和OC不同，比较运算符可用于字符串、元祖等比较
        let name1 = "joker"
        
        if name1 == "joker" &&
            ((10,"小明") >= (8,"小明"))
        {
            print("正确")
        }
        
        // 2.5 Nil-Coalescing运算符 三元运算符的简单表达式
        let defaultColorName = "red"
        var userDefinedColorName: String?    // defaults to nil
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        print(colorNameToUse)
        
        // 2.6 范围运算符 x...y  x...<y  n... ...n  ...<n
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        // 2.7 逻辑运算符  !a、 a && b 、a || b 和OC相同
        
    }
    
    
    // 三、字符串
    func stringFunc(){
        //  3.1 """ 多行文本  """    \可以避免换行
        let quotation = """
        The White Rabbit put on his spectacles."Where shall I begin,please your Majesty?" he asked.\

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
        print(quotation)
        
        // 3.2 字符串连接  + 、+= 来连接字符串
        var variableString = "Horse"
        variableString += " and carriage"
        // variableString is now "Horse and carriage"
        var constantString = "Highlander"
        constantString += " and another Highlander"
        print(constantString,"\n",variableString)
        
        // 3.3 字符串插值
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        
        // 3.4 字符串长度 使用count
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters")
        
        // 3.5 访问和修改
        // String.Index它对应Character于字符串中每个值的位置。
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]
        // G
        greeting[greeting.index(before: greeting.endIndex)]
        // !
        greeting[greeting.index(after: greeting.startIndex)]
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        
        // 使用该indices属性可以访问字符串中各个字符的所有索引。
        
        // 3.6 插入和删除
        // 使用insert(_:at:)方法、insert(contentsOf:at:)方法。
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        // welcome now equals "hello!"
        
        welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
        // welcome now equals "hello there!"
        
        // remove(at:)、removeSubrange(_:)方法：
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        // welcome now equals "hello there"
        
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        // welcome now equals "hello"
        
        
        // 3.7 subString
        let greetings = "Hello, world!"
        let greetingsIndex = greetings.firstIndex(of: ",") ?? greetings.endIndex
        let beginning = greetings[..<greetingsIndex]
        print(beginning)
        
        // 3.8 比较字符串。==
        let quotations = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotations == sameQuotation {
            print("These two strings are considered equal")
        }
        
        // 3.9 前缀和后缀
        if quotations.hasPrefix("We") {
            print("有We")
        }
        
        if quotations.hasSuffix("I.") {
            print("有I.")
        }

    }
    
    // 四、集合
    // Swift有三种集合类型{ Array、Set、Dictionary }
    func collection() {
        // 4.1 Array
        
        // 4.1.1 创建数组
        // 使用var 和 let 创建可变与不可变数组
        var mutalArray = [1,2,3]
        mutalArray.append(4)
        let unmytalArray = [5,6]
        
        // + 、+= 添加数组
        var addArray = mutalArray + unmytalArray

        // 创建有默认值的数组
        let threeDoubles = Array(repeating: 1, count: 3)
        print(mutalArray,unmytalArray,addArray,threeDoubles)
        
        // 4.1.2 访问和修改数组
        // count  数组元素个数
        // isEmpty 数组是否空
        // contains 是否包含某个元素
        // append 添加元素
        // + 、+= 添加 一个数组中的所有元素
        // 下标访问元素,修改元素
        addArray[0] = 100
        print(addArray[0])
        
        // 访问返回元素
        print(addArray[0..<4])
        
        // 插入元素 insert(<#T##newElement: Int##Int#>, at: <#T##Int#>)
        addArray.insert(10, at:addArray.count);
        print(addArray)
        
        // 删除元素 remove(at:) 、removeLast()、removeFirst()
        addArray.remove(at: addArray.count - 1)
        print(addArray)
        addArray.removeLast()
        addArray.removeFirst()
        print(addArray)
        
        // 迭代
        addArray.forEach { (element) in
            print(element)
        }
        // 如果需要每个项的整数索引及其值，请使用该enumerated()
        for (index,value) in addArray.enumerated() {
            print(index,value)
        }
        
        
        // 4.2 Set 和 Array 基本相同
        let a:Set = [1,2,3,4,5,6]
        let b:Set = [4,5,6,7,8,9]
        let c:Set = [1,2]
        let d:Set = [10,11]
        // 交集
        print(a.intersection(b))
        // 对称集
        print(a.symmetricDifference(b))
        // 并集
        print(a.union(b))
        // 补集
        print(a.subtracting(b))
        // 是否包含
        print(c.isSubset(of: a), a.isSuperset(of: c))
        // 是否没有共同值
        print(a.isDisjoint(with: d))
        
        // 4.3 Dictionary
        // 4.3.1 创建字典
        var namesOfIntegers = [Int: String]()
        var dict = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        namesOfIntegers[11] = "Boklo"
        dict["KIO"] = "Nonoe"
        print(dict)
        
        // 4.3.2 访问和修改字典
        // count  字典元素个数
        // isEmpty 字典是否空
        // key 访问元素
        // contains 是否包含某个元素
        dict.contains { (key, value) -> Bool in
            print(key,value)
            return key == "DUB" ? true : false
        }
        
        // dict.updateValue(_:forKey:) 、dict[key]修改元素
        // dict[key] = nil 、 dict.removeValue(forKey:) 删除元素
        
        // 4.3.3 迭代
        for key in dict.keys {
            print(key)
        }
        
        for value in dict.values {
            print(value)
        }
        
        dict.forEach { (key, value) in
            print(key,value)
        }
        
    }
    
    // 五、条件/循环
    func control() {
        // 5.1 for in
        // 数组迭代
        var names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
        
        // 字典迭代
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        // 范围迭代
        for i in 100..<105 {
            print("index = \(i)")
        }
        
        // 5.2 while、repeat- while
        while "Anna" == names[0] {
            print("while 画已经开始了")
            names[0] = "anna"
        }
        
        repeat {
             print("repeat 画已经开始了")
        } while "Anna" == names[0]
        
        // 5.3 switch
        // 匹配一个字符
        let someCharacter: Character = "z"
        switch someCharacter {
        case "a":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        
        // 匹配多个字符
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
        case "a", "A","b","B":
            print("The letter A")
        default:
            print("Not the letter A")
        }
        
        // 匹配范围
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        let naturalCount: String
        switch approximateCount {
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        default:
            naturalCount = "many"
        }
        print("There are \(naturalCount) \(countedThings).")
        
        // 元组匹配
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (0...2, 0...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        
        // 多个元组匹配
        switch somePoint {
        case (0, 0),(1,0):
            print("\(somePoint) is at the origin")
        case (0...2, 0...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        
        // value 绑定
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        
        // where条件
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // continue 结束此次循环，进入下一次循环
        // break 立即结束循环体
        // fallthrough switch语句不会落入每个case的底部并进入下一个case，fallthrough下穿case
    }
    
    
    // 六、方法
    func functions() {
        
        // 可变参数传递，函数返回值为元组
        func mutal(name:String ,age:Int, values:Int...) -> (name:String,age:Int,total:Int) {
            var total = 0
            for value in values {
                total += value
            }
            let descripte = "名字叫" + name + "，年龄" +  String(age) + "，收入" + String(total)
            print(descripte)
            
            return (name,age,total)
        }
        print(mutal(name: "小张", age: 20, values: 1,2,3,4,5,6))
        // 函数作为参数，函数作为返回值 使用
    }
    
    // 七、闭包
    func closures() {
        
        var names = ["kille","Nooup","Hoolk","Doone"]
        
        names.sorted {
            return $0 > $1
        }
        print(names)
        
        // 闭包作为参数
        func bs_viewAction(action:(Int,String...)->Void){
            action(0,"点击头像","登录","查看详情","设置")
        }
        bs_viewAction { (type, actions:String...)  in
            print(type,actions)
        }
        
        // 闭包作为属性
        let bs_viewActions = {(type:Int,actions:String...)->Void in
            print(actions[0])
        }
        bs_viewActions(1,"你好啊","211")
        
    }
    
    // 八、枚举
    func enumFuc(){
        enum Beverage: CaseIterable {
            case coffee, tea, juice
        }
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        
        // 隐含地分配原始价值
        enum Planet: Int {
            case mercury = 3, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        
        // 通过value获取 枚举
        let x = Planet(rawValue:4)!
        print(x)
        
        // 递归枚举
        
    }
    
    // 九、结构体、类
    func structAndClass() {
        // 结构体
        // 结构和枚举是值类型，分配给一个变量或常数，或当它传递给函数，其值被复制
        // so 常量引用的实例无法修改属性
        struct Person{
            var age:Int = 100
            var name:String = "ss"
        }
        // 类
        // 分配给变量或常量时或者传递给函数时不会被复制，是对同一现有实例的引用
        // so 常量引用的实例可以修改属性
        // 判断两个常量/变量是否指向同一实例 与（===）相同  与（!==）不一样
        class Student{
            lazy var classNum:Int = 0 // = 为可读写（包含getter、setter）
            var girlFriend:NSString { // 重写 getter、setter
                get{
                    return "小丽"
                }
                set{
                    print(newValue)
                }
            }
            
            var person:Person {// 只读属性
               return Person(age: 10, name: "2222")
            }
/* lazy */  var score:Float = 100 {
                willSet (newScore){
                    print(newScore)
                }
                didSet{
                    print(oldValue)
                }
            }
            // static 标识所有实例都共享statu属性，statu只分配一次l内存空间
            static var statu = "China"
            // ? 属性可选
            var hairColor:UIColor?
            
        }
        
        let student = Student()
        student.hairColor = UIColor.red
        print(student.girlFriend)
        student.girlFriend = "丽丽"
       
        
        // 继承
        class Animal {
            var footCount = 4
            var canFly = false
            func eat() {
                print("吃饭")
            }
            final func run() {
                print("开跑")
            }
        }
        
        class Cat:Animal{
            var age = 1
            override var canFly: Bool {
                didSet{
                    print(oldValue)
                }
            }
            override func eat() {
                super.eat()
                print("吃鱼")
            }
            
            // 反初始化 相当于dealloc
            deinit {
                // perform the deinitialization
            }
        }
        
        let cat = Cat()
        cat.canFly = true
        print(cat.canFly)
        
        // 防止重写。final varfinal funcfinal class funcfinal subscript
    }
    
    // 十、错误处理
    
    func errorHandle() {
        enum OperationError : Error {
            case ErrorOne
            case ErrorTwo
            case ErrorThree(String)
            case ErrorOther
        }
        
        func numberTest(num:Int) throws{
            if num == 1 {
                print("成功")
            }else if num == 2 {
                throw OperationError.ErrorTwo
            }else if num == 3{
                throw OperationError.ErrorThree("失败")
            }else {
                throw OperationError.ErrorOther
            }
        }

        func numberTest2(num:Int) throws{
            try numberTest(num: num)
        }
        
        // 1.do catch处理
        do{
            try numberTest2(num: 2)
        } catch OperationError.ErrorOne{
            print(OperationError.ErrorOne)
        } catch OperationError.ErrorTwo{
            print(OperationError.ErrorTwo)
        } catch OperationError.ErrorOther{
            print(OperationError.ErrorOther)
        } catch{
            print(error)
        }
        
        
        // 2.将错误转换为可选值
        func throwDeliver(num:Int) throws ->OperationError {
            if num == 1 {
                print("成功")
                return OperationError.ErrorOne
            }else if num == 2 {
                return OperationError.ErrorTwo
            }else if num == 3{
                return OperationError.ErrorThree("失败")
            }else {
                return OperationError.ErrorOther
            }
        }
        
        if let retureMessage = try? throwDeliver(num: 3) {
            print(retureMessage)
        }
        
        // 3.确定没有错误
        try! numberTest2(num: 1);
      
    }
    
    
    // 十一、类型判断转换
    func typeCasing(){
        class MediaItem {
            var name: String
            init(name: String) {
                self.name = name
            }
        }
        
        class Movie: MediaItem {
            var director: String
            init(name: String, director: String) {
                self.director = director
                super.init(name: name)
            }
        }
        
        class Song: MediaItem {
            var artist: String
            init(name: String, artist: String) {
                self.artist = artist
                super.init(name: name)
            }
        }
        
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        
       // is、来检查实例是否属于某个（类/子类）的实例
        var count = 0
        
        for item in library {
            if item is Song {
                count += 1
            }
        }
        print(count)
        
        // as、向下转换为子类类型 as! 强制转型、as？可选转型
        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: \(song.name), by \(song.artist)")
            }
        }
        
        // Any 可以表示任何类型的实例，包括函数类型。
        // AnyObject 可以表示任何类类型的实例。

    }
    
    // 十二、extension
    func extensionFuc()  {
        var num = 3
        num.square()
        print(num)
    }
    
    // 十三、协议
    func protoclFuc() {
        //        https://www.jianshu.com/p/87bcd8694d38
        //        1.协议的基本语法
        //        2.定义协议与实现协议
        //        3.协议与构造器
        //        4.协议作为类型
        //        5.协议实现委托代理模式
        //        6.通过扩展遵循协议
        //        7.协议类型的集合
        //        8.协议继承协议
        //        9.类类型专属协议
        //        10.协议合成
        //        11.检查协议的一致性
    }
    
    // 十四、泛型
    func generics(){
        //        https://www.jianshu.com/p/6fd3936b90f1
        //        1.泛型解决的问题
        //        2.泛型函数
        //        3.泛型类型
        //        4.扩展一个泛型类型
        //        5.泛型的类型约束
        //        6.关联类型
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
