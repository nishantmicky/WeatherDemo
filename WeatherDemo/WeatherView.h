#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WeatherViewModel.h"

@interface WeatherView : UIView

/**
 * Returns |WeatherView| insatnce for the Weather View Model.
 *
 * @param viewModel Weather view model.
 */
- (instancetype)initWithViewModel:(WeatherViewModel *)viewModel;

@end
