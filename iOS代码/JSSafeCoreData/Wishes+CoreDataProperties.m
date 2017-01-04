//
//  Wishes+CoreDataProperties.m
//  JSSafeCoreData
//
//  Created by ipi on 2017/1/4.
//  Copyright © 2017年 zjs. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Wishes+CoreDataProperties.h"

@implementation Wishes (CoreDataProperties)

+ (NSFetchRequest<Wishes *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Wishes"];
}

@dynamic id;
@dynamic name;
@dynamic type;

@end
