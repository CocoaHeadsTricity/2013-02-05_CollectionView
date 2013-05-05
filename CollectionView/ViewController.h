//
//  ViewController.h
//  CollectionView
//
//  Created by dragon on 25.01.2013.
//  Copyright (c) 2013 Lukasz Domaradzki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
