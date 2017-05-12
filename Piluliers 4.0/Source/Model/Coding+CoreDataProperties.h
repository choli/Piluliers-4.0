//
//  Coding+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Coding+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Coding (CoreDataProperties)

+ (NSFetchRequest<Coding *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *display;
@property (nullable, nonatomic, copy) NSString *system;

@end

NS_ASSUME_NONNULL_END
