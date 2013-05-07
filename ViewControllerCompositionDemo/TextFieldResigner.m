//
//  TextFieldResigner.m
//  ViewControllerCompositionDemo
//
//  Created by Daniel Tull on 07.05.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "TextFieldResigner.h"

@interface TextFieldResigner ()
@property (nonatomic, strong) UIBarButtonItem *originalItem;
@end

@implementation TextFieldResigner

- (void)dealloc {
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	[defaultCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[defaultCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (id)init {
	self = [super init];
	if (!self) return nil;
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	[defaultCenter addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
	[defaultCenter addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
	return self;
}

- (void)setResignBarButtonItem:(UIBarButtonItem *)resignBarButtonItem {
	_resignBarButtonItem = resignBarButtonItem;
	_resignBarButtonItem.target = self;
	_resignBarButtonItem.action = @selector(cancel:);
}

- (void)keyboardWillShowNotification:(NSNotification *)notification {
	UIBarButtonItem *leftBarButtonItem = self.navigationItem.leftBarButtonItem;
	self.originalItem = [leftBarButtonItem isEqual:self.resignBarButtonItem] ? nil : leftBarButtonItem;
	[self.navigationItem setLeftBarButtonItem:self.resignBarButtonItem animated:YES];
}

- (void)keyboardWillHideNotification:(NSNotification *)notification {
	[self.navigationItem setLeftBarButtonItem:self.originalItem animated:YES];
	self.originalItem = nil;
}

- (IBAction)cancel:(id)sender {
	[self.textFields makeObjectsPerformSelector:@selector(resignFirstResponder)];
}

@end
