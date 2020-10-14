//
//  main.swift
//  LearnSwift
//
//  Created by cornier on 2020/4/30.
//  Copyright © 2020 cornier. All rights reserved.
//

import Foundation

/*
    2. class和结构体区别
        class 支持继承, 结构体不支持
        class 是引用类型, 结构体是值类型
    4.值类型:
        String: 实际编译的时候优化字符串的使用, 实际的复制只发生在绝对必要的情况下
        Array:
        Dictionary:
        Set:
        枚举:

    可哈希化的: String, Int. Double, Bool

    5.字面量协议: 通过协议让自定义的数据类型具有通过字面量初始化的能力
         ExpressibleByNilLiteral:
         ExpressibleByIntegerLiteral
         ExpressibleByFloatLiteral
         ExpressibleByBooleanLiteral
         ExpressibleByStringLiteral: 需要实现:
                                     ExpressibleByUnicodeScalarLiteral
                                     ExpressibleByExtendedGraphemeClusterLiteral
         ExpressibleByArrayLiteral
         ExpressibleByDictionaryLiteral


         枚举 只支持   ExpressibleByIntegerLiteral
                     ExpressibleByFloatLiteral
                     ExpressibleByStringLiteral

         CustomStringConvertible协议: description() {}


    7.修饰符:
         final: 防止子类重写
         @discardableResult:忽略如果不使用返回值的警告
         mutating: 实例化的时候 func 不能修改属性的值 可以改变属性
         convenience:便利构造器
                     struct或者class在extension中写指定构造器,  才可以访问默认构造器和逐一成员构造器
                     class中便利构造器不能被继承
                     class中:
                         1.指定构造器必须调用其直接父类的指定构造器
                         2.便利构造器必须调用同一类中定义的其他构造器
                         3.便利构造器必须最终导致一个指定构造器被调用
         lazy: ??? 懒加载相当于静态空间, 只运行一次
         inout: 可以修改当前属性

         open: 可以被任何人使用包括override和继承
         public:可以被任何人访问,
                 在module内可以被override和继承, 在其他model不可以override和继承
         internal:默认访问级别
                 修饰的属性或者方法再源代码所在的整个模块都可以访问
                 如果是框架或者库代码, 则整个框架可以访问, 框架由外部代码所引用的时候则不能访问
                 如果是app代码, 整个app内部都可以访问
         fileprivate:
                 修饰的属性或者方法只能在当前的swift源文件里可以访问
         private:修饰的属性或者方法自能在当前类里访问
 */

//struct Test {
//    var age: Int
//
//    mutating func changeAge(_ new: Int) {
//        age = new
//    }
//}
//
//protocol NewTest {
//    var age: Int { get set }
//    func changeAge(_ new: Int)
//}
//
//extension NewTest {
//    mutating func changeAge(_ new: Int) {
//        age = new
//    }
//}
/*
    关键字:
        subscript：下标索引修饰   tmp[7]
        final: 修饰class fun 和 var, 表示不可重写
                子类可以继承 但是不能重写
        fallthrough: 执行完当前case  顺序代码执行下面的case
        mutating: 写在func前, 以便于让func可以修改struct和protocol的extension中的成员的值
                struct Test {
                    var age: Int

                    mutating func changeAge(_ new: Int) {
                        age = new
                    }
                }

                protocol NewTest {
                    var age: Int { get set }
                    func changeAge(_ new: Int)
                }

                extension NewTest {
                    mutating func changeAge(_ new: Int) {
                        age = new
                    }
                }
        nonmutating: 声明值类型时, 配合set时使用 告诉编译器不会修改实例内部的值
 */
//class Temp {
//    let a: Int
//    init(num: Int) {
//        a = num
//    }
//
//    convenience init(_ tp: Int) {
//        self.init(num: tp)
//    }
//}
//
//class SunTmp: Temp {
//    let numB: Int
//    override init(num: Int) {
//        numB = num-1
//        super.init(num: num)
//    }
//}
/*
 convenience:
    class中  初始化的方法 子类不能继承
    class 和 struct中 写了遍历构造器(convenience), 就不能使用默认init了[类的init(默认构造器) struct的init(参数)(逐一成员构造器)]
    convenience 中 必须使用指定构造器
 */


//var arr = [Int]()
//数组中最小5个
//arr.reserveCapacity(5)
//for i in 0..<5 {
//    arr.append(i)
//}
//arr.append(6)
//print(arr)

//无限$0.superview, 直到为inil
//for item in sequence(first: tableView, next: { $0.superview }) {
//    print(item)
//}

//判断两个序列是否拥有相同的元素, 并且顺序一致
//let a = 1...3
//let b = 1...10
//
//print(a)
//print(a.elementsEqual(b))
//print(a.elementsEqual([1, 2, 3]))

//ArraySlice的index维持原来的 不是总是开始于0
//var absences = [0, 2, 0, 4, 0, 3, 1, 0]
//let midpoint = absences.count / 2
//var first = absences[..<midpoint]
//var last = absences[midpoint...]
//print(type(of: last))
//print(first)
//print(last)
//print(last[4])//0
//print(last[5])//3
//last[4] = 9
//first[0] = 10
//print(first)
//print(last)
//print(absences)

/*
 Array:
    ContiguousArray: 强制连续的空间来存储, 值类型和class和@objc都是连续的
    Array: 当存储值类型的时候, 内存空间是连续的, 当存class和objc时 Array会桥接到NSArray上内容可能不连续
    ArraySlice:数组片段, 更快, 更高效的对一个大数组的其中一部分做处理, ArraySlice不会创建新的存储空间, 和原本的Array在内存中共享同一区域, 但是修改ArraySlice不会影响到原来的Array
 */


//protocol SomeProtocol {
//    init(someParameter: Int)
//}
//
//class SomeTmp: SomeProtocol {
//    required init(someParameter: Int) {
//
//    }
//}


//let numbersCompound = [[1,2,3],[4,5,6]];
//var res = numbersCompound.map { $0.map{ $0 + 2 } } //[[3, 4, 5], [6, 7, 8]]
//var flatRes = numbersCompound.flatMap { $0.map{ $0 + 2 } } //[3, 4, 5, 6, 7, 8]
//var compactRes = numbersCompound.compactMap( { $0.map{ $0 + 2 } }) //[[3, 4, 5], [6, 7, 8]]

/*
 map 和 compactMap 的区别
 //https://www.jianshu.com/p/07b59f4f0071
 */

//let numbers = ["1", "2", "three", "///5///", "5"]
//let mapResult = numbers.map { (number) -> Int? in
//    return Int(number)
//}
//print(mapResult) // [Optional(1), Optional(2), nil, nil, Optional(5)]
//let compactMapResult = numbers.compactMap { (number) -> Int? in
//    return Int(number)
//}
//print(compactMapResult) // [1, 2, 5]

//
//let arr = [1, 2, 3, 4]
////
//let filterRes = arr.filter { (value) -> Bool in // [2, 4]
//    return value % 2 == 0
//}
//let reduceArr = arr.reduce(100) { (ret, value) -> Int in //110
//    return ret + value
//}
//
//extension Array {
//    func map2<T>(_ transform: (Element) -> T) -> [T] {
//        return reduce([]) { (ret, value) -> [T] in
//            return ret + [transform(value)]
//        }
//    }
//}
//
//let list = [1, 2, 3]
//print(list.map2( { return $0 }))

/*
    map: 原始数据结构[对集合进行循环，并对集合中的每个元素采取相同的操作。]
    flatmap: 解包 会自动过滤nil, 降维
    filter:  [循环遍历集合并返回包含满足条件的元素的数组]
    reduce: 添加起始元素, 数组元素进行相同操作得到结果u与下一个元素进行操作
 */

//dic 合并
//var dic1 = ["te": 1234]
//var dic2 = ["xt": 567, "te": 90]
//dic1.merge(dic2) { (val1, val2) -> Int in
//    return val1
//}
//print(dic1)


//set
//let set1: Set<Int> = [1, 2, 4]
//let set2: Set<Int> = [3, 4, 5]
//let subSet = set1.subtracting(set2) //sub2的补集合[2, 1]: 1有2没有
//let innerSet = set1.intersection(set2) //交集 [4]
//let allSet = set1.union(set2) //并集 [3, 1, 2, 5, 4]
//print(innerSet)
//print(allSet)

/*
    0..<10: CountableRange<Int>, 遵守Strideable协议, 以整数为步长
    Swift讲这类功能更强的范围叫可数范围
 */
/*
                    半开范围            闭合范围
 元素满足Compareble   Range             ClosedRange
 元素满足Strideable   CountableRange    CountableClosedRange

 *Strideable协议, 以整数为步长
 *Comparable协议[>，>=，<，<=], 集成Equatable[支持==, != ]

 PartialRangeFrom: 1...
    let fromA: PartialRangeFrom<Character> = Character("a")...
 PartialRangeThrough: ...5
    let throughZ: PartialRangeThrough<Character> = ...Character("z")
 PartialRangeUpTo: ..<10
    let upto10: PartialRangeUpTo<Int> = ..<10
 CountablePartialRangeFrom: 5...
    let fromFive: CountablePartialRangeFrom<Int> = 5...

 八种范围都满足RangeExpression协议
 */

