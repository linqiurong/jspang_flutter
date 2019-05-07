import 'package:flutter/material.dart';
import 'package:jspang_flutter_shop/widgets/widgets.dart';
import 'package:jspang_flutter_shop/pages/index_page.dart';
import 'package:jspang_flutter_shop/pages/cate_page.dart';
import 'package:jspang_flutter_shop/pages/cart_page.dart';
import 'package:jspang_flutter_shop/pages/mine_page.dart';

import 'package:provide/provide.dart';
import 'package:jspang_flutter_shop/provide/home_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jspang_flutter_shop/services/home_services.dart';
import 'package:jspang_flutter_shop/provide/home_provide.dart';

/**
 * 首页数据
 */

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // Wideget
  // CommonWidgets _commonWidgets = new CommonWidgets();
  HomeService _services = new HomeService();
  // HomeProvide _homeProvide = new HomeProvide();

  // int _currentTabIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // keepAlive才有效
    // super.build(context);

    // 初始化当前位置(可通过定位获取)
    this._initLocate(context);
    // 适配屏幕
    this._initAutoFit(context);
    // 底部按钮
    List<BottomNavigationBarItem> items = this._bottomNavigator();
    // 底部按钮对应的页面
    List<Widget> pages = [IndexPage(), CatePage(), CartPage(), MinePage()];

    return Provide<HomeProvide>(builder: (BuildContext context, child, val) {
      // 获取当前页面
      int currentIndex = _services.homeProvide(context).getBottonIndex();
      return Scaffold(
        appBar: AppBar(
          title: Text("百姓生活+"),
        ),
        body: IndexedStack(
          children: pages,
          index: currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.pink,
          items: items,
          onTap: (int index) {
            // setState(() {
            //   this._currentTabIndex = index;
            // });
            _services.homeProvide(context).setBottonIndex(index);
          },
          currentIndex: currentIndex,
        ),
      );
    });
  }

  // 初始化当前地理位置
  _initLocate(BuildContext context) {
    Map locate = {'lon': '115.02932', 'lat': '35.76189'};
    _services.homeProvide(context).setLocate(locate);
  }

  // 适配
  _initAutoFit(BuildContext context) {
    // 屏幕自适应
    ScreenUtil.instance = new ScreenUtil(width: 750, height: 1334)
      ..init(context);
  }

  // 底部按钮 item
  BottomNavigationBarItem _bottonNavigatorItem(
      Icon icon, String title, Color color) {
    return BottomNavigationBarItem(
        icon: icon, title: Text(title), backgroundColor: color);
  }

  // 底部按钮
  _bottomNavigator() {
    List<BottomNavigationBarItem> items = [
      this._bottonNavigatorItem(Icon(Icons.home), "首页", Colors.pink),
      this._bottonNavigatorItem(Icon(Icons.category), "分类", Colors.pink),
      this._bottonNavigatorItem(Icon(Icons.shopping_cart), "购物车", Colors.pink),
      this._bottonNavigatorItem(Icon(Icons.person), "我的", Colors.pink)
    ];
    return items;
  }
}

// class HomePage extends StatelessWidget {
//   // Wideget
//   CommonWidgets _commonWidgets = new CommonWidgets();
//   HomeService _services = new HomeService();
//   @override
//   Widget build(BuildContext context) {
//     // 初始化当前位置(可通过定位获取)
//     this._initLocate(context);
//     // 适配屏幕
//     this._initAutoFit(context);
//     // 底部按钮
//     List<BottomNavigationBarItem> items = this._bottomNavigator();
//     // 底部按钮对应的页面
//     List<Widget> pages = [IndexPage(), CatePage(), CartPage(), MinePage()];

//     return Provide<HomeProvide>(builder: (BuildContext context, child, val) {
//       // 获取当前页面
//       int currentIndex = _services.homeProvide(context).getBottonIndex();
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("百姓生活+"),
//         ),
//         body: IndexedStack(
//           children: pages,
//           index: currentIndex,
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           fixedColor: Colors.pink,
//           items: items,
//           onTap: (int index) {
//             _services.homeProvide(context).setBottonIndex(index);
//           },
//           currentIndex: currentIndex,
//         ),
//       );
//     });
//   }

//   // 初始化当前地理位置
//   _initLocate(BuildContext context) {
//     Map locate = {'lon': '115.02932', 'lat': '35.76189'};
//     _services.homeProvide(context).setLocate(locate);
//   }

//   // 适配
//   _initAutoFit(BuildContext context) {
//     // 屏幕自适应
//     ScreenUtil.instance = new ScreenUtil(width: 750, height: 1334)
//       ..init(context);
//   }

//   // 底部按钮 item
//   BottomNavigationBarItem _bottonNavigatorItem(
//       Icon icon, String title, Color color) {
//     return BottomNavigationBarItem(
//         icon: icon, title: Text(title), backgroundColor: color);
//   }

//   // 底部按钮
//   _bottomNavigator() {
//     List<BottomNavigationBarItem> items = [
//       this._bottonNavigatorItem(Icon(Icons.home), "首页", Colors.pink),
//       this._bottonNavigatorItem(Icon(Icons.category), "分类", Colors.pink),
//       this._bottonNavigatorItem(Icon(Icons.shopping_cart), "购物车", Colors.pink),
//       this._bottonNavigatorItem(Icon(Icons.person), "我的", Colors.pink)
//     ];
//     return items;
//   }
// }
