//
//  PinchFlowLayout.m
//  CollectionView
//
//  Created by dragon on 05.02.2013.
//  Copyright (c) 2013 Lukasz Domaradzki. All rights reserved.
//

#import "PinchFlowLayout.h"

@implementation PinchFlowLayout

-(void)prepareLayout
{
    self.itemSize = (CGSize){100,100};
    self.minimumInteritemSpacing = 100.0f;
    self.minimumLineSpacing = 50.0f;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.sectionInset = UIEdgeInsetsMake(30, 40, 50, 60);
}



-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    [self applyPinchToLayoutAttributes:attributes];
    
    return attributes;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *allAttributesInRect = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *cellAttributes in allAttributesInRect) {
        [self applyPinchToLayoutAttributes:cellAttributes];
    }
    
    return allAttributesInRect;
}

-(void)applyPinchToLayoutAttributes:(UICollectionViewLayoutAttributes*)layoutAttributes
{
    if ([layoutAttributes.indexPath isEqual:self.pinchedCellPath])
    {
        layoutAttributes.transform3D = CATransform3DMakeScale(self.pinchedCellScale, self.pinchedCellScale, 1.0);
        layoutAttributes.center = self.pinchedCellCenter;
        layoutAttributes.zIndex = 1;
    }
}

-(void)setPinchedCellScale:(CGFloat)scale
{
    _pinchedCellScale = scale;
    [self invalidateLayout];
}

-(void)setPinchedCellCenter:(CGPoint)origin
{
    _pinchedCellCenter = origin;
    [self invalidateLayout];
}

@end