/*
 序列: Sequence协议 是结合类型结构中的基础
        一个序列代表的是一系列具有相同类型的值
 迭代器:
        序列通过创建一个迭代器来提供对元素的访问. 迭代器每次产生一个序列的值, 并且当遍历序列时对遍历状态进行管理

        protocol Sequence {
            associatedtype Iterator:
            IteratorProtocol func makeIterator() -> Iterator
            // ...
        }

        protocol IteratorProtocol {
            associatedtype Element
            mutating func next() -> Element?
        }
        关联类型Element指定了迭代器产生的值的类型
            String的迭代器的元素类型时Character



    一个序列遵守Collection协议的话, 就可以肯定这个序列是稳定的, Collection在这方面进行了保证
    稳定的序列并不一定满足Collection:
            标准库中的 StrideTo[stride(from:to:by:)], StrideThrough[stride(from:through:by:)]


    迭代器 提供独立的遍历状态, 对于所有的迭代器来说, 都可以将他们看做即将返回的 元祖所组成的不稳定序列
 */


/*
    值类型不能循环引用自身, 因为编译器需要计算它的尺寸
    枚举可以: 因为indirect关键字允许一个枚举成员能够被当做引用
 */
//end 1, 2, 3
//enum List<Element> {
//    case end
//    indirect case node(Element, next: List<Element>)//indirect允许将枚举中一个 case 的关联值再次定义为枚举
//}
//extension List {
//    func cons(_ x: Element) -> List {
//        return .node(x, next: self)
//    }
//}
//extension List {
//    mutating func push(_ x: Element) {
//        self = self.cons(x)
//    }
//    mutating func pop() -> Element? {
//        switch self {
//        case .end:
//            return nil
//        case let .node(x, next: tail):
//            self = tail
//            return x
//        }
//    }
//}
//extension List: IteratorProtocol, Sequence {
//    mutating func next() -> Element? {
//        return pop()
//    }
//}
//
//let tmp0 = List.node(111, next: List.end)
//var tmp = List.node(222, next: tmp0)
//let result = tmp.next()
//print("#####")
//print(result)

/*
 集合类型:
    Collection 协议是建立在 Sequence 协议上的
    集合类型在标准库中运用广泛。除了 Array，Dictionary，Set，String 和它的各种方式以外，
    另外还有 CountableRange 和 UnsafeBufferPointer 也是集合类型。
    更进一步，我们可以看到 标准库外的一些类型也遵守了 Collection 协议。
    有两个我们熟知的类型通过这种方法获得了很 多新的能力，它们是 Data 和 IndexSet，它们都来自 Foundation 框架

 */

//队列
//protocol Queue {
//    associatedtype Element //内容类型
//    mutating func enqueue(_ newElement: Element) //入队
//    mutating func dequeue() -> Element? //出队
//}
//
//struct FIFOQueue<Element>: Queue {
//    private var left: [Element] = []
//    private var right: [Element] = []
//    //入队
//    mutating func enqueue(_ newElement: Element) {
//        right.append(newElement)
//    }
//    //出队
//    mutating func dequeue() -> Element? {
//        if left.isEmpty {
//            left = right.reversed()
//            right.removeAll()
//        }
//        return left.popLast()
//    }
//}

/*
 数组字面量的默认类型是 Array，
 整数字面量的默认类型是 Int，
 浮点数字面 量默认为 Double，
 字符串字面量则对应 String\
 */

//可选值是值类型，解包一个可选值做的事情是将它里面的值复制出来

/*
 结构体:
    编译器所做的对于值类型的复制优化和值语义类型的写时复制行为并不是一回事儿????
 */


//class Name {
//    var cass = 0
//}
//
//var a = Name.init()
//var b = a
//let ret = isKnownUniquelyReferenced(&a)
//print(ret)

// ↓ 写时复制
//final class Empty {}
//struct Name {
//    var ref = Empty()
//
//    mutating func change() -> String {
//        if isKnownUniquelyReferenced(&ref) {
//            return "no copy"
//        } else {
//            return "copy"
//        }
//    }
//}
//
//var array = [Name()]
//print(array[0].change()) //no copy
//
//var dic = ["key": Name()]
//print(dic["key"]?.change() ?? "- -") //no copy
//var tmp = dic["key"]
//print(tmp?.change() ?? "- -") //copy
//
//struct ContainerName<A> {
//    var storage:A
//    subscript(s: String) -> A {
//        get { return storage }
//        set { storage = newValue }
//    }
//}
//
//var d = ContainerName(storage: Name())
//print(d.storage.change()) //no copy
//print(d["s"].change()) //copy

/* 测试代码  包含打印类的地址
func printPoint(_ clz: inout Company) {
    let ptr = withUnsafePointer(to: &clz) { $0 }
    let ptr1 = UnsafeRawPointer(ptr)
    let ptrAddress = UnsafeMutableRawPointer(bitPattern: ptr1.load(as: UInt.self))
    print("#### 堆空间地址 ->")
    print(ptrAddress)
}

class Employee {
    var name = "aaa"
}

struct Company {
    var employee = Employee()
    var income = "bbb"
}

var comA = Company()
var comB = comA
//comA.employee.name = "xxx"
//comA.income = "yyy"
print("### -> " + comB.employee.name)
print("### -> " + comB.income)

printPoint(&comA)


let comAp = withUnsafePointer(to: &comA) { $0 }
print(comAp)
let comBp = withUnsafePointer(to: &comB) { $0 }
print(comBp)
print("AAAA")

*/

////闭包和可变性
//func unpque() ->() -> Int {
//    var i = 0
//    return {
//        i+=1
//        print("####") //0x0000000100599940
//        print(withUnsafePointer(to: &i) { $0 })
//        return i
//    }
//}
//print(unpque()())
//
//func uniqueInterProvider() -> AnyIterator<Int> {
//    var i = 0
//    return AnyIterator{
//        i += 1
//        print("####2") //0x0000000100599940
//        print(withUnsafePointer(to: &i) { $0 })
//        return i
//    }
//}
//
//print(uniqueInterProvider().next())

/*
    Swift 的结构体一般被存储在栈上，而非堆上。
    不过对于可变结构体，这其实是一种优化:
        默认 情况下结构体是存储在堆上的，但是在绝大多数时候，这个优化会生效，并将结构体存储到栈上。
        编译器这么做是因为那些被逃逸闭包捕获的变量需要在栈帧之外依然存在。
        当编译器侦测 到结构体变量被一个函数闭合的时候，优化将不再生效，此时这个结构体将存储在堆上。
        这样 一来，在我们的例子里，就算 uniqueIntegerProvider 退出了作用域，i也将继续存在

 */


/*
    Swift 有一系列的复杂规则来确定到底使用哪个重载函数，这套规则基于函数是否是泛型，以 及传入的参数是怎样的类型来确定使用优先级。
    整套规则十分复杂，不过它们可以被总结为一 句话，那就是 “选择最具体的一个”

    要特别注意，重载的使用是在编译期间静态决定的。
    也就是说，编译器会依据变量的静态类型 来决定要调用哪一个重载，而不是在运行时根据值的动态类型来决定


 //??? LLVM  泛型派发: https://www.youtube.com/watch?v=ctS8FzqcRug
    Swift 通过为泛型代码引入一层间接的中间层来解决这些问题。当编译器遇到一个泛型类型的 值时，它会将其包装到一个容器中。这个容器有固定的大小，并存储这个泛型值。如果这个值 超过容器的尺寸，Swift 将在堆上申请内存，并将指向堆上该值的引用存储到容器中去。
    对于每个泛型类型的参数，编译器还维护了一系列一个或者多个所谓的目击表 (witness table): 其中包含一个值目击表，以及类型上每个协议约束一个的协议目击表。这些目击表 (也被叫做 vtable) 将被用来将运行时的函数调用动态派发到正确的实现去。
    对于任意的泛型类型，总会存在值目击表，它包含了指向内存申请，复制和释放这些类型的基 本操作的指针。这些操作对于像是 Int 这样的原始值类型来说，可能不需要额外操作，或者只 是简单的内存复制，不过对于引用类型来说，这里也会包含引用计数的逻辑。值目击表同时还 记录了类型的大小和对⻬方式。
    我们这个例子中的泛型类型 T 将会包含一个协议目击表，因为 T 有 Comparable 这一个约束。 对于这个协议声明的每个方法或者属性，协议目击表中都会含有一个指针，指向该满足协议的 类型中的对应实现。在泛型函数中对这些方法的每次调用，都会在运行时通过目击表准换为方 法派发。在我们的例子中，y < x 这个表达式就是以这种方式进行派发的。
    协议目击表提供了一组映射关系，通过这组映射，我们可以知道泛型类型满足的协议 (编译器通 过泛型约束可以静态地知道这个信息) 和某个具体类型对于协议功能的具体实现 (这只在运行时 才能知道) 的对应关系。实际上，只有通过目击表我们才能查询或者操作某个值。我们无法在不 加约束地定义一个 <T> 参数的同时，还期望它能对任意实现了 < 的类型工作。如果没有满足 Comparable 的保证，编译器就不会让我们使用 < 操作，这是因为没有目击表可以让我们找到 正确的 < 的实现。这就是我们说泛型和协议是紧密着联系的原因，除了像是 Array<Element> 或者 Optional<Wrapped> 这样的容器类型，脱离了使用协议来约束泛型，泛型所能做的事情也 就非常有限了。
 */

