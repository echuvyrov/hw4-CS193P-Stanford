//
//  StanfordTourRecentsViewController.m
//  StanfordTour
//
//  Created by Eugene Chuvyrov on 3/16/13.
//  Copyright (c) 2013 Eugene Chuvyrov. All rights reserved.
//

#import "StanfordTourRecentsViewController.h"

@interface StanfordTourRecentsViewController ()

@end

@implementation StanfordTourRecentsViewController

- (void)viewDidLoad
{
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:FALSE];
    NSArray* recentPhotos = [[NSUserDefaults standardUserDefaults] objectForKey:@"StanfordTourHistory"];
    
    //reverse sort the array so that latest photos appear first
    NSMutableArray* reversedArray = [[NSMutableArray alloc] initWithArray:[[[[NSArray alloc] initWithArray: recentPhotos] reverseObjectEnumerator] allObjects]];
    self.photos = reversedArray;
}

@end
