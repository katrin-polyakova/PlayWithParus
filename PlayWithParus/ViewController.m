//
//  ViewController.m
//  PlayWithParus
//
//  Created by Kate Polyakova on 6/20/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "ViewController.h"
#import "PVGroup.h"
#import "PVLayout.h"

@interface ViewController ()

@property(nonatomic, strong) UIView *redView;
@property(nonatomic, strong) UIView *greenView;
@property(nonatomic, strong) UIView *yellowView;
@property(nonatomic, strong) UIView *blueView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redView = [[UIView alloc] init];
    self.greenView = [[UIView alloc] init];
    self.yellowView = [[UIView alloc] init];
    self.blueView = [[UIView alloc] init];

    NSArray *colors = @[ [UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blueColor] ];
    [@[self.redView, self.greenView, self.yellowView, self.blueView] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        [obj setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:obj]; //добавляем view к parentview
        [obj setBackgroundColor:colors[idx]];
        [obj setAlpha:0.5f];
    }];

    [self setupLayout];
}

- (void)setupLayout {

    const int PADDING = 5;
    [self.view addConstraints: PVGroup(@[
            PVLeadingOf(self.redView).equalTo.leftOf(self.view).plus(8),
            PVTopOf(self.redView).equalTo.topOf(self.view).plus(20),
            PVTrailingOf(self.redView).equalTo.leadingOf(self.greenView).minus(PADDING),
            PVTopOf(self.greenView).equalTo.topOf(self.view).plus(20),
            PVTrailingOf(self.greenView).equalTo.rightOf(self.view).minus(8),
            PVBottomOf(self.redView).equalTo.topOf(self.yellowView).minus(PADDING),
            PVBottomOf(self.greenView).equalTo.topOf(self.yellowView).minus(PADDING),
            PVLeadingOf(self.yellowView).equalTo.leftOf(self.view).plus(8),
            PVTrailingOf(self.yellowView).equalTo.rightOf(self.view).minus(8),
            PVBottomOf(self.yellowView).equalTo.topOf(self.blueView).minus(PADDING),
            PVLeadingOf(self.blueView).equalTo.leftOf(self.view).plus(8),
            PVTrailingOf(self.blueView).equalTo.rightOf(self.view).minus(8),
            PVBottomOf(self.blueView).equalTo.bottomOf(self.view).minus(8),

            PVWidthOf(self.redView).equalTo.widthOf(self.greenView),
            PVHeightOf(self.redView).equalTo.heightOf(self.greenView),
            PVHeightOf(self.redView).equalTo.heightOf(self.blueView),
            PVHeightOf(self.redView).equalTo.heightOf(self.yellowView)


    ]).asArray];



//    PVLeftOf(view).equalTo.leftOf(superview).multipliedTo(2).plus(10).asConstraint;
//    [self.view addConstraint:constraint];



}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
