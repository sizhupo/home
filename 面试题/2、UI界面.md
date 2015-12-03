###### ViewController 的 loadView,viewDidLoad, viewDidUnload 分别是在什么时候调用的？在自定义ViewController的时候这几个函数里面应该做什么工作？

	答案：viewDidLoad在view 从nib文件初始化时调用，loadView在controller的view为nil时调用。此方法在编程实现view时调用,view 控制器默认会注册memory warning notification,当view controller的任何view 没有用的时候，viewDidUnload会被调用，在这里实现将retain 的view release,如果是retain的IBOutlet view 属性则不要在这里release,IBOutlet会负责release 。

######  UIView 和CALayer 有什么区别?	`答案：`两者最大的区别是，图层不会直接渲染到屏幕上。######以 UIView 类animateWithDuration:animations: 为例，简述UIView动画原理。
	`答案：`
######为什么很多内置的类，如TableViewController的delegate的属性是assign不是retain？	答案：循环引用
	所有的引用计数系统，都存在循环应用的问题。例如下面的引用关系：
    •    对象a创建并引用到了对象b.
    •    对象b创建并引用到了对象c.
    •    对象c创建并引用到了对象b.
    这时候b和c的引用计数分别是2和1。当a不再使用b，调用release释放对b的所有权，因为c还引用了b，所以b的引用计数为1，b不会被释放。b不释放，c的引用计数就是1，c也不会被释放。从此，b和c永远留在内存中。
    这种情况，必须打断循环引用，通过其他规则来维护引用关系。比如，我们常见的delegate往往是assign方式的属性而不是retain方式 的属性，赋值不会增加引用计数，就是为了防止delegation两端产生不必要的循环引用。如果一个UITableViewController 对象a通过retain获取了UITableView对象b的所有权，这个UITableView对象b的delegate又是a， 如果这个delegate是retain方式的，那基本上就没有机会释放这两个对象了。自己在设计使用delegate模式时，也要注意这点。

######什么是CALayer？

	答案：
	
	①在iOS系统中，你能看得见摸得着的东西基本上都是UIView，比如一个按钮、一个文本标签、一个文本输入框、一个图标等等，这些都是UIView。
	
	②其实UIView之所以能显示在屏幕上，完全是因为它内部的一个层。
	
	③ 在创建UIView对象时，UIView内部会自动创建一个层(即CALayer对象)，通过UIView的layer属性可以访问这个层。当UIView需要显示到屏幕上时，会调用drawRect:方法进行绘图，并且会将所有内容绘制在自己的层上，绘图完毕后，系统会将层拷贝到屏幕上，于是就完成了UIView的显示。
	
	换句话说，UIView本身不具备显示的功能，是它内部的层才有显示功能。    
###### iPhone5、6、6+以及iPad Air 2的屏幕分辨率分别是多少？

     iPhone5的屏幕大小4英寸,分辨率达到1136x640,像素密度为326ppi
     iPhone6Plus采用标准的1920×1080分辨率屏幕,PPI值为401;
     iPhone6则采用了1334×750分辨率的屏幕,PPI值为326。
     iPad Air 2分辨率是2048×1536分辨率。

###### 分辨率的计算单位是什么？

    显示分辨率（屏幕分辨率）是屏幕图像的精密度，是指显示器所能显示的像素有多少。

######请解释一下Interface Builder的作用以及NIB文件的概念。

    nterface Builder（IB）是Mac OS X平台下用于设计和测试用户界面（GUI）的应用程序（非开源）。为了生成GUI，IB并不是必需的，实际上Mac OS X下所有的用户界面元素都可以使用代码直接生成；但IB能够使开发者简单快捷的开发出符合Mac OS X human-interface guidelines的GUI。通常你只需要通过简单的拖拽（drag-n-drop）操作来构建GUI就可以了。IB使用Nib文件储存GUI资源，同时适用于Cocoa和Carbon程序。在需要的时候，Nib文件可以被快速地载入内存。
    
    都是一些对象的描述，类似与VC的.rc资源文件。nib是二进制格式，xib是单一的xml文档，便于源代码版本管理。现在新版本的Xcode 在创建项目时，已经默认使xib格式的文档了。在build的时候，xcode会把xib都转换为nib（反序列化效率高）。app启动的时候会根据xml构造xib对应的界面及其控件。
    
###### iOS UI的图像储存类型是什么？

    图像一般都存储为nsdata类型，生内存

###### 请描述一下Storyboard和标准NIB文件的差别。
    nib是3.0版本以前的产物，在终端下我们可以看到，NIB其实是一个文件夹，里面有可执行的二进制文件；
    xib是一个基于xml的描述文件，可以实现可视化编程。
    无论nib也好，xib也好，最终在执行UIViewController生命周期函数loadView之前，都会转化成可执行的nib文件。

    storyboard是多个xib文件集合的描述文件，也采用xml格式。
    那么storyboard与xib比较，区别在于：
    一个工程中可以有多个xib文件，一个xib文件对应着一个视图控制器和多个视图。而使用storyboard时，一个工程只需要一个主storyboard文件就可以了。因此，在包含多个视图控制器的情况下，采用storyboard管理比较方便，而且storyboard还可以描述界面之间的导航关系。

###### 设备状态栏（Device Status Bar）是什么？高度如何？是否透明？在手机通话或者导航状态下，它是如何显示的？

16. 导航栏（Navigation Bar）是什么？能否拿出你的iPhone，指出你下载的哪些应用运用了导航栏？

17. 选项卡（Tab Bar）和工具栏（Toolbar）分别是什么？两者之间有何共同点和不同点？

18. 表视图（Table View）是什么？集合视图（Collection View）又是什么？

19. 什么时候用“弹出（Popover）”属性最为合适？

20. Split-view Controller是什么？

21. 选取器视图（Picker View）适合存放哪类内容？

22. 应该在什么情况下使用标签、文本域和文本视图？

23. 分段控件（Segmented Control）的作用是什么？

24. 模态视图（Modal View）是什么？

25. iOS通知属于什么类型？
26. fame、bounds、center、alpha、opaque、hidden
 
###### 定制化view
    需要自己继承来自cocoa touch提供的丰富类。如：UIView，UIScrollView，UITableView等等。需要重载drawRect、touch事件，init、initFrame等方法。
	
######LayoutSubViews在什么时候会调用？
###### 如何解决Cell重用问题

	答案：UITableView通过重用单元格来达到节省内存的目的：通过为每个单元格制定一个重用的标示符，及制定了单元格的种类，以及当单元格滚出屏幕是，允许回复单元格以便重用。对于不同种类的单元格使用不同的ID。对于简单的表格，一个标识符就够了。
	
	假如一个TableView中有10个单元格，但是屏幕上最多能显示4个，那么实际iPhone只是为其分配了4个单元格的内存，没有分配10个，当滚动单元格时，屏幕内显示的单元格重复使用这四个内存。实际上分配的Cell个数为屏幕最大显示数，当有新的Cell进入屏幕时，会随机调用已经滚出屏幕的Cell所占的内存，这就是Cell的重用。
	
	对于多变的自定义Cell，这种重用机制会导致内容出错。为了解决这种出错适合的方法就是把原来的UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:defineString];修改为: UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath]; 这样就能解决掉Cell重用机制导致的问题。	