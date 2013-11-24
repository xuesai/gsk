//
//  Utility.m
//  GSK
//
//  Created by sai on 13-11-21.
//
//

#import "Utility.h"


@implementation Utility

+ (void)requestWithURLString:(NSString*)aUrlStr parameters:(NSDictionary*)aParameters withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    NSMutableString *mutableUrlStr = [NSMutableString stringWithString:aUrlStr];
    
//    if (aParameters != nil && [[aParameters allKeys] count] > 0) {
//        [mutableUrlStr appendString:@"?"];
//        for (NSString *key in [aParameters allKeys]) {
//            [mutableUrlStr appendString:@"&"];
//            [mutableUrlStr appendString:key];
//            [mutableUrlStr appendString:@"="];
//            [mutableUrlStr appendString:[aParameters objectForKey:key]];
//        }
//    }
    NSURL *URL = [NSURL URLWithString:mutableUrlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:success failure:failure];
    [[NSOperationQueue mainQueue] addOperation:op];
}

@end
