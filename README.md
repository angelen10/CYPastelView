# Pastel 
🙋This Project is an Objective-C version of [Pastel](https://github.com/cruisediary/Pastel)
Instagram like Gradient background animation

![Simulator Screen Shot 1.png](https://ww3.sinaimg.cn/large/006tKfTcgy1ffnazbdoicj306k0boaac.jpg)
![Simulator Screen Shot 2.png](https://ww4.sinaimg.cn/large/006tKfTcgy1ffnazb250dj306k0bo3ys.jpg)
![Simulator Screen Shot 3.png](https://ww3.sinaimg.cn/large/006tKfTcgy1ffnazb1lkbj306k0boq37.jpg)

## Example

```objc
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CYPastelView *pastelView = [[CYPastelView alloc] initWithFrame:self.view.bounds];
    pastelView.animationDuration = 3.0;
    [pastelView startAnimation];
    [self.view insertSubview:pastelView atIndex:0];
}
```

## License

Pastel is available under the MIT license. See the LICENSE file for more info.
