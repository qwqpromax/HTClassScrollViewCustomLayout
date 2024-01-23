//
//  HTClassScrollViewCustomLayout.h
//  OCProject
//
//  Created by ajie on 2023/12/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTClassScrollViewCustomLayout : UICollectionViewLayout
@property (nonatomic)CGSize itemSize;
@property (nonatomic) NSInteger visibleCount;
@property (nonatomic) UICollectionViewScrollDirection scrollDirection;

@end

NS_ASSUME_NONNULL_END
