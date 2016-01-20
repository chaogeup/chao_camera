//
//  ViewController.m
//  CameraAndPhoto
//
//  Created by chao on 16/1/13.
//  Copyright © 2016年 DoctorMundo. All rights reserved.
//

#import "ViewController.h"
#import "ITS_CameraVC.h"

@interface ViewController ()<ITS_CameraVCDelagate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)ButtonClick:(UIButton *)sender {
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"您好" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"从相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        ITS_CameraVC *vc = [[ITS_CameraVC alloc] init];
        vc.delegate = self;
        [self presentViewController:vc animated:YES completion:nil];
        
    }];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"从相册选一张" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction * action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertCon addAction:action1];
    [alertCon addAction:action2];
    [alertCon addAction:action3];
    [self presentViewController:alertCon animated:YES completion:nil];
}

- (void)ITS_CameraVC:(ITS_CameraVC *)cameraVC didSelectPhoto:(UIImage *)photo editInfo:(NSDictionary *)dic {
    self.Image1.image = photo;
    NSLog(@"dic=%@",dic);
    UIImage *image = [dic objectForKey:UIImagePickerControllerEditedImage];
    self.Image2.image = image;
    NSLog(@"--%@",image);
    
    NSData *photoData = UIImageJPEGRepresentation(photo, 1);
    float length = [photoData length]/1000;
    NSData *photoData1 = UIImageJPEGRepresentation(photo, 0.75);
    float length1 = [photoData1 length]/1000;
    
    NSLog(@"压缩前的大小%.2fkb--%.2fkb",length,length1);
    //UIImageWriteToSavedPhotosAlbum(photo, nil, nil, nil);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
