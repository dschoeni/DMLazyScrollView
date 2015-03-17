//
//  DMViewController.m
//  DMLazyScrollViewExample
//
//  Created by Daniele Margutti (me@danielemargutti.com) on 24/11/12.
//  Copyright (c) 2012 http://www.danielemargutti.com. All rights reserved.
//

#import "DMViewController.h"
#import "DMLazyScrollView.h"

@interface DMViewController () <DMLazyScrollViewDelegate> {
    DMLazyScrollView* lazyScrollView;
    NSMutableArray*    viewControllerArray;
}
@end

@implementation DMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*
    // PREPARE PAGES
    NSUInteger numberOfImages = 10;
    viewControllerArray = [[NSMutableArray alloc] initWithCapacity:numberOfPages];
    for (NSUInteger k = 0; k < numberOfPages; ++k) {
        [viewControllerArray addObject:[NSNull null]];
    }
     */
    
    // Load Array of UNIX-ImagePaths
    imagePaths = [[NSMutableArray alloc] initWithArray:@[@"11_sonntag_001.jpg", @"11_sonntag_002.jpg", @"11_sonntag_003.jpg"]];
    
    // Prepare Lazy View
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 150);
    lazyScrollView = [[DMLazyScrollView alloc] initWithFrame:rect];
    
    // Use weak-self to prevent retain-cycle
    __weak __typeof(&*self)weakSelf = self;
    lazyScrollView.dataSource = ^(NSUInteger index) {
        return [weakSelf imagePathAtIndex:index];
    };
    
    lazyScrollView.numberOfImages = [imagePaths count];

    [self.view addSubview:lazyScrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) imagePathAtIndex:(NSInteger) index {
    return [imagePaths objectAtIndex:index];
}

/*
- (void)lazyScrollViewDidEndDragging:(DMLazyScrollView *)pagingView {
    NSLog(@"Now visible: %@",lazyScrollView.visibleViewController);
}
*/
@end
