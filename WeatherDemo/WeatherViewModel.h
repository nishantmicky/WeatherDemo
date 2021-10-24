#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WeatherViewModel : NSObject

@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *dateOfWeather;
@property (nonatomic, strong) NSString *condition;
@property (nonatomic, strong) NSString *conditionImageIcon;
@property (nonatomic) int currentTemperature;
@property (nonatomic) int minimumTemperature;
@property (nonatomic) int maximumTemperature;
@property (nonatomic) int pressure;
@property (nonatomic) int humidity;
@property (nonatomic) float windSpeed;

/**
 * Returns |WeatherViewModel| insatnce for dictionary of Weather details.
 *
 * @param dictionary Dictionary having details of response from api.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 * Returns UIImage for the current weather condition.
 */
- (UIImage *)getWeatherImageForCurrentCondition;

@end
