//
//  Medication+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Medication+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Medication (CoreDataProperties)

+ (NSFetchRequest<Medication *> *)fetchRequest;

@property (nonatomic) BOOL isBrand;
@property (nonatomic) BOOL isOverTheCounter;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, retain) CodeableConcept *code;
@property (nullable, nonatomic, retain) CodeableConcept *form;
@property (nullable, nonatomic, retain) NSSet<Attachment *> *image;
@property (nullable, nonatomic, retain) NSSet<Ingredient *> *ingredient;
@property (nullable, nonatomic, retain) Package *package;

@end

@interface Medication (CoreDataGeneratedAccessors)

- (void)addImageObject:(Attachment *)value;
- (void)removeImageObject:(Attachment *)value;
- (void)addImage:(NSSet<Attachment *> *)values;
- (void)removeImage:(NSSet<Attachment *> *)values;

- (void)addIngredientObject:(Ingredient *)value;
- (void)removeIngredientObject:(Ingredient *)value;
- (void)addIngredient:(NSSet<Ingredient *> *)values;
- (void)removeIngredient:(NSSet<Ingredient *> *)values;

@end

NS_ASSUME_NONNULL_END
