#import <UIKit/UIKit.h>

// Spark it up, we're about to dive into the code!
%hook SBFLockScreenDateView

- (void)setTime:(NSDate *)date {
    // We need to know what time it is, right?
    NSCalendar *chronicCalendar = [NSCalendar currentCalendar];
    NSDateComponents *timeComponents = [chronicCalendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
    
    // Extracting the hour and minute, like separating stems and seeds.
    NSInteger hour = [timeComponents hour];
    NSInteger minute = [timeComponents minute];

    // Is it 4:20 yet?
    if ((hour == 4 || hour == 16) && minute == 20) {
        // If it's 4:20, we gotta celebrate in 12-hour style!
        self.timeLabel.format = @"h:mm"; // 12-hour format
    } else {
        // For all other times, keep it 24-hour. We're not savages.
        self.timeLabel.format = @"HH:mm"; // 24-hour format
    }

    // Pass the time to the original method. Don't bogart the clock!
    %orig(date);
}

%end
