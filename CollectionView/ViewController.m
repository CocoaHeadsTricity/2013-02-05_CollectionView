//
//  ViewController.m
//  CollectionView
//
//  Created by dragon on 25.01.2013.
//  Copyright (c) 2013 Lukasz Domaradzki. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "PinchFlowLayout.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.collectionView addGestureRecognizer:pinchGR];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = (Cell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.cellLabel.text = [@(indexPath.item) stringValue];
    
    return cell;
}

-(void)handlePinchGesture:(UIPinchGestureRecognizer *)sender
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[PinchFlowLayout class]])
    {
        PinchFlowLayout *pinchLayout = (PinchFlowLayout*)self.collectionView.collectionViewLayout;
        
        if (sender.state == UIGestureRecognizerStateBegan)
        {
            CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
            NSIndexPath *pinchedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
            pinchLayout.pinchedCellPath = pinchedCellPath;
        }
        
        else if (sender.state == UIGestureRecognizerStateChanged)
        {
            pinchLayout.pinchedCellScale = sender.scale;
            pinchLayout.pinchedCellCenter = [sender locationInView:self.collectionView];
        } else if (sender.state == UIGestureRecognizerStateEnded)
        {
            
            pinchLayout.pinchedCellPath = nil;
            [pinchLayout invalidateLayout];
        }
    }
    
}

@end
