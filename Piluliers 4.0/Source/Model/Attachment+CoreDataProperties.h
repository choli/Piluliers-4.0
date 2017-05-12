//
//  Attachment+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Attachment+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Attachment (CoreDataProperties)

+ (NSFetchRequest<Attachment *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *contentType;
@property (nullable, nonatomic, copy) NSDate *creation;
@property (nullable, nonatomic, copy) NSString *language;
@property (nonatomic) int64_t size;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *url;

@end

NS_ASSUME_NONNULL_END
