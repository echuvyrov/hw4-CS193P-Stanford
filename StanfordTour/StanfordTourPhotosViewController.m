//
//  StanfordTourPhotosViewController.m
//  StanfordTour
//
//  Created by Eugene Chuvyrov on 3/15/13.
//  Copyright (c) 2013 Eugene Chuvyrov. All rights reserved.
//

#import "StanfordTourPhotosViewController.h"
#import "TourCategoryPhotos.h"

@interface StanfordTourPhotosViewController ()

@end

@implementation StanfordTourPhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)setCategory:(TourCategoryPhotos *)category
{
    _category = category;
    self.photos = category.flickrPhotos;
}

@end