//let others = [1,2,3]
//others.contains { (value) -> Bool in
//    return value == 2
//}


/*
 协议:
 优点: 不需要强制使用某个父类
     可以让已经存在的类型满足协议, 子类没办法追溯的方式去变更他的父类
     协议可以用于类, 也可以用于结构体
     处理协议时, 不需要担心方法重写或者在正确的时间调用super
 协议中添加方法: 1.协议本身中
              2.协议扩展中
              协议要求的方法是动态派发的.
              而仅定义在扩展中的是静态派发的

 将Lombardis定义为Pizzeria类型时,编译器会自动将l1封装到一个代表协议的类型中, 这个类型成为存在容器(existential container)
 当我们对存在容器调用makeMargherita时, 方法是静态派发的, 也就是说总是使用Pizzeria的扩展
                                如果是动态派发的话, 肯定需要将方法的接受者Lombardis考虑在内
 如果想要makeMargherita 变为动态派发, 将方法添加到协议定义中

 我们依旧可以像之前那样提供一个默认的实现。而且和之前一样，
 具体的类型还是可以自由地 重写 makeMargherita。因为现在它是协议定义的一部分了，它将被动态派发
 在运行时, 根据方法接受者的动态类型的不同, 存在容器将会再自定义实现存在时对其进行调用,
 如果自定义实现不存在, 那么它将使用协议扩展中的默认实现
 */

//protocol Pizzeria {
//    func makePizza(_ ingredient: [String])
////    func makeMargherita()
//}
//extension Pizzeria {
//    func makeMargherita() {
//        return makePizza(["tomato", "mozzarella"])
//    }
//}
//
//struct Lombardis: Pizzeria {
//    func makePizza(_ ingredient: [String]) {
//        print(ingredient)
//    }
//    func makeMargherita() {
//        return makePizza(["tomato", "basil", "mozzarella"])
//    }
//}
//let l1: Pizzeria = Lombardis()
//let l2: Lombardis = Lombardis()
//print(l1)
//l1.makeMargherita()
//l2.makeMargherita()

/*
 协议的两种类型: 带有关联类型的协议
               普通的协议是不同的

 类型抹消: 将指定类型移除的过程.  移除某个类的具体类型, 或是一些实现细节
            抽象或者抽象父类可作为类型擦除简单的实现方式之一
        1.简单的解决方式:  实现一个封装类,不直接存储迭代器, 而是要封装类的存储迭代器的next函数
                        首先将iterator参数赋值到一个本地的var变量中, 这样就可以调用它的mutating的next()
                        然后将next()的调用封装到闭包表达式中, 然后将b这个闭包赋值给属性
        规律: 首先创建一个名为AnyProtocolName的结构体或者类
            然后对于每个关联类型, 我们添加一个泛型参数
            对于协议的每个方法, 我们将其存储在AnyProtocolName的一个属性中,
            添加一个将想要抹消的具体类型泛型化的初始化方法 他的任务是在闭包中捕获我们y传入的对象, 并将闭包赋值再上面步骤中的属性

 ps: NSObject == 底层用 === 检查指针是否相等

 */
//简单的办法
//class IntIterator {
//    var nextImpl: ()-> Int?
//    init<I: IteratorProtocol>(_ iterator: I) where I.Element == Int {
//        var iteratorCopy = iterator
//        self.nextImpl = {
//            iteratorCopy.next()
//        }
//    }
//}
//
//extension IntIterator: IteratorProtocol {
//    func next() -> Int? {
//        return nextImpl()
//    }
//}
//class AnyIterator<A>: IteratorProtocol {
//
//    var nextImp: ()->A?
//    init<I: IteratorProtocol>(_ iterator: I) where I.Element == A {
//        var iteratorCopy = iterator
//        nextImp = {
//            return iteratorCopy.next()
//        }
//    }
//
//    func next() -> A? {
//        return nextImp()
//    }
//}

/*
 标准库中的处理类型抹消:
    IteratorBox不能将被封装的迭代器存储在变量中, 否则的话他就需要对具体的迭代器类型进行泛型化, 这是要避免的
    解决方式是将这个属性(以及他的具体类型)隐藏在子类中, 这样就能避免对具体的迭代器类型使用泛型

 */
//class IteratorBox<Element>: IteratorProtocol {
//    func next() -> Element? {
//        fatalError("this method is abstract")
//    }
//}
//
//class IteratorBoxHelper<I: IteratorProtocol> {
//    var iterator: I
//    init(iterator: I) {
//        self.iterator = iterator
//    }
//
//    func next() -> I.Element? {
//        return iterator.next()
//    }
//}
//
//class IteratorBoxHelper<I: IteratorProtocol>: IteratorBox<I.Element> {
//    var iterator: I
//    init(_ iterator: I) {
//        self.iterator = iterator
//    }
//
//    override func next() -> I.Element? {
//        return iterator.next()
//    }
//}


//1.类型擦除
//protocol A {
//    associatedtype Item
//    var list: [Item] { get set }
//}
//
//class Model2: A {
////    typealias Item = Int
//    var list: [Int] = []
//}

//2.类型擦除
//class Model<Element> {
//    func add(A: Element) {
//
//    }
//}
//let tmp = Model<Int>()
//tmp.add(A: 6)
//
//struct Model3<Element> {
//    func add(A: Element) {
//
//    }
//}
//let a = Model3<Int>()
//a.add(A: 7)


//基于类的类型擦除
//class MAnySequence<Element>: Sequence {
//    class Iterator: IteratorProtocol {//迭代器
//        func next() -> Element? {
//            fatalError("must override next()")
//        }
//    }
//    func makeIterator() -> MAnySequence<Element>.Iterator { //生成一个迭代器
//        fatalError("must override makeIterator()")
//    }
//}
//
//class MAnySequenceImpl<Seq: Sequence>: MAnySequence<Seq.Element> {
//    class IteratorImpl: Iterator {
//        var wrapped: Seq.Iterator
//        init(_ wrapped: Seq.Iterator) {
//            self.wrapped = wrapped
//        }
//        override func next() -> Seq.Element? {
//            return wrapped.next()
//        }
//    }
//
//    var seq: Seq
//    init(_ seq: Seq) {
//        self.seq = seq
//    }
//
//    override func makeIterator() -> MAnySequence<Seq.Element>.Iterator {
//        return IteratorImpl(seq.makeIterator())
//    }
//}
//
//extension MAnySequence {
//     static func make<Seq: Sequence>(_ seq: Seq) -> MAnySequence<Element> where Seq.Element == Element {
//        return MAnySequenceImpl<Seq>(seq)
//    }
//}

//基于函数的类型擦除
//struct MAnySequence<Element>: Sequence {
//    struct Iterator: IteratorProtocol {
//        let _next: () -> Element?
//        func next() -> Element? {
//            return _next()
//        }
//    }
//
//    let _makeIterator: () -> Iterator
//    func makeIterator() -> Iterator {
//        return _makeIterator()
//    }
//
//
//    init<Seq: Sequence>(_ seq: Seq) where Seq.Element == Element {
//        _makeIterator = {
//            var iterator = seq.makeIterator()
//            return Iterator(_next: {
//                iterator.next()
//            })
//        }
//    }
//}

//func printInts(_ seq: MAnySequence<Int>) {
//    for item in seq {
//        print(item)
//    }
//}
//let arr = [1,2,3,4,5]
//printInts(MAnySequence(arr))
//printInts(MAnySequence(arr[1...4]))

//protocol A { }
//protocol B {
//    associatedtype T: A
//    func action(_ pA2: T)
//}
//
//struct A1: A {}
//struct A2: A {}
//
//struct B1: B {
//    func action(_ pA2: A2) {
//        print("3333 $$$ #33")
//    }
//
//    func temp<T: B>(type: T) {
//        print("$$$")
//    }
//
//    func act<T: A>(type: T) -> Bool {
//        if type is A1 {
//            return true
//        } else {
//            return false
//        }
//    }
//}
//
//let tmp = B1()
//tmp.action(A2())
//tmp.action(A1())




//protocol P {
//    func action()
//}
//extension P {
//    func action() {
//        print("^^^^^")
//    }
//}
//class A: P {
//    func action() {
//        print("&&&&&")
//    }
//} //A里面没实现这个协议,  这个协议的方法不会放在A的函数表
//
//class B: A {
////    override func action() {
////        print("$$$")
////    }
//}
//
//
//let tmp: P = B()
//print(tmp)
//tmp.action() //&&&&&

////函数表派发: 查表找到函数地址
////静态派发 直接派发: 直接调用函数地址
////runtime


//func f<S: Sequence>(seq: S) where S.Element == Int {
//遵守协议Sequence 的S类型, seq 参数名 S类型


//func action<T: Sequence>(para: T) where T.Element == Int {
//
//}
//
//func action1(para: AnySequence<Int>) {
//    print(para)
//}

/*
 type(of: T)  T的类型
print("Student size: ->\(MemoryLayout<Student>.size)") //连续的内存占用量T, 以字节为单位
print("Student stride: ->\(MemoryLayout<Student>.stride)") //存储在连续存储器或存储器重的一个实例的开始到下一个实例的开始的字节数
print("Student alignment: ->\(MemoryLayout<Student>.alignment)") //内存对齐方式T 以字节为单位
 */


