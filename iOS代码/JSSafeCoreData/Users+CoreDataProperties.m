//
//  Users+CoreDataProperties.m
//  JSSafeCoreData
//
//  Created by ipi on 2017/1/4.
//  Copyright © 2017年 zjs. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Users+CoreDataProperties.h"

@implementation Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Users"];
}

@dynamic id;
@dynamic name;

@end
