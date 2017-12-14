//
//  APITests.m
//  ToolTests
//
//  Created by Justin on 2017/12/4.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Networking.h"

@interface APITests : XCTestCase

@property (strong, nonatomic) Networking *networking;

@end

@implementation APITests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.networking = [Networking shareManager];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
   
}

- (void)testNetworking {
    
    XCTestExpectation * expectation = [self expectationWithDescription:@"Test Networking"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         [[Networking shareManager] request];
        
        XCTAssert(YES,"should pass");
        sleep(5);
        [expectation fulfill];
    });
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        //Do something when time out
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