/*
    内联是指在编译期把每一处方法调用替换为直接执行方法内部的代码
    ps: https://blog.csdn.net/qq_36487644/article/details/87967969
 直接派发[静态调用]: 最快, 需要指令集少, 编译器有优化[函数的内联]
 函数表派发: 函数表使用了一个数组来存储类声明的每一个函数的指针,
             里面记录着类的所有函数.如果父类函数被override 表只会保存被override的函数.一个新加的函数会被插入到这个数组的最后
             1.读取0xB00 的函数表
             2.读取函数指针的索引+偏移量
             3.跳到函数对应的地址
 消息机制派发:同OC
 */
//class MyClass {
//    func mainMethod() {}  //函数表派发
//
//    final func tempAction() {}
//
//    @inline(__always) func test() {
//
//    }
//}
//extension MyClass { // 直接派发
//    func extensionMethod() {
//        print("&&&&")
//    }
//}
/*              初始声明(上面的mainMethod)    extension(上面的extensionMethod)
    值类型:        static                          static
    协议:          table                           static
    类:            table                           static
    NSObject
    Subclass:      table                           message


    值类型: 总是 直接派发
    协议和类:  extension内都是直接派发
    NSObject: extension使用消息机制.  声明作用域的函数都是函数表派发
    协议里声明的 并且带有默认实现的函数会使用函数表进行派发

    直接派发不能override行为

    dynamic 修饰的时候会通过Objective_C的运行时进行消息机制派发
    final   修饰的时候 是直接派发, 就算NSObject 的运行时 也获取不到这个函数 不会生成对应的selector
    @objc 和 @nonobjc  显示的声明一个函数是否能呗objective-c的运行时捕获到
                      使用objc修饰, 就是给一个selector 一个命名空间@objc(abc_methodName), 让这个函数可以被objective-c的运行时调用,
                      使用nonobjc 用来禁止消息机制派发这个函数, 不让这个函数注册到oc的运行时内
    final @objc 同时使用的时候  调用函数就是直接派发, 但是oc运行时也注册响应的selector, 函数可以响应perform(selector:)以及别的oc特性, 可以直接调用又有直接派发的性能
    inline[是否内联]: 告诉编译器可以使用直接派发
    @inline(__always)
    @inline(__always)
 */

/*
 AnyObjcet 和 AnyClass 区别
 AnyClass = AnyObject.type
 */
//class Obj {
//    var a: AnyObject? //id
//    var b: AnyClass? //类
//}
//
//class A {}
//
//let tmp = Obj()
//tmp.a = A()
//tmp.b = A.self
//tmp.b?.init()


/*
 propertyWrapper 属性包装器
 */
//extension UserDefaults {
//    public enum Key: String {
//        case someInt = "someInt"
//    }
//
//    var someInt: Int {
//        get {
//            return integer(forKey: Key.someInt.rawValue)
//        }
//        set {
//            set(newValue, forKey: Key.someInt.rawValue)
//        }
//    }
//}
//
//let hadShow = UserDefaults.standard.someInt
//UserDefaults.standard.someInt = 1

//@propertyWrapper //告诉编译器, 下面是一个属性包裹器
//struct UserDefalut<T> {
//    let key: String
//    let defalutValue: T
//
//    init(_ key: String, _ defaultValue: T) {
//        self.key = key
//        self.defalutValue = defaultValue
//    }
//
//    // wrappedValue是propertyWrapper必须要实现的属性
//    //当操作我们要包裹的属性时, 具体的get set 走wrappedValue的get set 方法
//    var wrappedValue: T{
//        get {
//            return UserDefaults.standard.object(forKey: key) as? T ?? defalutValue
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: key)
//        }
//    }
//}
//
//struct UserDefaultConfig {
//    //告诉编译器 包裹的是key_hot这个值
//    @UserDefalut("key_hot", 1)//初始化前面要加个@
//    static var hadValue: Int //hadValue属性的一些key和默认值已经在UserDefalut包裹器的构造方法中实现
//}
//
//print(UserDefaultConfig.hadValue)
//UserDefaultConfig.hadValue = 100
//print(UserDefaultConfig.hadValue)

//@propertyWrapper
//struct Trimmed: ExpressibleByIntegerLiteral {
//    typealias IntegerLiteralType = Int
//
//    init(integerLiteral value: IntegerLiteralType) {
//        self.wrappedValue = value
//    }
//
//    private var value: Int = 0
//    var wrappedValue: Int {
//        get {
//            return value
//        }
//        set {
//            value = newValue
//        }
//    }
//
//    init(tmp: Int) {
//        wrappedValue = tmp
//    }
//
//}
//struct NewValue {
//    @Trimmed
//    var title: Int
//    @Trimmed
//    var body: Int
//}
//
//var tmp = NewValue(title: Trimmed(integerLiteral: 10), body: Trimmed(20))
//tmp.title = 30
//print(tmp.title)
//print(tmp.body)
//
//tmp.body = 100
//print(tmp.title)
//print(tmp.body)

//print(nil == .none)


//@propertyWrapper
//struct Wrapper<T> {
//    var wrappedValue: T
//
//    var projectedValue: Wrapper<T> { return self }
//
//    func foo() { print("Foo") }
//}
//struct HasWrapper {
//    @Wrapper var x = 0
//
//    func foo() {
//        print(x) // `wrappedValue`
//        print(_x) // wrapper type itself
//        print($x) // `projectedValue`
//    }
//}
//
//let t = HasWrapper.init(x: 5)
//t.foo()

/*
 @dynamicMemberLookup: 动态查找成员
    必须实现subscript(dynamicMember
    声明@dynamicMemberLookup前 作为一门类型安全的语言, 会告诉你不存在这些属性,
    声明后 虽然没有定义这些属性, 但是程序会在运行时动态的查找属性的值, 调用subscript(dynamicMember member: String)来获取值

    如果重载了subscript(dynamicMember member: String)这个函数, 必须指明动态参数类型

    如果声明在类上, 那么他的子类也会具有动态查找成员的能力
 */

//@dynamicMemberLookup
//struct Person {
//    var name = "123"
//    subscript(dynamicMember member: String) -> String {
//        let properties = ["name": "Zhou", "city": "Shanghai"]
//        return properties[member, default: "undefined"]
//    }
//
//    subscript(dynamicMember member: String) -> Int {
//        return 18
//    }
//}
//
//let p = Person()
//print(p.name)
////print(p.city)
////print(p.nike)
//
////如果重载了subscript(dynamicMember member: String)这个函数, 必须指明city类型
//let city: String = p.city
//print(city)
//let age: Int = p.age
//print(age)



//defer
//Self
//throw rethrow


//var dic: [String: [Int]] = [:]
//dic["abc", default: []].append(1)
//print(dic)


/*
@autoclosure 自动闭包
 会自动将20变成闭包
 只支出() -> T格式 函数类型: 无参, 只返回一个参数
 支持任意一个位置参数
 ??: public func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T?) rethrows -> T?
*/
//func autoAction(_ v2: @autoclosure () -> Int, _ v1: Int) {
//    print(v2())
//}
//autoAction(20, 10)

//精通swift 视频

/*
 类和结构体的属性:
    实例属性
    1.存储属性: 每个实例都有一份; 必须有值
    2.计算属性
    类型属性:
    1.存储属性: 整个程序运行过程中, 只有一份内存(类似全局变量)  static var count: Int = 0,  Shape.count = 10;
        (1)默认lazy,
        (2)因为没有实例的init初始化器来初始化, 随意可以随时赋值,
        (3)多线程同时访问 只会初始化一次, 线程安全
        (4)可以是let
    2.计算类型: static var count: Int { return 10 }
 可以通过static 定义类型属性: static var count: Int = 0
 如果是类 可以用class : class var count: Int = 0

 枚举也可以定义类型属性: 存储类型属性和计算类型属性


 结构体: 跟参数大小有关
 类: 8字节类型信息, 8字节引用个数+参数
 */

//struct Shape {
//    var width: Int  //存储属性
//    var side: Int { //存储属性+属性观察器
//        willSet {
//            print("side will set")
//        }
//        didSet {
//            print("side did set")
//        }
//    }
//    var girth: Int { //计算属性
//        set {
//            width = newValue / side
//            print("setGrirth", newValue)
//        }
//        get {
//            print("getGrith")
//            return width * side
//        }
//    }
//
//    func show() {
//        print("width=\(width), side=\(side), grith=\(girth)")
//    }
//}
//
//var num = 10
//func test(_ num: inout Int) {
//    num = 20
//}
//test(&num)//将num地址值直接传入方法
//
//var s = Shape(width: 10, side: 4)
//test(&s.width) //将s的地址值传入 因为width是第一个参数, 所以还是传入width的地址值
//test(&s.girth) //计算属性, 先调用getter方法 生成一个局部变量 将地址传入test, test 修改局部变量  然后setter方法, 将局部变量的s值传出去
//test(&s.side) //将side的值赋值给局部变量 然后局部变量地址给test, test修改局部变量地址的内容, 然后传回setter方法, 调用willset, 将局部变量的值赋给真实的side地址
//s.show()

/*
 copy in  copy out = 将实参的值 产生副本 然后传递副本
    1.调用该函数, 先复制实参的值, 产生副本[get]
    2.将副本的内存地址传入函数(副本进行引用传递) 在该函数内部可以修改该副本的值
    3.函数返回后, 再将副本的值覆盖实参的值[set]

 inout: 本质是地址传递
*/


