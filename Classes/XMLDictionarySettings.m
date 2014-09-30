//
//  XMLParserSettings.m
//  AFXMLDictionarySerializer
//
//  Created by Илья Седов on 30.09.14.
//  Copyright (c) 2014 Ideais Mobile. All rights reserved.
//

#import "XMLDictionarySettings.h"

@implementation XMLDictionarySettings

- (instancetype)init {
	self = [super init];
	if (self) {
		_collapseTextNodes = YES;
		_stripEmptyNodes = YES;
		_trimWhiteSpace = YES;
		_alwaysUseArrays = NO;
		_preserveComments = NO;
	}
	return self;
}

@end
