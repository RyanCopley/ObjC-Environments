//
//  Environment.m
//  ObjC-Environments
//
//  Created by Ryan Copley on 11/8/13.
//  Copyright (c) 2013 Ryan Copley. All rights reserved.
//

#import "Environment.h"

@implementation Environment
@synthesize configType;

+(Environment *) currentEnvironment
{
    static Environment * sharedResourcesObj = nil;
    
    @synchronized(self)
    {
        if (!sharedResourcesObj)
        {
            sharedResourcesObj = [[Environment alloc] init];
            [sharedResourcesObj reload];
        }
    }
    
    return sharedResourcesObj;
}

-(void) reload{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Environments" ofType:@"plist"];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *config = [[bundle infoDictionary] objectForKey:@"Configuration"];
    
    NSDictionary *environments = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSDictionary* environment = environments[config];

    NSLog(@"Environment: %@",environment);
    configType = environment[@"configType"];
}

@end