/*
 mutating:
    结构体和枚举是值类型, 默认 值类型不能被自身的实例方法修改, 在func前加mutating 可以允许这种修改行为

 @discardableResult: 消除函数未返回返回值的警告

 subscript 下标: 可以给任何类型(枚举, 结构体, 类) 添加下标功能 point[]
    可以没有set  但必须有get
 */

//class Point {
//    var x = 0.0, y = 0.0
//    subscript(index i: Int) -> Double {
//        set {
//            if i == 0 {
//                x = newValue
//            } else if i == 1 {
//                y = newValue
//            }
//        }
//
//        get {
//            if i == 0 {
//                return x
//            } else if i == 1 {
//                return y
//            }
//            return 0
//        }
//    }
//
//    class subscript(i: Int, j: Int) -> Int {
//        return i+j
//    }
//
//    @discardableResult
//    func action() -> Int  {
//        return 10
//    }
//}
//let p = Point()
//p.y = 10.1
//p.action()
//print(p[index: 0])
//_ = Point[10, 11]


/*
 类的继承
 */

//class Circle {
//    var radius: Int = 0
//    var diameter: Int {
//        set {
//            radius = newValue/2
//        }
//        get {
//            return 2 * radius
//        }
//    }
//}
//
//class SubCircle: Circle {
//    override var radius: Int {
//        set {
//            super.radius = newValue
//        }
//        get { return super.radius }
//    }
//
//    override var diameter: Int {
//        set {
//            super.diameter = newValue
//        }
//        get {
//            return super.diameter
//        }
//    }
//}
//
//
//
//struct Point {
//    var x = 10
//    var y = 20
//}
//
//class PointManage {
//    var point = Point()
//    subscript(index: Int) -> Point {
//        set { point = newValue }
//        get { return point }
//    }
//}
//
//var pm = PointManage()
//pm[0].x = 55
////如果是结构体  上面的等价于  pm[0] = Point(x: 55, y: pm[0].y)
//pm[0].y = 66


//class Person {}
//var num = 0
//typealias Fn = (Int) -> (Int)
//func getFn() -> Fn {
//    var num = 0
//    var p1 = Person()
//    func plus(_ i: Int) -> Int {
//        num += i
//        return num
////        return i
//    }
//    return plus
//}
//
//let tmp = getFn()
//print(tmp(1))
//print(tmp(2))
//
//let tmp2 = getFn()
//print(tmp(3))
//print(tmp(4))


//typealias Fn = (Int) -> (Int, Int)
//func getFns() -> (Fn, Fn) {
//    var num1 = 0
//    var num2 = 0
//    func plus(_ i: Int) -> (Int, Int) {
//        num1 += i
//        num2 += i << 1
//        return (num1, num2)
//    }
//
//    func minus(_ i: Int) -> (Int, Int) {
//        num1 -= i
//        num2 -= i << 1
//        return (num1, num2)
//    }
//    return (plus, minus)
//}
//
//let (p, m) = getFns()
//print(p(5))//(5, 10)
//print(m(4))//(1, 2)
//print(p(3))//(4, 8)
//print(m(2))//(2, 4)

/*
 require 修饰指定初始化器 必须实现

 初始化器 可以继承
 */
//class Person {
//    required init() {}
//    init(age: Int) {}
//}
//
//class Student: Person {
//    //默认继承初始化器, 便利初始化器
//    init(name: String) {
//        super.init()
//    }
//
//    required init() {
//        super.init()
//    }
//}


/*
 属性观察器:
    父类的属性在自己的初始化器中赋值 不会触发属性观察器, 但在子类的初始化器中赋值会触发属性观察器
 */

/*
 可失败初始化器
    不允许同时定义x参数标签  参数个数 参数类型相同的可失败初始化器和非初始化器
    可以用init!定义隐式解包的可失败初始化器
    可失败初始化器可以调用非可失败初始化器, 非可失败初始化器 调用可失败初始化器需要进行解包
 */

//public typealias Void = ()

//var num1: Int? = 5
//num1 = 10 //Optional(10)
//
//var num2: Int? = nil
//num2? = 16 //nil, 如果num2为nil 则不赋值

/*
 协议:
 CaseIterable: 遍历枚举值,
 CustomStringConvertible: 同OC的description
 CustomDebugStringConvertible: 同OC的description
 Any, AnyObject:
    Any: 代表任何m类型(枚举 结构体 类 也包括函数表达式)
    AnyObject:可以代表任何类类型
 */

//CaseIterable
//enum Season: CaseIterable {
//    case a
//    case b
//}
//let seasons = Season.allCases //[Season]

//CustomStringConvertible
//class Person: CustomStringConvertible {
//    var age = 0
//    var description: String {
//        "age = \(age)"
//    }
//}
//let p = Person()
//print(p)//age = 0

//po 调用debugDescription
//class Person: CustomDebugStringConvertible {
//    var age = 0
//    var debugDescription: String {
//        "age = \(age)"
//    }
//}


//Any, AnyObject
//只能被类遵守的协议
//protocol ClassResume1: class {
//}
//protocol ClassResume2: AnyObject {
//}

//is  as? as! as
//is 用来a判断是否为某种类型 //返回true 或false
//as 用来做强制类型转换

//.self  .Type  AnyClass
//public typealias AnyClass = AnyObject.Type
//.self 是一个元类型(metadata)的指针, metadata存放这类型相关信息
//class Person {
//    required init() {}
//}
//
//let p = Person()
//var pType: Person.Type = Person.self
//
//let p2: AnyObject = Person()
//let pType2: AnyObject.Type = Person.self
//
//let pTypeSome = type(of: p) // == Person.Type, 直接拿到p的前8字节 赋值
//
//
//print(Person.self.init())
//print(p, pType, p2, pType2, pTypeSome)

//Self 作为返回值类型, 限定返回值跟方法调用者必须是同一个类型
//      作为参数类型
//      代表当前类型
//protocol Runable {
//    func test() -> Self
//}
//class Person: Runable {
//    var age = 10
//    static var count = 0
//    func action() {
//        print(self.age)
//        print(Self.count)
//    }
//
//    required init() { }
//    func test() -> Self {
//        type(of: self).init()
//    }
//}


/*
 错误处理:
    throws 函数本身发生错误
    rethrows: 调用闭包参数等 可能抛出错误

    defer: 用来定义以任何方式(抛错误, return等)离开代码块前必须要执行的代码
    断言: 不符合指令条件就抛出运行时错误, 不能捕捉, 只会debug生效
    fatalError: 无法捕捉 直接结束程序运行
 */
// throws
//enum MyError: Error {
//    case error(String)
//}
//func a(_ num: Int) throws -> Int {
//    if num == 0 {
//        throw MyError.error("xxxx")
//    }
//    return num
//}
//do {
//    try let result = a(0)
//} catch MyError.error(let msg) {
//    print(msg)
//}


// rethrows
//func exex(_ fn: (Int, Int) throws -> Int, _ num1: Int, _ num2: Int) rethrows {
//    try fn(num1, num2)
//}
//
//exex((+), 10, 20)

//defer: 将代码延迟到当前作用域结束之前执行
//        执行顺序与定义顺序相反
//func test() {
//    defer {
//        print("2")
//    }
//    defer {
//        print("1")
//    }
//}
//test() // 1, 2

//assert: release情况下默认失效
//swift flags:
//-assert-config Release: 强制关闭断言
//-assert-config Debug: 强制开启断言
//func action(_ value: Int) {
//    assert(value > 0, "大于0")
//}
//action(-1)

//fatalError: 无法捕捉 直接结束程序运行

/*
 泛型: 将类型参数化
        将类型的metaData当参数传入
 */

//泛型函数
//func test<T1, T2>(_ t1: T1, _ t2: T2) {}

//class Stack<E> {
//    var elements = [E]()
//}
//class SubStack<E>: Stack<E> {
//
//}

//struct Stack<E> {
//    var elements = [E]()
//    mutating func pop() -> E {
//        return elements.removeLast()
//    }
//}
//
//enum Score<E> {
//    case push(E)
//    case popS(String)
//}
//let s = Score<Int>.popS("aaa")


/*
 关联类型: 给协议中用到的类型定义一个占位名称
 */
//protocol Stackable {
//    associatedtype Element //关联类型
//    mutating func pop() -> Element
//    mutating func push(_ element: Element)
//}
//class StringData: Stackable {
////    typealias Element = String //给关联类型设置真实的类型, 也可以删掉 方法内指出类型
//    var elements = [String]()
//    func pop() -> String {
//        elements.removeLast()
//    }
//    func push(_ element: String) {
//        elements.append(element)
//    }
//}


/*
 类型约束
 */

//protocol Runable {}
//class Person { }
//func swapValues<T: Person & Runable>(_ a: inout T, _ b: inout T) {
//    (a, b) = (b, a)
//}

//protocol Stackable {
//    associatedtype Element: Equatable
//}
//class Stack<E: Equatable>: Stackable {
//    typealias Element = E
//}
//func equal<S1: Stackable, S2: Stackable>(_ s1: S1, _ s2: S2) -> Bool where S1.Element == S2.Element, S1.Element: Hashable {
//    return false
//}

