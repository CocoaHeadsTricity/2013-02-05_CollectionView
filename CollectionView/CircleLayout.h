//
//  CustomLayout.h
//  CollectionView
//
//  Created by dragon on 26.01.2013.
//  Copyright (c) 2013 Lukasz Domaradzki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;

@end
