//
//  PinchFlowLayout.h
//  CollectionView
//
//  Created by dragon on 05.02.2013.
//  Copyright (c) 2013 Lukasz Domaradzki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinchFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, strong) NSIndexPath *pinchedCellPath;
@property (nonatomic) CGPoint pinchedCellCenter;
@property (nonatomic) CGFloat pinchedCellScale;

@end
