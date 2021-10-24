#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WeatherViewModel.h"

@interface WeatherAPIServices : NSObject

/**
 * Returns Weather view model for the given location.
 *
 * @param location Location name.
 * @param completionBlock Weather View model result.
 */
- (void)getCurrentWeatherDetails:(NSString *)location
                 completionBlock:(void (^) (WeatherViewModel *))completionBlock;

@end
