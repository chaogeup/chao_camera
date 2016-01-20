//
//  ITS_CameraVC.h
//  CameraAndPhoto
//
//  Created by chao on 16/1/13.
//  Copyright © 2016年 DoctorMundo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ITS_CameraVC;
@protocol ITS_CameraVCDelagate <NSObject>

- (void)ITS_CameraVC:(ITS_CameraVC *)cameraVC didSelectPhoto:(UIImage *)photo editInfo:(NSDictionary *)dic;
@end

@interface ITS_CameraVC : UIViewController

@property(nonatomic,weak)id<ITS_CameraVCDelagate> delegate;
@end
