//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

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
        
        // 一、基础
        self.base()
        // 二、运算符
        self.baseOperators()
        // 三、字符串
        self.stringFunc()
        // 四、集合
        self.collection()
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
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
