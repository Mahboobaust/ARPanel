//
//  Define.h
//  Fakruddin
//
//  Created by Mahboob on 6/11/15.
//  Copyright (c) 2015 Mahboob. All rights reserved.
//

#ifndef Fakruddin_Define_h
#define Fakruddin_Define_h

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define DATE_FORMAT_2 @"yyyy-MM-dd"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define FONT_NAME [UIFont fontNamesForFamilyName: @"Quicksand"]
#define DEFAULT_FONT [UIFont fontWithName:@"Quicksand" size:17]

#define DEFAULT_ANIMATION_TIME 0.3f

#define API_KEY @"AIzaSyCxE0HPXASfuqBbD9xgluOD3BVXCZSDgj0"
#define NO_INTERNET_MESSEGE @"No Internet Connection.\nPlease check your internet connection and try again."
#define NO_INTERNET_MESSEGE_BANGLA @"ইন্টারনেট সংযোগ নেই .\n দয়া করে আপনার ইন্টারনেট সংযোগ যাচাই করে আবার চেষ্টা করুন "


typedef enum{
    RIDER_REQUEST_FAILED,
    RIDER_LESS_THAN_FOUR_TRIPS,
    RIDER_NO_TRIP,
    RIDER_INACTIVE,
    RIDER_ALL,
}RIDER_SELECT;

typedef enum{
    BIKER_EMPLOYEE,
    BIKER_FREELANCERS,
}BIKER_TYPE;

typedef enum{
    SELECT_RIDER,
    SELECT_BIKER,
}SELECT_SMS;


typedef enum{
    API_FAILED,
    API_SUCCESSFUL,
}APISTATUS;

typedef enum{
    STATUS_IDLE,
    STATUS_AVAILABLE,
}BIKER_STATUS;

typedef enum{
    SEX_MALE=0,
    SEX_FEMALE,
}USER_SEX;

typedef enum{
    LANGUAGE_SETTINGS_ENGLISH=1,
    LANGUAGE_SETTINGS_BANGLA,
}LANGUAGE_SETTINGS;



typedef enum{
    AMAR_BIKE=0,
    AMAR_CNG,
    AMAR_CAR,
    AMAR_COURIER,
}SERVICE_TYPE;

typedef enum{
    TABLE_LOAD_USERMENU,
    TABLE_LOAD_BIKER_MENU,
    TABLE_LOAD_HOSTORY,
    TABLE_LOAD_FAVORITES,
}TABLE_LOAD;

typedef enum{
   
    VIEW_LOAD_HISTORY,
    VIEW_LOAD_FAVORITES,
}VIEW_LOAD;

typedef enum{
    
    GOOGLE_MAP_LOAD_SINGLE_MARKER,
    GOOGLE_MAP_LOAD_SINGLE_SHOW_LIVE,
    GOOGLE_MAP_LOAD_DRAWDISTANCE_LINE,
    GOOGLE_MAP_LOAD_PICKUP_LOCATION,
    GOOGLE_MAP_LOAD_DRAGGABLE,
}GOOGLE_MAP_LOAD;


typedef enum{
    
    PICK_UP_TEXTFIELD,
   DROP_OFF_TEXTFIELD,
}TEXTFIELD_TYPE;

typedef enum{
    
   VIEW_SET_FAVORITE,
   VIEW_SET_LOC_SEARCH,
}AUTO_COMPLETE_SEARCH_VIEW_TYPE;

typedef enum{
    VEHICLE_TYPE_BIKE=0,
    VEHICLE_TYPE_CNG,
    VEHICLE_TYPE_CAR,
}VEHICLE_TYPE;

typedef enum{
    SEND_EMAIL=0,
    SEND_SMS,
}SEND_OPTIONS;



#define PAYMENT_TYPES [NSArray arrayWithObjects:@"Cash",@"Account",@"BKash",nil]
#define USER_MENUS [NSArray arrayWithObjects:@"Home",@"Profile",@"History",@"Favorites",@"Amar Wallet",@"Settings",@"Support",@"Log Out",nil]

#define USER_MENUS_ON_MAP [NSArray arrayWithObjects:@"Home",@"Amar Trips",@"Favorite Trips",@"Amar Wallet",@"Promotions",@"Support",@"Settings",nil]


#define USER_MENU_ON_MAP_BANGLA [NSArray arrayWithObjects:@"বর্তমান ট্রিপ",@"প্রোফাইল",@"যাত্রার ইতিহাস",@"প্রিয় ট্রিপসমূহ",@"আমার ওয়ালেট",@"সেটিংস",@"সাপোর্ট",nil]



#define USER_MENUS_BANGLA [NSArray arrayWithObjects:@"বর্তমান ট্রিপ",@"প্রোফাইল",@"যাত্রার ইতিহাস",@"প্রিয় ট্রিপসমূহ",@"আমার ওয়ালেট",@"সেটিংস",@"সাপোর্ট",nil]




#define USER_MENU_IMAGES [NSArray arrayWithObjects:@"home_icon",@"profile",@"hostory",@"favorites",@"wallet_drawer.png",@"settings",@"support",@"logout",nil]
#define USER_MENU_IMAGES_ON_MAP [NSArray arrayWithObjects:@"home_icon",@"hostory",@"favorites",@"wallet_drawer.png",@"promotions.png",@"settings",@"support",nil]
#define USER_HISTORY [NSArray arrayWithObjects:@"Farmgate to Banani",@"Gulshan to Farmgate",@"Farmgate to Uttara",@"Uttara to Motijheel",@"Farmgate to Banani",@"Farmgate to Banani",nil]

#define USER_HISTORY_DATE [NSArray arrayWithObjects:@"Mar 01,2016 10:50 PM",@"Mar 03,2016 11:50 PM",@"Mar 05,2016 10:50 AM",@"Mar 06,2016 10:50 AM",@"Mar 01,2016 10:50 AM",@"Mar 06,2016 10:00 AM",nil]

#define LOCATIONS [NSArray arrayWithObjects:@"Banani",@"Dhanmondi",@"Gulistan",@"Gulshan-1",@"Gulshan-2",@"Islampur",@"Kaptan Bazar",@"kataban",@"Middle Badda",@"Mirpur",@"Mirpur-10",@"Mohakhali",@"Mohammadpur",@"Motijheel",@"New Market",@"Panthapath",@"Purana Paltan",@"Rampura",@"Uttara",nil]

#define COURIER_TYPES [NSArray arrayWithObjects:@"Documents",@"Books",@"Folders",@"Official Papers",@"Money",@"Others",nil]


#define MarchantAccountHolder @"EMPIREEXPRESSLIMITED"
#define MarchantAccountPassword @"eXp1r3@247"
#define MSISDN @"01847005968"
#define MAIN_THEME_COLOR UIColorFromRGB(0x00b140)























#endif
