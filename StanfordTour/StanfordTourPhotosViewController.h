//
//  StanfordTourPhotosViewController.h
//  StanfordTour
//
//  Created by Eugene Chuvyrov on 3/15/13.
//  Copyright (c) 2013 Eugene Chuvyrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrPhotoTVC.h"
#import "TourCategoryPhotos.h"

@interface StanfordTourPhotosViewController : FlickrPhotoTVC

@property (nonatomic, strong)TourCategoryPhotos* category;

@end
