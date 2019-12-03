//
//  MDCNUUID.m
//  TestDemo
//
//  Created by Apple on 2019/12/3.
//  Copyright © 2019 Apple. All rights reserved.
//

#import "MDCNUUID.h"
#import "KeyChainStore.h"
#define keyChainNameStr @"com.mycompany.myapp.usernamepassword"
@implementation MDCNUUID
+ (NSString*)getUUID{
    NSString *strUUID = (NSString*)[KeyChainStore load:keyChainNameStr];
    //首次执行该方法时，uuid为空
    if([strUUID isEqualToString:@""]|| !strUUID) {
        
        // 获取UUID 如果要使用这个添加AdSupport.framework静态库 引入<AdSupport/AdSupport.h>的
        // strUUID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
        
        if(strUUID.length == 0 || [strUUID isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
            //生成一个uuid的方法
            CFUUIDRef uuidRef= CFUUIDCreate(kCFAllocatorDefault);
            strUUID = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault,uuidRef));
            CFRelease(uuidRef);
        }
        //将该uuid保存到keychain
        [KeyChainStore save:keyChainNameStr data:strUUID];
    }
    return strUUID;
}
@end
