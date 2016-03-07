//
//  Const.h
//  Tools
//
//  Created by JXH on 15/2/19.
//  Copyright © 2015年 JXH. All rights reserved.
//

#ifndef Const_h
#define Const_h

#pragma mark - 番剧
static NSString *const kFunPlayUrl = @"http://bangumi.bilibili.com/api/app_index_page?_device=android&_hwid=bcbfd479c4762248&_ulv=10000&access_key=22478dfaad95807199e6d9f65dd9e539&appkey=c1b107428d337928&build=412001&platform=android&ts=1457336973000&sign=5978e02359c883ff2a86987f76ded418";
















#pragma mark - 兼职卫士

static NSString *const JBaseUrl = @"http://wap2.yojianzhi.com/";
static NSString *const JLbtUrl = @"http://html2.yojianzhi.com/wap/images/";

// 接口域名前缀
#define BASEURL @"http://wap2.yojianzhi.com/"
// app 接口常量
#define YOURL @"http://wap.yojianzhi.com/app_api.php"
// 请求接口
#define JAPURL @"http://wap.yojianzhi.com/index.php"
// 首页轮播图接口图片基本链接
#define lbtBaseUrl @"http://html2.yojianzhi.com/wap/images/"
// 首页轮播图跳转链接基本 URL
#define lbtEventBaseUrl @"http://wap.yojianzhi.com"
// PC 端活动详情页
#define activityDetailUrl @"http://wap2.yojianzhi.com/index.php?a=activity_info&id=%@"
// 兼职卫士协议
#define LisenceUrl @"http://wap2.yojianzhi.com/index.php?a=protocol"


#pragma mark - 开源中国
//一、综合
//1.资讯
static NSString *kNewsList = @"http://www.oschina.net/action/api/news_list?catalog=1&pageIndex=%ld&pageSize=20";

/*
 1 - 1000
 pageIndex=0   pageSize=20     1->20
 pageIndex=1   pageSize=20     21->40
 pageIndex=2   pageSize=20     41->60
 */

/*
 @"http://www.oschina.net/action/api/news_list?catalog=1&startIndex=%ld&endIndex=%ld"
 
 startIndex=1  endIndex=20   1->20
 startIndex=21  endIndex=40  21->40
 startIndex=41  endIndex=60  41->60
 */

/*
 @"http://www.oschina.net/action/api/news_list?catalog=1&lastIndex=1"
 lastIndex=1    1->20
 lastIndex=20   21->40
 */



//2.热点
static NSString *kNewsHotList = @"http://www.oschina.net/action/api/news_list?show=week";

//3.博客
static NSString *kNewsBlogList = @"http://www.oschina.net/action/api/blog_list?type=latest&pageIndex=%ld&pageSize=20";

//4.推荐
static NSString *kNewsRecommendList = @"http://www.oschina.net/action/api/blog_list?type=recommend&pageIndex=%ld&pageSize=20";


//二、动弹
static NSString *kTweetList = @"http://www.oschina.net/action/api/tweet_list?uid=%ld&pageIndex=%ld&pageSize=20";

//1.最新动弹
//static NSString *kTweetNewsList = @"http://www.oschina.net/action/api/tweet_list?uid=%ld&pageIndex=%ld&pageSize=20";
//uid==0

//2.热门动弹
//static NSString *kTweetHotList = @"http://www.oschina.net/action/api/tweet_list?uid=%ld&pageIndex=%ld&pageSize=20";
//uid==-1


//三、更多

//四、发现

//五、我的

//1.登陆
static NSString *kLoginUrl = @"http://www.oschina.net/action/api/login_validate";
/*
 参数
 //username
 //pwd
 //keep_login == 1
 */

//六、左侧菜单
//1.技术问答
//1)提问
static NSString *kQuestionUrl = @"http://www.oschina.net/action/api/post_list?catalog=1&pageIndex=%ld&pageSize=20";



#endif
