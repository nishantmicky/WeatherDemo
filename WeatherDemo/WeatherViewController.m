#import "WeatherViewController.h"

#import "WeatherAPIServices.h"
#import "WeatherView.h"
#import "WeatherViewModel.h"

@interface WeatherViewController ()

@property (nonatomic) WeatherViewModel *viewModel;
@property (nonatomic) WeatherView *weatherView;

@end

@implementation WeatherViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: Used constant location name for now, will be adding a text field to get location name.
    NSString *locationName = @"London";
    WeatherAPIServices *api = [[WeatherAPIServices alloc] init];
    [api getCurrentWeatherDetails:locationName
                  completionBlock:^(WeatherViewModel *viewModel) {
        if (viewModel) {
            self.viewModel = viewModel;
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    if (self.viewModel) {
        [self setUpViews];
        [self setUpConstraints];
    } else {
        // TODO: Need to show error view when error occurs during data fetching.
    }
}

#pragma mark - Private Methods

- (void)setUpViews {
    self.weatherView = [[WeatherView alloc] initWithViewModel:self.viewModel];
    self.weatherView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.weatherView];
}

- (void)setUpConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.weatherView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.weatherView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.weatherView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.weatherView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    ]];
}

@end
