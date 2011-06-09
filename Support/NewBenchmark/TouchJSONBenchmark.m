#import <Foundation/Foundation.h>

#import "CJSONSerializer.h"
#import "CJSONDeserializer.h"

int main (int argc, const char * argv[])
{
@autoreleasepool {

    NSDictionary *theDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
        @"Hello", @"World",
        NULL];
        
    CJSONSerializer *theSerializer = [CJSONSerializer serializer];
    CJSONDeserializer *theDeserializer = [CJSONDeserializer deserializer];

    NSData *theData = [theSerializer serializeObject:theDictionary error:NULL];

    CFAbsoluteTime theStart = CFAbsoluteTimeGetCurrent();
    for (int N = 0; N != 2000000; ++N)
        {
    ////    [theDeserizl serializeObject:theDictionary error:NULL];
        @autoreleasepool {
            [theDeserializer deserialize:theData error:NULL];
            }
        }



    CFAbsoluteTime theEnd = CFAbsoluteTimeGetCurrent();

    NSLog(@"%g", theEnd - theStart);


    }
return 0;
}
