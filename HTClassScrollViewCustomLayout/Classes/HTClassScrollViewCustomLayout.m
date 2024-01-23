//
//  HTClassScrollViewCustomLayout.m
//  OCProject
//
//  Created by ajie on 2023/12/27.
//
#define INTERSPACEPARAM  0.8

#import "HTClassScrollViewCustomLayout.h"
@interface HTClassScrollViewCustomLayout ()
@property (nonatomic)CGFloat itemWidth;
@property (nonatomic)CGFloat itemHeight;
@property (nonatomic)CGFloat viewWidth;
@property (nonatomic)CGFloat viewHeight;

@end

@implementation HTClassScrollViewCustomLayout
- (void)prepareLayout {
    [super prepareLayout];
    if (self.visibleCount < 1) {
        self.visibleCount = 5;
    }

    self.viewWidth = CGRectGetWidth(self.collectionView.bounds);
    self.viewHeight = CGRectGetHeight(self.collectionView.bounds);
    
    self.itemWidth = self.itemSize.width;
    self.itemHeight = self.itemSize.height;
}

- (CGSize)collectionViewContentSize {
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    CGSize contentSize =  CGSizeMake(cellCount * _itemWidth,CGRectGetHeight(self.collectionView.bounds));
    return contentSize;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat centerX = self.collectionView.contentOffset.x + self.viewWidth / 2;
    
    NSInteger index = centerX / _itemWidth;
    NSInteger visibleCount = 2;
    NSInteger minIndex = MAX(0, (index - visibleCount));
    NSInteger maxIndex = MIN((cellCount - 1), (index + visibleCount));
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = minIndex; i <= maxIndex; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attributes];
        
    }
    
    return array;
    
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = self.itemSize;
    CGFloat screenCenterX = self.collectionView.contentOffset.x + _viewWidth / 2;
    CGFloat attributesCentertX = _itemWidth * indexPath.row + _itemWidth / 2;
    attributes.zIndex = -ABS(screenCenterX - attributesCentertX);
    CGFloat delta = screenCenterX - attributesCentertX;
    CGFloat ratio =  - delta / (_itemWidth * 2);
    CGFloat scale = 1 - ABS(delta) / (_itemWidth * 6.0) * 1.5*cos(ratio * M_PI_4);
    attributes.transform = CGAffineTransformMakeScale(scale, scale);
    CGFloat newCenterX = screenCenterX + delta / 2;
    newCenterX = screenCenterX + sin(ratio * M_PI_2) * (_itemWidth*2-20) *0.5;
    attributes.center = CGPointMake(newCenterX, CGRectGetMidY(self.collectionView.bounds));

    return attributes;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGFloat index = roundf((proposedContentOffset.x + _viewWidth / 2 - _itemWidth / 2) / _itemWidth);
    CGFloat adjustedOffset = _itemWidth * index - _viewWidth / 2 + _itemWidth / 2;
    return CGPointMake(adjustedOffset, proposedContentOffset.y);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return !CGRectEqualToRect(newBounds, self.collectionView.bounds);
}



@end

