//
//  BRSViewController.m
//  HW1
//
//  Created by Ramya Shenoy on 9/7/14.
//  Copyright (c) 2014 ramya. All rights reserved.
//

#import "BRSViewController.h"
NSInteger globalStateVariable = 0;

@interface BRSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BRSViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSDictionary *titleDictionary = @{@"Wear Spectacles": @1, @"Comb Hair": @2, @"Change Clothes": @4};
    NSDictionary *labelDictionary = @{
    @"Wear Spectacles": @{@"select":@"Just Wore Spectacles", @"unSelect":@"Now Removed Spectacles"},
    @"Comb Hair": @{@"select": @"Just Combed Hair", @"unSelect": @"Now Undid my hair"},
    @"Change Clothes": @{@"select": @"Just Changed Clothes", @"unSelect": @"Now Back to Pyjamas"}
    };
    
    int valueToInt;
    NSNumber *buttonValue;
    NSString *imageFileName;
    NSString *textForUILabel;
    NSString *title = [sender titleForState:UIControlStateNormal];
   

    if(sender.selected == false){
        sender.selected = true;
        //set Button Font to bold to indicate that it was pressed
        [sender.titleLabel setFont: [UIFont systemFontOfSize: [UIFont systemFontSize]]];
        
        //Get value associated with button from dictionary and add to state variable
        buttonValue= [titleDictionary valueForKey:title];
        valueToInt = [buttonValue intValue];
        globalStateVariable += valueToInt;
        
        //set UI image based on state variable
        imageFileName = [NSString stringWithFormat:@"%li.jpeg", (long)globalStateVariable];
        _imageView.image = [UIImage imageNamed:imageFileName];
        
        //set Label text based on state
        textForUILabel = [[labelDictionary objectForKey:title]valueForKey:@"select"];
        _statusLabel.text = textForUILabel;
     
    }
    else{
        sender.selected = false;
        //set Button to normal to indicate that it was pressed again
        [sender.titleLabel setFont:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]];
        
        //Get value associated with button from dictionary and subtract from state variable
        buttonValue = [titleDictionary valueForKey:title];
        valueToInt = [buttonValue intValue];
        globalStateVariable -= valueToInt;
        
         //set UI image based on state variable
        imageFileName = [NSString stringWithFormat:@"%li.jpeg", (long)globalStateVariable];
        _imageView.image = [UIImage imageNamed:imageFileName];
        
         //set Label text based on state
        textForUILabel = [[labelDictionary objectForKey:title]valueForKey:@"unSelect"];
        _statusLabel.text = textForUILabel;
    }
    
}
@end
