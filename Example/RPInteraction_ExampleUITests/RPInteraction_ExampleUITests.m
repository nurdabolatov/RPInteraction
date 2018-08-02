//
//  RPInteraction_ExampleUITests.m
//  RPInteraction_ExampleUITests
//
//  Created by Nurdaulet Bolatov on 8/2/18.
//  Copyright © 2018 nbolatov. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RPInteraction_ExampleUITests : XCTestCase

@end

@implementation RPInteraction_ExampleUITests {
    XCUIApplication *app;
}

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    app = [[XCUIApplication alloc] init];
    [app launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testBad {
    XCUIElement *showButton = [[app buttons] objectForKeyedSubscript:@"Show"];
    [showButton tap];

    XCUIElement *confirmButton = [[app buttons] objectForKeyedSubscript:@"SUBMIT"];
    [confirmButton tap];

    XCUIElement *rateLabel = [[app staticTexts] elementBoundByIndex:0];
    XCTAssertEqualObjects([rateLabel label], @"BAD");
}

- (void)testUgh {
    XCUIElement *showButton = [[app buttons] objectForKeyedSubscript:@"Show"];
    [showButton tap];

    XCUIElement *scrollView = [[app scrollViews] elementBoundByIndex:0];
    XCUICoordinate *start = [scrollView coordinateWithNormalizedOffset:CGVectorMake(2, 0)];
    XCUICoordinate *end = [scrollView coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    [start pressForDuration:0 thenDragToCoordinate:end];

    XCUIElement *confirmButton = [[app buttons] objectForKeyedSubscript:@"SUBMIT"];
    [confirmButton tap];

    XCUIElement *rateLabel = [[app staticTexts] elementBoundByIndex:0];
    XCTAssertEqualObjects([rateLabel label], @"UGH");
}

- (void)testOk {
    XCUIElement *showButton = [[app buttons] objectForKeyedSubscript:@"Show"];
    [showButton tap];

    XCUIElement *scrollView = [[app scrollViews] elementBoundByIndex:0];

    XCUICoordinate *start1 = [scrollView coordinateWithNormalizedOffset:CGVectorMake(2, 0)];
    XCUICoordinate *end1 = [scrollView coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    [start1 pressForDuration:0 thenDragToCoordinate:end1];

    XCUICoordinate *start2 = [scrollView coordinateWithNormalizedOffset:CGVectorMake(2, 0)];
    XCUICoordinate *end2 = [scrollView coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    [start2 pressForDuration:0 thenDragToCoordinate:end2];

    XCUIElement *confirmButton = [[app buttons] objectForKeyedSubscript:@"SUBMIT"];
    [confirmButton tap];

    XCUIElement *rateLabel = [[app staticTexts] elementBoundByIndex:0];
    XCTAssertEqualObjects([rateLabel label], @"OK");
}

- (void)testGood {
    XCUIElement *showButton = [[app buttons] objectForKeyedSubscript:@"Show"];
    [showButton tap];

    XCUIElement *scrollView = [[app scrollViews] elementBoundByIndex:0];
    XCUICoordinate *start = [scrollView coordinateWithNormalizedOffset:CGVectorMake(0, 0)];
    XCUICoordinate *end = [scrollView coordinateWithNormalizedOffset:CGVectorMake(2, 0)];
    [start pressForDuration:0 thenDragToCoordinate:end];

    XCUIElement *confirmButton = [[app buttons] objectForKeyedSubscript:@"SUBMIT"];
    [confirmButton tap];

    XCUIElement *rateLabel = [[app staticTexts] elementBoundByIndex:0];
    XCTAssertEqualObjects([rateLabel label], @"GOOD");
}

@end