////细节: 有associatedtype的协议
//protocol Runable {
//    associatedtype Speed
//    var speed: Speed { get }
//}
//class Person: Runable {
//    var speed: Int { 0 }
//}
//class Car: Runable {
//    var speed: Double { 0 }
//}
//
////Protocol 'Runable' can only be used as a generic constraint because it has Self or associated type requirements
////func get(_ type: Int) -> Runable {
////    if type == 0 {
////        return Person()
////    }
////    return Car()
////}
////解决1: 使用泛型
//func get<T: Runable>(_ type: Int) -> T? {
//    if type == 0 {
//        return Person() as? T
//    }
//    return Car() as? T
//}
////解决2: 使用some关键字声明一个不透明类型
////      限制只能返回一种类型
////场景: 返回一个遵守协议的类型, 但是对象不想暴露出去, 让外界只能调写方法, 不能使用具体类的方法
//func get(_ type: Int) -> some Runable {
//    return Car()
//}
//
////some除了使用再返回值类型上, 还可以用再属性类型上
//class NewA {
//    var car: some Runable { //因为协议有关联类型, 所以需要some
//        return Car()
//    }
//}


/*
 String 和 Array
 */
//var str1 = "0123456789ABCDE"
//0x3736353433323130 0xea00000000003938
//0xea   e->标志位  表示 存在str1的变量内  a代表长度
//小于等于15内 直接放str1的变量内

//var str1 = "0123456789ABCDEF"
//0xd000000000000010 0x8000000100002b30
//0xd000000000000010: d标志位 10长度  0x8000000100002b30 真实地址+0x7fffffffffffffe0
//调用String 初始化器
//字符串的真实地址 + 0x7fffffffffffffe0 = 0x8000000100002b30
//字符串的真实地址 = 0x8000000100002b30 + 0x20
//真实地址: 0x100002B50
//call String.init 传入字符串真实地址, 字符串长度

//swift 字面量会放在代码段 约等于常量区
//调试方式 创建一个class 在malloc中打断点

/*
 总结:
     var str1 = "0123456789ABCDE"
     小于等于15内 直接放str1的变量内

     var str1 = "0123456789ABCDEF"
     大于0xF 字符串内容存放再__TEXT.cstring中(常量区)
     字符串的地址值信息存放再str2变量的后8个字节中, 后8个字节+0x20, 0x20的位置存类型信息

    如果字符串append后超过了0xF, 开辟对空间,
*/


/*
 dyld_stub_bind: 动态符号绑定, 用到的时候绑定
    编译的时候 用地址占位
    运行的时候 将计算好的 方法地址 填到占位的地址

 */

/*
 Array: 占用8字节
    8个字节放堆空间地址值  指向  未知8字节
                             引用计数
                             元素数量
                             数组容量
                             真实数据1
                             真实数据2...
 */

//jmp和call 区别 涉及函数栈

/*
 枚举: 内存1字节+关联类型最大的大小
     public enum Optional<Wrapped> : ExpressibleByNilLiteral {
     case none
     case some(Wrapped)
     public init(_ some: Wrapped)
     }
 */

/*
 溢出运算符
 &+, %-, &*, 用来支持溢出运算,
 */
//var value = UInt8.min
//let tmp1 = value &- 1
//print(tmp1) // 255
//value = UInt8.max
//let tmp2 = value &+ 1
//print(tmp2) //0

/*
 运算符重载 oc没有, 函数名相同 功能不一样
 */
//struct Point {
//    var x = 0, y = 0
//
//    static func + (p1: Point, p2: Point) -> Point {
//        Point(x: p1.x+p2.x, y: p1.y+p2.y)
//    }//写着类, 结构体, 枚举里面需要写static
//
//    //++p
//    static prefix func - (p: Point) -> Point {
//        Point(x: -p.x, y: -p.y)
//    }
//    //p++
//    static postfix func ++ (p1: inout Point) -> Point{
//        let tmp = p1
//        p1 += Point(x: 1, y: 1)
//        return tmp
//    }
//    //p += tmp
//    static func += (p1: inout Point, p2: Point) {
//        p1 = p1 + p2
//    }
//}
////func + (p1: Point, p2: Point) -> Point {
////    Point(x: p1.x+p2.x, y: p1.y+p2.y)
////}
//var p1 = Point(x: 20, y: 20)
//var p2 = Point(x: 10, y: 10)
////let p = p1+p2
////p1 += p2
//p1 = p1++
//print(p1)

/*
 Equatable:
 自动实现: 没有关联类型的枚举, 或者关联类型遵守Equatable协议
          只有遵守Equatable协议的存储属性 自动提供实现
 === !==  引用类型 是否指向同一类型
 */
//class Person: Equatable {
//    var age: Int
//    init(age: Int) {
//        self.age = age
//    }
//
//    static func == (p1: Person, p2: Person) -> Bool {
//        return p1.age == p2.age
//    }
//}
//var p1 = Person(age: 10)
//var p2 = Person(age: 10)
//print(p1 == p2) // true
//print(p1 === p2) //false

/*
 Comparable: 比较运算符

 */
//struct Point: Comparable {
//    var x = 0, y = 0
//
//    static func < (lhs: Point, rhs: Point) -> Bool {
//        lhs.x < rhs.x && lhs.y < rhs.y
//    }
//    // <  >=  <=
//}

//infix operator +-: PlusMinusPrecedence
//precedencegroup PlusMinusPrecedence {
//    associativity: none //结合性 none 表示没有
//    higherThan: AdditionPrecedence
//    lowerThan: MultiplicationPrecedence
//    assignment: true //在可选链操作中 拥有跟赋值运算符一样的优先级,  如果? 则后面不执行
//}
//
//struct Point {
//    var x = 0, y = 0
//    static func +- (p1: Point, p2: Point) -> Point {
//        Point(x: p1.x + p2.x, y: p1.y - p2.y)
//    }
//}


/*
 扩展
 */

//扩展中的初始化 不影响原来的初始化方法
//struct Point {
//    var x = 0, y = 0
//}
//extension Point {
//    init(p: Point) {
//        self = Point(x: p.x, y: p.y)
//    }
//}
// let p = Point(x: 10, y: 10)
//let tmp = Point(p: p)
//print(tmp)

//protocol TestProtocol {
//    func test1()
//}
//extension TestProtocol {
//    func test1() {
//        print("TestProtocol, test1")
//    }
//    func test2() {
//        print("TestProtocol, test1")
//    }
//}
//
//class TestClass: TestProtocol {
//    func test1() {
//        print("TestClass, test1")
//    }
//    func test2() {
//        print("TestClass, test1")
//    }
//}
//
//let cls: TestProtocol = TestClass()
//cls.test1()
//cls.test2()

/*
 访问控制:
    open: 允许在定义实体的模块, 其他模块访问, 允许其他模块进行继承,重写, open 只能用在类 类成员上
    public 允许在定义实体的模块, 其他模块访问, 不允许其他模块继承,重写
    internal[默认的]: 只允许在定义实体的模块中访问, 不允许其他模块中访问
    fileprivate: 只允许再定义实体的源文件中访问
    private: 只允许在定义实体的封闭声明中访问

 使用:
    一个实体不可以被更低访问级别的实体定义: 比如
    变量类型的访问级别 >= 变量的访问级别
    变量\常量类型 >= 变量\常量
    参数类型, 返回值类型 >= 函数
     父类 >= 子类
     父协议 >= 子协议
     原类型 >= typealias
     原始值类型, 关联值类型 >= 枚举类型
     定义类型A时用到的t其他类型 >= 类型A

    元组类型的访问级别是所有成员类型最低的那个

    泛型类型的访问级别是 类型的访问级别 和 所有泛型类型参数的访问级别中最低的那个

    类型的访问级别会影响成员(属性, 方法, 初始化器, 下标), 嵌套类型的默认访问级别
        类型为private或者fileprivate, 那么成员\嵌套类型默认也是private或者fileprivate
        类型为internal或public 那么成员\嵌套类型默认internal
 */

//private(set) var age = 0
//setterf单独设置一个比getter更低的访问级别, 用来限制写的权限

//协议实现的访问级别必须 >= 遵循协议的类型的访问级别, 或者 >= 协议的访问级别


//struct Person {
//    var age = 0
//    func run(_ v: Int) {
//        print("func rn ", age, v)
//    }
//}
//var fn1 = Person.run //(Person) -< ((Int) -> ())
//var v2 = fn1(Person(age: 10))
//v2(20)


/*
 闭包:
 非逃逸闭包: 闭包调用发生在函数结束钱, 闭包调用在函数作用域内
 逃逸闭包: 闭包有可能再a函数结束后调用, 闭包调用逃离了函数的作用域, 需要@escaping声明
 */

/*
 局部作用域
 */
//do {
//
//}

/*
 内存访问冲突 两个访问满足时发生
    1.至少一个是写入操作
    2.他们访问的是同一块内存
    3.他们的访问时间重叠(比如在同一个函数内)
如果下面的条件可以满足, 就说明重叠访问结构体的属性是安全的
    1.你只访问实例存储属性, 不是计算属性或者类属性
    2.结构体是局部变量而非全局变量
    3.结构体要么没有被闭包捕获要么只被非逃逸闭包捕获
 */

//var step = 1
//func action(_ num: inout Int) {
//    num += step
//}
//action(&step)
//Simultaneous accesses to 0x100002020, but modification requires exclusive access.


