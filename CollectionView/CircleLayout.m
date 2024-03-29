//
//  CustomLayout.m
//  CollectionView
//
//  Created by dragon on 26.01.2013.
//  Copyright (c) 2013 Lukasz Domaradzki. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout

#define ITEM_SIZE 70

-(void)prepareLayout
{
    // 1
    
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    
    _center = CGPointMake(size.width / 2.0, size.height / 2.0);
    _radius = MIN(size.width, size.height) / 2.5;
}

-(CGSize)collectionViewContentSize
{
    // 2
    
    return [self collectionView].frame.size;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 3
    
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i=0; i<self.cellCount; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    attributes.center = CGPointMake(
                                    _center.x + _radius * cosf(2*indexPath.item * M_PI / _cellCount),
                                    _center.y + _radius * sinf(2*indexPath.item * M_PI / _cellCount));
    
    return attributes;
}

@end
