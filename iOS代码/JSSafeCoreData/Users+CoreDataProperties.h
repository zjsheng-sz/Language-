//
//  Users+CoreDataProperties.h
//  JSSafeCoreData
//
//  Created by ipi on 2017/1/4.
//  Copyright © 2017年 zjs. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Users+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
