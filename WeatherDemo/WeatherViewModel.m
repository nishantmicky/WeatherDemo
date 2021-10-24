#import "WeatherViewModel.h"

static NSString *const kLocationNameKey = @"name";
static NSString *const kCurrentDateKey = @"dt";
static NSString *const kCurrentWeatherKey = @"weather";
static NSString *const kWeatherDescriptionKey = @"description";
static NSString *const kWeatherImageIconKey = @"icon";
static NSString *const kDetailsKey = @"main";
static NSString *const kCurrentTemperatureKey = @"temp";
static NSString *const kTemperatureMinKey = @"temp_min";
static NSString *const kTemperatureMaxKey = @"temp_max";
static NSString *const kCurrentPressureKey = @"pressure";
static NSString *const kCurrentHumidityKey = @"humidity";
static NSString *const kCurrentWindKey = @"wind";
static NSString *const kCurrentWindSpeedKey = @"speed";

static NSString *const kImageURLPrefix = @"https://openweathermap.org/img/wn/";
static NSString *const kImageURLSuffix = @".png";

static NSString *const kLocaleForDateFormat = @"en_US";

@implementation WeatherViewModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        _location = dictionary[kLocationNameKey];
        
        NSDate *dateValue = [NSDate dateWithTimeIntervalSince1970:[dictionary[kCurrentDateKey] doubleValue]];
        _dateOfWeather = [self convertToDateFormat:dateValue];
        
        NSDictionary *currentWeather = [dictionary[kCurrentWeatherKey] objectAtIndex:0];
        _condition = currentWeather[kWeatherDescriptionKey];
        _conditionImageIcon = currentWeather[kWeatherImageIconKey];
        
        NSDictionary *mainValues = dictionary[kDetailsKey];
        _currentTemperature = [mainValues[kCurrentTemperatureKey] intValue];
        _minimumTemperature = [mainValues[kTemperatureMinKey] intValue];
        _maximumTemperature = [mainValues[kTemperatureMaxKey] intValue];
        _pressure = [mainValues[kCurrentPressureKey] intValue];
        _humidity = [mainValues[kCurrentHumidityKey] intValue];
        
        _windSpeed = [dictionary[kCurrentWindKey][kCurrentWindSpeedKey] floatValue];
    }
    
    return self;
}

#pragma mark - Public Methods

- (UIImage *)getWeatherImageForCurrentCondition {
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", kImageURLPrefix, self.conditionImageIcon, kImageURLSuffix];
    NSURL *imageURL = [NSURL URLWithString:urlString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    return [UIImage imageWithData:imageData];
}

#pragma mark - Private Methods

- (NSString *)convertToDateFormat:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:kLocaleForDateFormat];
    
    return [dateFormatter stringFromDate:date];
}

@end
