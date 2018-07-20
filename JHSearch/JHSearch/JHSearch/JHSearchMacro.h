//
//  JHSearchMacro.h
//  JHSearch
//
//  Created by HWA on 2018/7/20.
//  Copyright © 2018年 HWA. All rights reserved.
//

#ifndef JHSearchMacro_h
#define JHSearchMacro_h



#define PATH_DOCUMENT NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject

#define PATH_SEARCH_HISTORY [PATH_DOCUMENT stringByAppendingString:@"/searchHistory.plist"]

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif /* JHSearchMacro_h */
