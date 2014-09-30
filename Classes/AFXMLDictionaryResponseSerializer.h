//
//  AFXMLDictionaryResponseSerializer.h
//  AFXMLDictionarySerializer
//
//  Created by Thiago Peres on 09/10/13.
//  Copyright (c) 2013 Ideais Mobile. All rights reserved.
//

#import "AFURLResponseSerialization.h"

@class XMLDictionarySettings;

@interface AFXMLDictionaryResponseSerializer : AFHTTPResponseSerializer

- (void)configParser:(XMLDictionarySettings *)settingsObject;

@end
