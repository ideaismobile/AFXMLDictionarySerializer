//
//  AFXMLDictionaryResponseSerializer.m
//  AFXMLDictionarySerializer
//
//  Created by Thiago Peres on 09/10/13.
//  Copyright (c) 2013 Ideais Mobile. All rights reserved.
//

#import "AFXMLDictionaryResponseSerializer.h"
#import <XMLDictionary/XMLDictionary.h>
#import "XMLDictionarySettings.h"

@implementation AFXMLDictionaryResponseSerializer

+ (instancetype)serializer {
	return [[self alloc] init];
}

- (instancetype)init {
	self = [super init];
	if (!self) {
		return nil;
	}

	self.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml", nil];

	return self;
}

#pragma mark - Config parser

- (void)configParser:(XMLDictionarySettings *)settingsObject {
	[XMLDictionaryParser sharedInstance].collapseTextNodes = settingsObject.collapseTextNodes;
	[XMLDictionaryParser sharedInstance].stripEmptyNodes = settingsObject.stripEmptyNodes;
	[XMLDictionaryParser sharedInstance].trimWhiteSpace = settingsObject.trimWhiteSpace;
	[XMLDictionaryParser sharedInstance].alwaysUseArrays = settingsObject.alwaysUseArrays;
	[XMLDictionaryParser sharedInstance].preserveComments = settingsObject.preserveComments;
	[XMLDictionaryParser sharedInstance].attributesMode = settingsObject.attributesMode;
	[XMLDictionaryParser sharedInstance].nodeNameMode = settingsObject.nodeNameMode;
}

#pragma mark - AFURLRequestSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
	if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
		if ([(NSError *)(*error)code] == NSURLErrorCannotDecodeContentData) {
			return nil;
		}
	}

	if ([data length] > 0) {
		return [NSDictionary dictionaryWithXMLData:data];
	}

	return nil;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (!self) {
		return nil;
	}

	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
	AFXMLDictionaryResponseSerializer *serializer = [[[self class] allocWithZone:zone] init];

	return serializer;
}

@end
