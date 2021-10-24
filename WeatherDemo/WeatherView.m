#import "WeatherView.h"

#import "WeatherViewModel.h"

@interface WeatherView ()

@property (nonatomic) WeatherViewModel *viewModel;
@property (nonatomic) UILabel *locationLabel;
@property (nonatomic) UILabel *dateLabel;
@property (nonatomic) UILabel *currentWeatherDescriptionLabel;
@property (nonatomic) UILabel *currentWeatherTemperatureLabel;
@property (nonatomic) UIImageView *currentWeatherImageView;

@end

@implementation WeatherView

- (instancetype)initWithViewModel:(WeatherViewModel *)viewModel {
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        _viewModel = viewModel;
        
        [self addViews];
        [self setUpConstraints];
        
        // TODO: Add labels for weather details, add table view for forecast for next days.
    }
    
    return self;
}

#pragma mark - Private Methods

- (void)addViews {
    self.locationLabel = [[UILabel alloc] init];
    self.locationLabel.text = [self.viewModel.location capitalizedString];
    self.locationLabel.textColor = [UIColor whiteColor];
    [self.locationLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:40.0f]];
    [self.locationLabel setTextAlignment:NSTextAlignmentCenter];
    self.locationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.text = self.viewModel.dateOfWeather;
    self.dateLabel.textColor = [UIColor whiteColor];
    [self.dateLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18.0f]];
    [self.dateLabel setTextAlignment:NSTextAlignmentCenter];
    self.dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.currentWeatherDescriptionLabel = [[UILabel alloc] init];
    self.currentWeatherDescriptionLabel.text = [self.viewModel.condition capitalizedString];
    self.currentWeatherDescriptionLabel.textColor = [UIColor whiteColor];
    [self.currentWeatherDescriptionLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18.0f]];
    self.currentWeatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.currentWeatherTemperatureLabel = [[UILabel alloc] init];
    self.currentWeatherTemperatureLabel.text = [NSString stringWithFormat:@"%d%@", (self.viewModel.currentTemperature-273), @"\u00B0"];
    self.currentWeatherTemperatureLabel.textColor = [UIColor whiteColor];
    [self.currentWeatherTemperatureLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:90.0f]];
    self.currentWeatherTemperatureLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.currentWeatherImageView = [[UIImageView alloc] initWithImage:[self.viewModel getWeatherImageForCurrentCondition]];
    self.currentWeatherImageView.alpha = 1.0;
    self.currentWeatherImageView.contentMode = UIViewContentModeBottom;
    self.currentWeatherImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.locationLabel];
    [self addSubview:self.dateLabel];
    [self addSubview:self.currentWeatherDescriptionLabel];
    [self addSubview:self.currentWeatherTemperatureLabel];
    [self addSubview:self.currentWeatherImageView];
}

- (void)setUpConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.locationLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:100.0],
        [self.locationLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.locationLabel.heightAnchor constraintEqualToConstant:50.0],
        [self.locationLabel.widthAnchor constraintEqualToConstant:200.0],

        [self.dateLabel.topAnchor constraintEqualToAnchor:self.locationLabel.bottomAnchor],
        [self.dateLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.dateLabel.heightAnchor constraintEqualToConstant:25.0],
        [self.dateLabel.widthAnchor constraintEqualToConstant:200.0],
        
        [self.currentWeatherTemperatureLabel.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor constant:20.0],
        [self.currentWeatherTemperatureLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:-75.0],
        [self.currentWeatherTemperatureLabel.heightAnchor constraintEqualToConstant:100.0],
        [self.currentWeatherTemperatureLabel.widthAnchor constraintEqualToConstant:150.0],
        
        [self.currentWeatherImageView.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor constant:20.0],
        [self.currentWeatherImageView.leadingAnchor constraintEqualToAnchor:self.currentWeatherTemperatureLabel.trailingAnchor constant:20.0],
        [self.currentWeatherImageView.heightAnchor constraintEqualToConstant:60.0],
        [self.currentWeatherImageView.widthAnchor constraintEqualToConstant:100.0],
        
        [self.currentWeatherDescriptionLabel.topAnchor constraintEqualToAnchor:self.currentWeatherImageView.bottomAnchor],
        [self.currentWeatherDescriptionLabel.leadingAnchor constraintEqualToAnchor:self.currentWeatherTemperatureLabel.trailingAnchor constant:20.0],
        [self.currentWeatherDescriptionLabel.heightAnchor constraintEqualToConstant:30.0],
        [self.currentWeatherDescriptionLabel.widthAnchor constraintEqualToConstant:200.0],
        
        
    ]];
}

@end
