//
//  StanfordTourViewController.m
//  StanfordTour
//
//  Created by Eugene Chuvyrov on 3/15/13.
//  Copyright (c) 2013 Eugene Chuvyrov. All rights reserved.
//

#import "StanfordTourViewController.h"
#import "TourCategoryPhotos.h"
#import "FlickrFetcher.h"

@interface StanfordTourViewController ()

@end

@implementation StanfordTourViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *photos = [FlickrFetcher stanfordPhotos];
    NSLog(@"%@", photos);
    [self aggregatePhotos:photos];
}

-(void)aggregatePhotos:(NSArray *)photos
{
    NSMutableArray* groupedPhotos = [[NSMutableArray alloc] init];
    
    for(NSDictionary* photo in photos){
        NSString* tags = [photo objectForKey:FLICKR_TAGS];
        NSArray *arrTags = [tags componentsSeparatedByString:@" "];
        
        for(NSString* tag in arrTags){
            if(![tag isEqualToString:@"cs193pspot"] && ![tag isEqualToString:@"portrait"] && ![tag isEqualToString:@"landscape"]){
            
                //scan through all objects in the array--do we already have this category?
                BOOL tagExists = FALSE;
                for(TourCategoryPhotos* cat in groupedPhotos){
                    if([cat.categoryName isEqualToString:[tag capitalizedString]]){
                        [cat.flickrPhotos addObject:photo];
                        cat.categoryDescription = [NSString stringWithFormat:@"%d photos", cat.flickrPhotos.count];
                        tagExists = TRUE;
                    }
                }
                
                if(tagExists == FALSE) {
                        //add a new object
                        TourCategoryPhotos *categoryPhoto = [[TourCategoryPhotos alloc] init];
                        categoryPhoto.categoryName = [tag capitalizedString];
                        categoryPhoto.categoryDescription = @"1 photo";
                        //categoryPhoto.categoryDescription = [photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
                        categoryPhoto.flickrPhotos = [[NSMutableArray alloc] init];
                        [categoryPhoto.flickrPhotos addObject:photo];
                        
                        [groupedPhotos addObject:categoryPhoto];
                }
            }
        }
    }
    
    self.photos = groupedPhotos;
}

@end
