// 请求基本路径
const baseRequestUrl = 'http://v.jspang.com:8088/baixing/';
// 各个接口的请求url
const requestUrl = {
  'homeBase': baseRequestUrl + 'wxmini/homePageContent',
  'homeHot': baseRequestUrl + 'wxmini/homePageBelowConten',
  'category': baseRequestUrl + 'wxmini/getCategory',
  'categoryList': baseRequestUrl + 'wxmini/getMallGoods',
  'goodsDetail': baseRequestUrl + 'wxmini/getGoodDetailById',
};
