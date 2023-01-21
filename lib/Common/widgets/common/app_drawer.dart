
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mzoperator/blocs/main/main_bloc.dart';
// import 'package:mzoperator/blocs/main/main_event.dart';

// import './responsive_container.dart';
// import './responsive_padding.dart';
// import './responsive_image.dart';
// import './circle_image.dart';
// import '../../styles/common_styles.dart';
// import '../../styles/common_variables.dart';

// class AppDrawer extends StatelessWidget {
//   AppDrawer({this.rootContext, this.currentPath, this.memberName});

//   final BuildContext ?rootContext;
//   final currentPath;
//   final memberName;

//   Widget _userInfo(context) {
//      final _mainBloc = BlocProvider.of<MainBloc>(context);
//     return ResponsivePadding(
//         padding: const EdgeInsets.symmetric(horizontal: 32.0),
//         child: InkWell(
//             child: Row(children: <Widget>[
//               CircleImage(
//                   image: new ExactAssetImage("images/21.jpg"),
//                   width: 64.0,
//                   height: 64.0),
//               Expanded(
//                 child: ResponsivePadding(
//                     padding: const EdgeInsets.only(left: 16.0),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           ResponsivePadding(
//                               padding: const EdgeInsets.only(bottom: 6.0),
//                               child: Text(memberName == null ? "" : memberName,
//                                   style: CommonStyles(context: context)
//                                       .getHeaderText())),
//                           // Text(
//                           //   "Designer",
//                           //   style: CommonStyles(context: context).getGraySmallText()
//                           // )
//                         ])),
//               ),
//               ResponsiveImage(
//                   image: new ExactAssetImage("images/icons/ic_arrow_right.png"),
//                   width: 8.0,
//                   height: 12.0)
//             ]),
//             onTap: () {
//               _mainBloc.add(MenuPressed(menuname: "Profile"));
//             }));
//   }

//   Widget _menuItem(context, String itemText, String routeText, String icon,
//       double iconWidth, double iconHeight) {
//     if (routeText == currentPath) {
//       return _activeItem(
//           context, itemText, routeText, icon, iconWidth, iconHeight);
//     } else {
//       return _normalItem(
//           context, itemText, routeText, icon, iconWidth, iconHeight);
//     }
//   }

//   Widget _activeItem(context, String itemText, String routeText, String icon,
//       double iconWidth, double iconHeight) {
//     final _mainBloc = BlocProvider.of<MainBloc>(context);

//     return InkWell(
//         child: ResponsivePadding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
//             child: Row(
//               children: <Widget>[
//                 ResponsiveContainer(
//                     width: 35.0,
//                     child: Row(children: <Widget>[
//                       ResponsiveImage(
//                           image: new ExactAssetImage(icon),
//                           width: iconWidth,
//                           height: iconHeight)
//                     ])),
//                 Text(itemText,
//                     style: CommonStyles(context: context).getBlueNormalText())
//               ],
//             )),
//         onTap: () {
//           _mainBloc.add(MenuPressed(menuname: routeText));
//         });
//   }

//   Widget _normalItem(context, String itemText, String routeText, String icon,
//       double iconWidth, double iconHeight) {
//     final _mainBloc = BlocProvider.of<MainBloc>(context);

//     return InkWell(
//         child: ResponsivePadding(
//           padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
//           child: Row(
//             children: <Widget>[
//               ResponsiveContainer(
//                   width: 35.0,
//                   child: Row(children: <Widget>[
//                     ResponsiveImage(
//                         image: new ExactAssetImage(icon),
//                         width: iconWidth,
//                         height: iconHeight)
//                   ])),
//               Text(itemText,
//                   style: Theme.of(context).textTheme.subtitle2)
//             ],
//           ),
//         ),
//         onTap: () async {
//           _mainBloc.add(MenuPressed(menuname: routeText));
//         });
//   }

//   // Widget _backButton(context) {
//   //   return ResponsivePadding(
//   //       padding: const EdgeInsets.symmetric(horizontal: 32.0),
//   //       child: ResponsiveContainer(
//   //           width: 48.0,
//   //           height: 48.0,
//   //           decoration: const BoxDecoration(
//   //               borderRadius:
//   //                   const BorderRadius.all(const Radius.circular(100.0))),
//   //           child: new FloatingActionButton(
//   //               backgroundColor: CommonColors.blue,
//   //               child: Center(
//   //                   child: Icon(Icons.arrow_back, color: CommonColors.white)),
//   //               onPressed: () {})));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double paddingTop = CommonVariables(context: context).getAppBarHeight();
//     return Drawer(
//         child: ResponsivePadding(
//             padding: EdgeInsets.only(top: paddingTop),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   _userInfo(context),
//                   ResponsivePadding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: Column(children: <Widget>[
//                         _menuItem(context, "Home", "Home",
//                             "images/icons/ic_amount.png", 16.0, 16.0),
//                         _menuItem(context, "Books", "Books",
//                             "images/icons/ic_wallet.png", 16.0, 16.0),
//                         // _menuItem(context, "Accounts", "Accounts",
//                         //     "images/icons/ic_friends.png", 16.0, 16.0),
//                       ])),
                  
//                   ResponsivePadding(
//                       padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Expanded(
//                                 child: Container(
//                                     height: 1.0,
//                                     color: Colors.grey.shade300)),
//                           ])),
//                   ResponsivePadding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: Column(children: <Widget>[
//                         _menuItem(context, "About Us", "AboutUs",
//                             "images/icons/ic_message.png", 16.0, 16.0),
//                         _menuItem(context, "Logout", "Logout",
//                             "images/icons/ic_logout.png", 14.1, 16.0)
//                       ])),
//                   //_backButton(context)
//                 ])));
//   }
// }
