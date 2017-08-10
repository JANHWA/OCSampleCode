//
//  Person.h
//  Realm-Demo
//
//  Created by Justin on 2017/6/10.
//  Copyright © 2017年 justin. All rights reserved.
//

#import <Realm/Realm.h>

@interface Person : RLMObject
@property NSString *name;
@property int       age;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person *><Person>
RLM_ARRAY_TYPE(Person)