/*
 指针:
 UnsafePointer<Pointee>    类似于 const Pointee * 只可以访问
 UnsafeMutablePointer           Pointee *       可访问 可修改
 UnsafeRawPointer               const void *
 UnsafeMutableRawPointer        void *
 */

//var age = 10
//func test1(_ p: UnsafeMutablePointer<Int>) {
//    p.pointee = 20
//}
//
//func test2(_ p: UnsafePointer<Int>) {
//    print("test2", p.pointee)
//}
//
//func test3(_ p: UnsafeRawPointer) {
//    let d = p.load(as: Int.self)
//    print("test3", d)
//}
//
//func test4(_ p: UnsafeMutableRawPointer) {
//    p.storeBytes(of: 30, as: Int.self)
//}
//
//test1(&age)
//test2(&age)
//test3(&age)
//test4(&age)
//print(age)

//获取某个变量的指针
//var age = 10
//var ptr = withUnsafePointer(to: &age) { $0 }
//var ptr2 = withUnsafeMutablePointer(to: &age) { $0 }
//var ptr3 = UnsafeRawPointer(ptr)
//var ptr4 = UnsafeMutableRawPointer(ptr2)
//0x0000000100002050
//- pointerValue : 4294975568

//获取指向堆空间实例的指针
//class Person {
//    var age: Int
//    init(age: Int) {
//        self.age = 10
//    }
//}
//var p = Person(age: 20)
//var ptr = withUnsafePointer(to: &p) { $0 }
//var ptr1 = UnsafeRawPointer(ptr)
//print(ptr.pointee.age)
//
//var ptrAddress = UnsafeMutableRawPointer(bitPattern: ptr1.load(as: UInt.self))
//print(ptrAddress)//person的堆空间地址值
//
//print("@@@@")
//创建指针  [HandJson 使用指针]
//var ptr = malloc(16) //申请16字节
//ptr?.storeBytes(of: 10, as: Int.self)
//ptr?.storeBytes(of: 20, toByteOffset: 8, as: Int.self)
//
//let value = ptr?.load(as: Int.self)
//let value2 = ptr?.load(fromByteOffset: 8, as: Int.self)
//
//print(value, value2)
//free(ptr)

//var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1) //申请16字节
//let next8 = ptr.advanced(by: 8)
//next8.storeBytes(of: 20, as: Int.self)
//ptr.deallocate()

//var ptr = UnsafeMutablePointer<Int>.allocate(capacity: 3) //3个容量Int类型
////ptr.pointee = 10
//ptr.initialize(to: 10)
////ptr.initialize(repeating: 10, count: 2)
//let next8 = ptr.successor()
//next8.initialize(to: 20)
//print(ptr.pointee)
//print(ptr.successor().pointee)
//print((ptr+1).pointee)
//print(ptr[0])
//print(ptr[1])
//
//ptr.deinitialize(count: 3) //反初始化, 不调用可能内存泄露
//ptr.deallocate()

//class Person {
//    var age = 0
//    var name = ""
//    init(age: Int, name: String) {
//        self.age = age
//        self.name = name
//    }
//    deinit {
//        print("deinit", name)
//    }
//}
//
//var ptr = UnsafeMutablePointer<Person>.allocate(capacity: 3)
//ptr.initialize(to: Person(age: 20, name: "json"))
//(ptr+1).initialize(to: Person(age: 25, name: "rose"))
//(ptr+2).initialize(to: Person(age: 25, name: "back"))
//
////ptr[2].age
//
//ptr.deinitialize(count: 3)
//ptr.deallocate()

//指针之间的交换
//var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1) //申请16字节
//
//let ptr2 = ptr.assumingMemoryBound(to: Int.self) //UnsafeMutableRawPointer -> UnsafeMutablePointer<Int>
//
////忽略数据类型的强制转换, 不会因为数据类型的变化而改变原来的内存数据, 如果格式不一样 数据读取可能不同
////类似c++中的reinterpret_cast
//let ptr3 = unsafeBitCast(ptr, to: UnsafeMutablePointer<Int>.self) //UnsafeMutableRawPointer -> UnsafeMutablePointer<Int>
//
//ptr.deallocate()



/*
 字面量
 */
//public typealias IntegerLiteralType = Int
//FloatLiteralType
//BooleanLiteralType
//StringLiteralType


/*
 通配符模式
 _ 匹配任何值
 _? 匹配非nil值
 */

//enum Life {
//    case human(name: String, age: Int)
//    case other(name: String, age: Int?)
//}
//func check(_ l: Life) {
//    switch l {
//    case .human(let name, _):
//        print("human", name)
//    case .other(let name, _?): //包含other(name, age非nil的情况)
//        print("other", name)
//    case .other(let name, nil):
//        print("other", name, "age 为空")
//    }
//}
//check(Life.other(name: "case", age: nil))

//var num: Int? = nil
//switch num {
////case let v?:
//case .some(let x):
//    print("num 非空", x)
//case nil:
//    print("num nil")
//}

//let age = 2
//if age >= 0, age <= 9 {
//    print("0-9")
//}
//if case 0...9 = age {
//    print("0-9")
//}
//
//for case let (x, 0) in [(1, 1), (2, 0)] {
//    print(x)
//}

//表达式匹配
//~=
//自定义表达式模式
//struct Student {
//    var score = 0, name = ""
//    // pattern: case后面的模式, value: switch后面放的
//    static func ~= (pattern: Int, value: Student) -> Bool {
//        value.score >= pattern
//    }
//    static func ~= (pattern: Range<Int>, value: Student) -> Bool {
//        pattern.contains(value.score)
//    }
//    static func ~= (pattern: ClosedRange<Int>, value: Student) -> Bool {
//        pattern.contains(value.score)
//    }
//}
//let stu = Student(score: 10, name: "rose")
//switch stu {
//case 100: print(">= 100")
//case 90: print(">= 90")
//case 80..<90: print("[80, 90)") //Range<Int>
//case 60...79: print("[60, 79]") //ClosedRange<Int>
//case 0: print(">= 0")
//default: break
//}

//自定义
//prefix operator ~>
//prefix operator ~>=
//prefix operator ~<=
//prefix func ~> (_ value: Int) -> ((Int) -> Bool) {
//    {
//        $0 > value
//    }
//}
//prefix func ~>= (_ value: Int) -> ((Int) -> Bool) {
//    {
//        $0 >= value
//    }
//}
//prefix func ~<= (_ value: Int) -> ((Int) -> Bool) {
//    {
//        $0 <= value
//    }
//}
//
//extension Int {
//    static func ~= (pattern: (Int) -> Bool, value: Int) -> Bool {
//        pattern(value)
//    }
//}
//
//let age = 10
//switch age {
//case ~>=10:
//    print("a")
//case ~<=20:
//    print("<= 20")
//case ~>5:
//    print("> 5")
//default: break
//}


/*
 条件编译

    #file, #line, #function
    文件    行数    方法
     file: String = #file,
     line: UInt = #line,
     function: String = #function

 @available(*, unavailable, renamed:  "funcname")
 */



/*
 混编: 如果swift方法和c语言方法相同了 将c语言的方法改名swift_sum
 */
//func sum(_ a: Int, _ b: Int) -> Int {
//    return a-b
//}
//写的c语言函数
//int sum(int a, int b) { return a+b }
//如果swift方法和c语言方法相同了    将c语言的方法改名swift_sum
//@_silgen_name("sum")func swift_sum(_ v1: Int32, _v2: Int32) -> Int32

//print(sum(0, 10))
//print(swift_sum(10, _v2: 20))


//swift 调用oc 将oc文件写入 targetName-bridging-header.h
//oc调用swift import target-swift.h
/*
 target-swift.h 文件路径  项目 build setting -> generate interface
 */

//objcMembers 将swift  Car全部暴露给oc, Car必须要继承NSObject
//@objcMembers class Car: NSObject {
//    //将方法a暴露给oc
//    @objc func a() { }
//
//    @objc(band) //name 暴露给oc的时候 为band
//    var name = ""
//    //obj.band = xxx
//
//    @objc(exec:v2:)
//    func test(name: String, casr: String) {}
//    //[obj exec:10 v2: 20];
//}


/*
 选择器
    objcMembers或者@objc 暴露给oc 才能#selector
 */

/*
 1.为什么Swift暴露给oc的类最终要继承NSObject
    因为走msg_send, 需要isa指针
 2. swift调用oc  方法底层是怎么调用的  OC调用Swift  方法是怎么调用的
    纯swift 方法走虚表 callq
    oc暴露给swift  swift 调用方法 走msg_send
    OC调用Swift
    objcMembers修饰的类 swift自己调用依旧用虚表
    dynamic修饰的方法 走msg_send
 */


/*
 string 和 NSString区别
 */

//var str = "12345"
//let range = str.startIndex..<str.index(str.startIndex, offsetBy: 3)
//var subStr = str[range] //此时 subStr 是str的一部分
//print(subStr)
//subStr.append("6")
//print(subStr)
//print(str)

//let a: String = "123"
//let b: NSString = "123"
//print(a.count)//3
//print(b.length)//3

/*
 BidirectionalCollection
 startIndex属性, endIndex属性, index方法
 string array 都遵守

 RangeReplaceableCollection
 append, insert, remove方法
 string array 都遵守
 */

//多行字符串
//let str = """
//    u
//        "i"
//    i
//    'o'
//"""
//print(str)

//比较字符串是否等价
//NSString使用isEqual, 使用==,  使用==本质上还是调用isEqual

