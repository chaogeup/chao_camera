//
//  ITS_CameraVC.m
//  CameraAndPhoto
//
//  Created by chao on 16/1/13.
//  Copyright © 2016年 DoctorMundo. All rights reserved.
//

#import "ITS_CameraVC.h"

@interface ITS_CameraVC () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *_cameraVC;
}

@end

@implementation ITS_CameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initCamera];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)initCamera {
    
    _cameraVC = [[UIImagePickerController alloc] init];
    _cameraVC.delegate = self;
    _cameraVC.allowsEditing = YES;
    _cameraVC.view.frame = self.view.bounds;
    _cameraVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self.view addSubview:_cameraVC.view];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage  * image = info[@"UIImagePickerControllerOriginalImage"];
    __weak  typeof(self)  sf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if(image != nil){
            if(_delegate && [_delegate respondsToSelector:@selector(ITS_CameraVC:didSelectPhoto:editInfo:)]){
                [_delegate ITS_CameraVC:sf didSelectPhoto:image editInfo:info];
            }
        }
    }];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
