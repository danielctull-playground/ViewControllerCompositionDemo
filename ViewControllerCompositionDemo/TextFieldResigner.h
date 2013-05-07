//
//  TextFieldResigner.h
//  ViewControllerCompositionDemo
//
//  Created by Daniel Tull on 07.05.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextFieldResigner : NSObject
@property (nonatomic, strong) IBOutlet UIBarButtonItem *resignBarButtonItem;
@property (nonatomic, strong) IBOutlet UINavigationItem *navigationItem;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFields;
@end
