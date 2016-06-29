//
//  MLSubTopView.h
//  PortOfMilan
//
//  Created by suibian_milangang_sqc on 14-9-23.
//
//

#import <UIKit/UIKit.h>

//@protocol MLSubTopViewDelegate <NSObject>
//
//- (void)protocolBackBtnClick;
//
//@end

@interface MLSubTopView : UIView


@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *bgRoteView;

-(instancetype)initWithFrame:(CGRect)frame;

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)strTitle target:(UIViewController *) target   selecter:(SEL)action;

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)strTitle target:(UIViewController *) target   selecter:(SEL)action showRightBtn:(BOOL)showRightBtn;

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)strTitle titleColor:(UIColor *)titleColor imageLeft:(NSString*)nameImageLeft target:(UIViewController *) target   selecter:(SEL)action showRightBtn:(BOOL)showRightBtn;


@end