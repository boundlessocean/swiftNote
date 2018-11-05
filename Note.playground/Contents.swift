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
        self.base()
        self.baseOperators()
        self.stringFunc()
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
        // 1.try catch
        
        func canThrowAnError() throws {
            // this function may or may not throw an error
        }
        do {
            try canThrowAnError()
            // no error was thrown
        } catch {
            // an error was thrown
        }
        
        
        // 2.断言
        let ages = 1
        assert(ages >= 0, "A person's age can't be less than zero.")
        
        // 3.执行先决条件
        let index = 2
        precondition(index > 0, "Index must be greater than zero.")
        
    }
    
    
    // 二、运算符
    func baseOperators(){
        // 1.赋值运算
        // 和oc不同，赋值操作不会返回任何值，此功能可防止在实际=使用等于operator（==）时意外使用赋值运算符
        let (x, y) = (1, 2)
        print(x,y)
        // if x = y {
            // This is not valid, because x = y does not return a value.
        // }
        
        // 2.+-*/%运算符 和OC相同
        // 3.复合赋值运算符 += -=
        // 4.比较运算符 == != > < >= <= 和OC不同，比较运算符可用于字符串、元祖等比较
        let name1 = "joker"
        
        if name1 == "joker" &&
            ((10,"小明") >= (8,"小明"))
        {
            print("正确")
        }
        
        // 5.Nil-Coalescing运算符 三元运算符的简单表达式
        let defaultColorName = "red"
        var userDefinedColorName: String?    // defaults to nil
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        print(colorNameToUse)
        
        // 6.范围运算符 x...y  x...<y  n... ...n  ...<n
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        // 7.逻辑运算符  !a、 a && b 、a || b 和OC相同
        
    }
    
    
    // 3.字符串
    func stringFunc(){
        //  1.""" 多行文本  """    \可以避免换行
        let quotation = """
        The White Rabbit put on his spectacles."Where shall I begin,please your Majesty?" he asked.\

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
        print(quotation)
        
        // 2.字符串连接  + 、+= 来连接字符串
        var variableString = "Horse"
        variableString += " and carriage"
        // variableString is now "Horse and carriage"
        var constantString = "Highlander"
        constantString += " and another Highlander"
        print(constantString,"\n",variableString)
        
        // 3.字符串插值
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        
        // 4.字符串长度 使用count
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters")
        
        
        
    }
    
    //
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
