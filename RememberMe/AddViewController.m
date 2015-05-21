//
//  AddViewController.m
//  RememberMe
//
//  Created by Alan Barth on 5/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "AddViewController.h"
#import "ListViewController.h"

@interface AddViewController () <UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *birthplaceText;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *interestingFactText;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressText;
@property (weak, nonatomic) IBOutlet UITextField *physicallAttributeText;
@property (weak, nonatomic) IBOutlet UITextField *majorText;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumerText;
@property (weak, nonatomic) IBOutlet UITextField *homeText;
@property (weak, nonatomic) IBOutlet UITextField *locationText;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) Group *template;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (AddViewController *) sharedInstance {
    static AddViewController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [AddViewController new];
    });
    return sharedInstance;
}
- (void)updateWithCategory:(NSString *)categoty {
    
}
- (void) updateViewWithCategory:(Group *)template {

    self.template = template;
}

- (IBAction)saveButton:(id)sender {
    // TODO: get the photo to save correctly
    [[PersonController sharedInstance] createPersonWithName:self.nameText.text birthPlace:self.birthplaceText.text birthDate:self.birthDatePicker.date interestingFact:self.interestingFactText.text email:self.emailAddressText.text physicalAttribute:self.physicallAttributeText.text photo:nil major:self.majorText.text phoneNumber:self.phoneNumerText.text home:self.homeText.text location:self.locationText.text];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            if (self.template.personName.boolValue == NO) {
                return 0;
            } else {
                return 30;
            }
            break;
        case 1:
            if (self.template.photo.boolValue == NO) {
                return 0;
            } else {
                return 85;
            }
            break;
        case 2:
            if (self.template.birthplace.boolValue == NO) {
                return 0;
            } else {
                return 30;
            }
            break;
        case 3:
            if (self.template.birthdate.boolValue == NO) {
                return 0;
            } else {
                return 202;
            }
            break;
        case 4:
            if (self.template.interestingFact.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 5:
            if (self.template.email.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 6:
            if (self.template.physicalAttribute.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 7:
            if (self.template.major.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 8:
            if (self.template.phoneNumber.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 9:
            if (self.template.home.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        case 10:
            if (self.template.location.boolValue == NO) {
                return 0;
            } else {
                return 35;
            }
            break;
        default:
            return 35;
            break;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

#pragma mark Image Picker Methods
- (IBAction)addPhotoButton:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate.self;
    
    UIAlertController *photoActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraRollAction = [UIAlertAction actionWithTitle:@"From Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }];
    [photoActionSheet addAction:cameraRollAction];
    
    UIAlertAction *takePictureAction = [UIAlertAction actionWithTitle:@"Take Picture" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            imagePicker.allowsEditing = YES;
            
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera Not Available on Device" message:@"This device does not have a camera option. Please choose photo from library." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }];
            [alert addAction:dismissAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
    [photoActionSheet addAction:takePictureAction];
    
    [self presentViewController:photoActionSheet animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.imageView.image = image;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
