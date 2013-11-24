//
//  Utility.h
//  GSK
//
//  Created by sai on 13-11-21.
//
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFURLRequestSerialization.h"

@interface Utility : NSObject

+ (void)requestWithURLString:(NSString*)aUrlStr parameters:(NSDictionary*)aParameters withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
