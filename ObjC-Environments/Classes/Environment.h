//
//  Environment.h
//  ObjC-Environments
//
//  Created by Ryan Copley on 11/8/13.
//  Copyright (c) 2013 Ryan Copley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Environment : NSObject

@property (nonatomic, retain) NSString* configType;

+(Environment *) currentEnvironment;
-(void) reload;

@end
