Map<String, dynamic> environment = {
  "serverConfig": {
    'domain': 'https://multikartflutterapp.myshopify.com/',
    'accessToken': '453d81454919228cd9e30cdb7d377179',
    'adminAccessToken': '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',
  },
  "firebaseDynamicLinkConfig": {
    "isEnabled": true,
    "shortDynamicLinkEnable": true,
    // Domain is the domain name for your product.
    // Let’s assume here that your product domain is “example.com”.
    // Then you have to mention the domain name as : https://example.page.link.
    "uriPrefix": "https://multikartshopify.page.link",
    //The link your app will open
    "link": "https://multikartflutterapp.myshopify.com/",
    //----------* Android Setting *----------//
    "androidPackageName": "com.webiots.multikartshopify",
    "androidAppMinimumVersion": 1,
  },
};
