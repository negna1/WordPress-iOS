#import "ServiceRemoteREST.h"
#import "WordPressComApi.h"

static NSString* const ServiceRemoteRESTApiVersionStringInvalid = @"invalid_api_version";
static NSString* const ServiceRemoteRESTApiVersionString_1_1 = @"v1.1";
static NSString* const ServiceRemoteRESTApiVersionString_1_2 = @"v1.2";

@interface ServiceRemoteREST ()
@end

@implementation ServiceRemoteREST

- (id)initWithApi:(WordPressComApi *)api {
    
    NSParameterAssert([api isKindOfClass:[WordPressComApi class]]);
    
    self = [super init];
    if (self) {
        _api = api;
    }
    return self;
}

#pragma mark - API Version

- (NSString *)apiVersionStringWithEnumValue:(ServiceRemoteRESTApiVersion)apiVersion
{
    NSString *result = nil;
    
    switch (apiVersion) {
        case ServiceRemoteRESTApiVersion_1_1:
            result = ServiceRemoteRESTApiVersionString_1_1;
            break;
            
        case ServiceRemoteRESTApiVersion_1_2:
            result = ServiceRemoteRESTApiVersionString_1_2;
            break;
            
        default:
            result = ServiceRemoteRESTApiVersionStringInvalid;
            break;
    }
    
    return result;
}

#pragma mark - Request URL construction

- (NSString *)requestUrlForApiVersion:(ServiceRemoteRESTApiVersion)apiVersion
                          resourceUrl:(NSString *)resourceUrl
{
    NSParameterAssert([resourceUrl isKindOfClass:[NSString class]]);
    
    NSString *apiVersionString = [self apiVersionStringWithEnumValue:apiVersion];
    
    return [NSString stringWithFormat:@"%@/%@", apiVersionString, resourceUrl];
}

- (NSString *)requestUrlForDefaultApiVersionAndResourceUrl:(NSString *)resourceUrl
{
    NSParameterAssert([resourceUrl isKindOfClass:[NSString class]]);
    
    return [self requestUrlForApiVersion:ServiceRemoteRESTApiVersionDefault
                             resourceUrl:resourceUrl];
}

@end
