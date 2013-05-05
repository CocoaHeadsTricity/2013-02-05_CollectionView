//
//  CustomFlowLayout.m
//  CollectionView
//
//  Created by dragon on 25.01.2013.
//  Copyright (c) 2013 Lukasz Domaradzki. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

-(void)prepareLayout
{
    self.itemSize = (CGSize){100,100};
    self.minimumInteritemSpacing = 100.0f;
    self.minimumLineSpacing = 50.0f;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.sectionInset = UIEdgeInsetsMake(30, 40, 50, 60);
}



@end
