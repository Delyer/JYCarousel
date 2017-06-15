# **轮播组件：JYCarousel**

**开源库名称：** **JYCarousel**

**开源库当前版本：** **0.0.2**

**开源库简介：** 这是一个使用起来非常简单的开源轮播库，自带下载和缓存，不会造成循环引用，不用考虑定时器不会销毁（我都已经帮你做好了）。


![](https://github.com/Delyer/JYCarousel/raw/master/JYCarouselImage/JYCarouselIcon.png)

## **1. 轮播库引用方式**

- **1.直接下载工程，把包含源代码的文件夹JYCarousel引入工程即可使用**
- **2.支持cocoapods。当前版本0.0.2 在Podfile文件中添加以下文字即可：**
```
pod 'JYCarousel', '~> 0.0.2'
```

## **2. 轮播基本原理**

使用三个imageView添加到ScrollView，始终保持中间的imageView在可视界面里。当前的imageView滚动到下一个imageView，然后把下一个imageView滚动到三个imageView的中心位置，在这过程中赋值的时候是三个imageView同时赋值，滚动的时候找到最中间的imageView，把这个imageView的tag值设置为当前的索引，滚动完成后把这个imageView设置为中心滚动位置。

比如三张图A、B、C。要做的scrollview实际上应该是五张的大小顺序是C、A、B、C、A。初始偏移量设置到第二张，监听scrollview滑动事件。判断偏移量。当偏移量在第一张时将偏移量修改到第四张，当偏移量在第五张时将偏移量调整到第二章。这样在循环时比较流畅，才能无缝无限循环滚动


![](https://github.com/Delyer/JYCarousel/raw/master/JYCarouselImage/JYCarouselDemo.gif)


## **3. 轮播的特性**
- **无缝循环轮播，处理的很好，不会显得生硬**

- **自带图片下载和缓存，不依赖任何第三方，引入即可使用，不用任何配置**

- **支持block方式和delegate方式,使用起来巨方便**

- **随时根据需要清除缓存**

- **采用disk缓存，不会占用app内存，释放你的app内存**

- **可以随时更新轮播数据，完美切换,**

- **用户可自定义的属性多，具体见配置文件JYConfiguration**


## **4. 代码文件结构和功能**

**JYCarousel**

- **JYCarousel**
	- 作用：轮播组件的创建和开始
- **JYConfiguration** 
	- 作用：轮播组件的自定义配置，配置你想要的效果
- **JYPageControl** 
	- 作用：轮播组件的指示器样式
- **JYTitleLabel** 
	- 作用：标签的样式
- **JYWeakTimer**
	- 作用：轮播组件的弱引用定时器，解决NSTimer不能销毁的问题
- **UIImageView+JYImageViewManager** 
	- 作用：imageView请求网络图片的分类
- **JYImageDownloader**
	-  作用：请求网络图片
- **JYImageCache**
	- 作用：网络图片的缓存

![](https://github.com/Delyer/JYCarousel/raw/master/JYCarouselImage/JYCarouselStruct.png)

## **5. 轮播组件的使用**

#### **提供两个初始化方法：**

```
/**
 block方式回调初始化
 @param frame       frame
 @param configBlock 轮播属性配置
 @param clickBlock  点击回调
 @return carousel
 */
- (instancetype)initWithFrame:(CGRect)frame
                  configBlock:(CarouselConfigurationBlock)configBlock
                   clickBlock:(CarouselClickBlock)clickBlock;


/**
 delegate方式回调初始化
 @param frame       frame
 @param configBlock 轮播属性配置
 @param target      delegate
 @return carousel
 */
- (instancetype)initWithFrame:(CGRect)frame
                  configBlock:(CarouselConfigurationBlock)configBlock
                       target:(id<JYCarouselDelegate>)target;
```



#### **使用举例：**

##### **1.block回调方式创建：**

```
- (void)addCarouselView1{
    
    //block方式创建
    __weak typeof(self) weakSelf = self;
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];
    
    if (!_carouselView1) {
        _carouselView1= [[JYCarousel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
            carouselConfig.pageContollType = RightPageControl;
            carouselConfig.interValTime = 3;
            return carouselConfig;
        } clickBlock:^(NSInteger index) {
            [weakSelf clickIndex:index];
        }];
        [self.view addSubview:_carouselView1];
    }
    //开始轮播
    [_carouselView1 startCarouselWithArray:imageArray];
    
}

```

##### **2.delegate回调方式创建：**

```
//遵循协议
@interface SubViewController ()<JYCarouselDelegate>

//创建
- (void)addCarouselView2{
    
    NSMutableArray *imageArray2 = [[NSMutableArray alloc] initWithArray: @[@"http://p1.bqimg.com/524586/894925a41a745ba8.jpg",@"http://p1.bqimg.com/524586/edd59898ac21642f.jpg",@"http://p1.bqimg.com/524586/d277aa654cd60c3d.jpg",@"http://p1.bqimg.com/524586/a49b8d3e1b953f25.jpg",@"http://p1.bqimg.com/524586/972bff3b7a5fb7e1.jpg"]];
    
    NSMutableArray *titleArray2 = [[NSMutableArray alloc] initWithArray: @[@"http://p1.bqimg.com/524586/894925a41a745ba8.jpg",@"http://p1.bqimg.com/524586/edd59898ac21642f.jpg",@"http://p1.bqimg.com/524586/d277aa654cd60c3d.jpg",@"http://p1.bqimg.com/524586/a49b8d3e1b953f25.jpg",@"http://p1.bqimg.com/524586/972bff3b7a5fb7e1.jpg"]];
    
    if (!_carouselView2) {
        _carouselView2 = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 120, SCREEN_WIDTH, 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
            carouselConfig.pageContollType = MiddlePageControl;
            carouselConfig.pageTintColor = [UIColor whiteColor];
            carouselConfig.currentPageTintColor = [UIColor redColor];
            carouselConfig.placeholder = [UIImage imageNamed:@"default"];
            carouselConfig.faileReloadTimes = 5;
            carouselConfig.textAlignment = NSTextAlignmentLeft;
            carouselConfig.pageContollType = LabelPageControl;
            return carouselConfig;
        } target:self];
        
        [self.view addSubview:_carouselView2];
    }
    //开始轮播
    [_carouselView2 startCarouselWithArray:imageArray2 titleArray:titleArray2];
    
}

//回调方法
- (void)carouselViewClick:(NSInteger)index{
    NSLog(@"代理方式你点击图片索引index = %ld",index);
    //清楚缓存数据 可以在app启动的时候清楚上一次轮播缓存,根据自己需要
    [[JYImageCache sharedImageCache] jy_clearDiskCaches];
}

```

## **6. 缓存机制**
- 启动时可设置超时自动清除缓存功能

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	//添加以下方法即可
    //每次启动时，检查是否超时，清除缓存(单位是小时这里是10分钟)
    [[JYImageCache sharedImageCache] jy_clearDiskCachesWithTimeout:10.0/60];
}
```

- 手动清除缓存

```
//清除缓存数据 根据自己需要调用
[[JYImageCache sharedImageCache] jy_clearDiskCaches];
```


## **7. 注意事项**

内存得不到释放造成内存泄露，使用循环引用了。请注意使用。看下面在block回调处，对Self是使用弱引用的，不然内存是得不到释放的。
<pre>
// 请使用weakSelf，不然内存得不到释放
  __weak typeof(self) weakSelf = self;
  //图片数组（或者图片URL，图片URL字符串，图片UIImage对象）
  NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray: @[@1.jpg,@2.jpg,@3.jpg,@4.jpg]];
  JYCarousel *carouselView = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 64, ViewWidth(self.view), 100) configBlock:nil clickBlock:NSInteger index {
    //点击imageView回调方法
    [weakSelf clickIndex:index];
  }];
  //开始轮播
 [carouselView startCarouselWithArray:imageArray];
 [self.view addSubview:carouselView];
</pre>


## **8. 版本更新日志**

- 添加启动超时自动清除缓存功能
- 添加titlLabel标签
- 去除切换动画

## **喜欢就给个Star吧！**