/*
 只能被class继承的协议
 protocol Runnable1: AnyObject { }
 protocol Runnable2: class { }
 @objc protocol Runnable3 { } //这种方式会暴露给oc去实现
 */



////1.可选的默认实现
//@objc protocol Runnable {
//    @objc optional func run()
//}
////2. 可选的默认实现
//extension Runnable {
//    func run() {}
//}
//class Person: Runnable { }



/*
 dynamic
 */
//class Person {
//    @objc dynamic func test1() {
//        //被@objc dynamic修饰的内容具有动态性, 比如调用r方法走runtime
//    }
//    func test2() {
//        //没有调用的时候 走虚表调用
//    }
//}


/*
 Swift支持KVC/KVO
    属性所在的类 监听器最终继承自NSObject
    用 @objc dynamic 修饰对应的属性
 */

/*
 Swift class依旧可以使用associateObject
    extension不能添加存储属性, 可以添加计算属性
             添加存储属性 使用关联对象
 */

//class Person { }
//extension Person {
//    private static var AGE_KEY: Bool = false
////    private static var AGE_KEY: Bool
//    var age: Int {
//        get {
//            objc_getAssociatedObject(self, &Self.AGE_KEY) as? Int ?? 0
//        }
//        set {
//            objc_setAssociatedObject(self, &Person.AGE_KEY, 20, .OBJC_ASSOCIATION_ASSIGN)
//        }
//    }
//}


//GCD
//let item = DispatchWorkItem {
//    print("block")
//}
//DispatchQueue.global().async(execute: item)
//item.notify(queue: DispatchQueue.main) {
//    print("main block")
//}

//延迟
//let time = DispatchTime.now() + 3
//let item = DispatchWorkItem {
//    print("block")
//}
//DispatchQueue.main.asyncAfter(deadline: time, execute: item)
//DispatchQueue.main.asyncAfter(deadline: time) {
//    print("block")
//}
//item.cancel()

//once

//全局变量只会初始化一次 lazy
//fileprivate var initTask: Void = {
//    print("init----once")
//}()
//class Person {
//    //静态变量只会初始化一次, lazy 用到才会初始化
////    static var age: Int = {
////        print("once")
////        return 0
////    }()
//
//    //getAge放在dispatch once执行
////    static var age: Int = getAge()
////    static func getAge() -> Int {
////        print("once")
////        return 0
////    }
//}

/*
 函数式编程
 */

//var arr = [1, 2, 3, 4]
//var arr2 = arr.map( { $0+2 }) //映射
//var arr3 = arr.filter( { $0 % 2 == 0 }) //过滤
//var arr4 = arr.reduce(0) { $0 + $1 }
//
//
////lazy的优化
//let result = arr.lazy.map { (i) -> Int in
//    print("$$$ -> \(i)")
//    return i * 2
//}
//
//print("begin")
//print("value ->\(result[0])")
//print("value ->\(result[1])")
//print("value ->\(result[2])")
//print("value ->\(result[0])") //用到才会计算
//print("end")

/*
 打印结果
 begin
 $$$ -> 1
 value ->2
 $$$ -> 2
 value ->4
 $$$ -> 3
 value ->6
 $$$ -> 1
 value ->2
 end
 */

//func add(_ v: Int) -> (Int) -> Int {
//    return {
//        $0 + v
//    }
//}
//func aub(_ v: Int) -> (Int) -> Int {
//    return {
//        $0 - v
//    }
//}
//func multiple(_ v: Int) -> (Int) -> Int {
//    return {
//        $0 * v
//    }
//}
//func divide(_ v: Int) -> (Int) -> Int {
//    return {
//        $0 / v
//    }
//}
//func mod(_ v: Int) -> (Int) -> Int {
//    return {
//        $0 % v
//    }
//}

//[(num + 3) * 5 - 1] % 10 /2
//let num = 1
//let fn = add(3)
//let value = fn(num)
//print(fn(1), fn(5), fn(10))

//func compose(_ f1: @escaping (Int)-> Int, _ f2: @escaping (Int)-> Int) -> (Int) -> Int {
//    return {
//        f2(f1($0))
//    }
//}
//
//let fn = compose(add(3), multiple(5))
//let value = fn(1)
//print(value)

//infix operator >>> : AdditionPrecedence
//func >>> (_ f1: @escaping (Int)-> Int, _ f2: @escaping (Int)-> Int) -> (Int) -> Int {
//    return {
//        f2(f1($0))
//    }
//}
//let fn = add(3) >>> multiple(5)
//print(fn(1))

//infix operator >>> : AdditionPrecedence
//func >>> <A, B, C> (_ f1: @escaping (A)-> B, _ f2: @escaping (B)-> C) -> (A) -> C {
//    return {
//        f2(f1($0))
//    }
//}
//let fn = add(3) >>> multiple(5)
//print(fn(1))


/*
 高阶函数, 接受一个或者多个函数作为输入 或者 返回一个函数
 柯里化(Currying): 将一个接受多参数的函数变换为一系列只接受单个参数的函数
 Array. optional的map方法接受的参数就是一个柯里化函数
 */

//func test(_ a: Int, _ b: Int) -> Int {
//    return a+b
//}
//
//func currying<A, B, C>(_ fn: @escaping (A, B) -> C) -> (B) -> (A) -> C {
//    return { b in
//        return { a in
//            fn(a, b)
//        }
//    }
//}
//
//let fn = currying(test(_:_:))
//print(fn(10)(20))


//func add2(_ a: Int, _ b: Int, _ c: Int) -> Int {
//    return a+b+c
//}
//
//prefix func ~<A, B, C, D>(_ fn: @escaping (A, B, C) -> D) -> (C) -> (B) -> (A) -> D {
//    return { c in
//        return { b in
//            return { a in
//                fn(a, b, c)
//            }
//        }
//
//    }
//}


/*
 函子: 像Array Optional这种支持map运算的 称为函子
    public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]

 xxx函子  没记住
 */

/*
 单子
 */


//struct MJ<Base> {
//    var base: Base
//    init(_ b: Base) {
//        self.base = b
//    }
//}
//
//extension String {
//    var mj: MJ<String> { MJ.init(self) }
//    static var mj: MJ<String>.Type { return MJ<String>.self }
//}
//extension MJ where Base == String {
//    var numCount: Int {
//        var count = 0
//        for c in base where ("0"..."9").contains(c) {
//            count += 1
//        }
//        return count
//    }
//}
//
//class Person {}
//extension Person {
//    var mj: MJ<Person> { MJ.init(self) }
//}
//
//extension MJ where Base == Person {
//    func test() { print("test") }
//}

/*
 metaData:  协议 枚举 结构体 object 不同的metadata
 ox50 虚表
 反射  通过Mirror类型拿到简单的反射功能
 */

//kakajson


//let mirror = Mirror(reflecting: Person())


//class Person {
//    lazy var name: Int = {
//        return 123
//    }()
//}
//
//class Pl: Person {
//
//}
//
//var p = Pl()
//p.name = 16
//
//var ptr = withUnsafePointer(to: &p) { $0 }
//var ptr1 = UnsafeRawPointer(ptr)
//var ptrAddress = UnsafeMutableRawPointer(bitPattern: ptr1.load(as: UInt.self))
//print(ptrAddress)//person的堆空间地址值
//print("$$$")



//多多卖房 日活1w 月活5w
//c端   日活3k 月活5w


//模式匹配 switch where
//let point = (8, 8)
//
//switch point {
//case (let x, let y) where x == y:
////这里对x,y解析,并添加一个where条件x=y时才执行下方代码
//    print("这个点在y=x上")
//case (0, 0):
//    print("这个点在原点上")
//default:
//    print("这个点不符合以上2中情况")
//}



////test
//protocol Pro {
//    func a()
//}
//extension Pro {
//    func a() {
//        print("协议")
//    }
//}
//
//class Obj: Pro {
//
//}
//
//class Person: Obj {
//
//}
//extension Person {
//    func a() {
//        print("Person")
//    }
//}
//let p = Person()
//p.a()


//满足条件才扩展
//extension Reactive where Base: FDDNetworkCacheProtocol


//内部可写 外部可读
//protocol A {
//    var name: String { get }
//}
//class AO: A {
//    private(set) var name: String = "aaa"
//}


//GCD
//let serialQueue = DispatchQueue(label: "concurrent", attributes: DispatchQueue.Attributes.concurrent)
//serialQueue.suspend()
//serialQueue.resume()

/*
 Operation: 默认同步执行
    需要监测任务的执行状态。
    任务是封装好的，需要可复用。
    任务需要在某些时候取消。
    任务之间需要添加依赖等
 */


//isReady： 任务准备好了，可以执行了。
//isExecuting： 调用 Operation start 方法，此时任务是执行中。
//isCancelled： 调用 Operation cancel 方法，任务切换到取消状态（之后会自己切换到 isFinished 结束状态）。
//isFinished： 任务执行完毕
//opt.isReady


//let opt = BlockOperation.init {
//    print(1, "\(Thread.current)")
//}
//opt.addExecutionBlock {
//    print(2, "\(Thread.current)")
//}
//opt.addExecutionBlock {
//    print(3, "\(Thread.current)")
//}
////监听任务执行完成
//opt.completionBlock = {
//    print("执行完成")
//}
//opt.start()



