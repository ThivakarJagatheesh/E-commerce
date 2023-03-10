// library month_picker_strip;

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_datepicker_single/flutter_datepicker_single.dart';
// import 'package:intl/intl.dart';

// const PageScrollPhysics _kPagePhysics = const PageScrollPhysics();

// const TextStyle _selectedTextStyle = const TextStyle(
//   color: Colors.green,
//   fontSize: 14.0,
//   fontWeight: FontWeight.w600,
// );

// const TextStyle _normalTextStyle = const TextStyle(
//   color: const Color(0x7F000000),
//   fontSize: 14.0,
//   fontWeight: FontWeight.w400,
// );

// class MonthStrip extends StatefulWidget {
//   final String? format;
//   @required final DateTime from;
//   @required final DateTime to;
//   @required final DateTime initialMonth;
//   @required final ValueChanged<DateTime> onMonthChanged;
//   final double ?height;
//   final double ?viewportFraction;
//   final TextStyle? selectedTextStyle;
//   final TextStyle? normalTextStyle;

//   /// Defaults to matching platform conventions.
//   final ScrollPhysics? physics;

//    MonthStrip({
//     this.format = 'MMMM yyyy',
//     required this.from,
//     required this.to,
//     required this.initialMonth,
//     required this.onMonthChanged,
//     this.physics,
//     this.height = 48.0,
//     this.viewportFraction = 0.3,
//     this.normalTextStyle = _normalTextStyle,
//     this.selectedTextStyle = _selectedTextStyle,
//   });

//   @override
//   _MonthStripState createState() {
//     List<_MonthItem> months = [];
//     int initialPage = 0;
//     for (int i = from.year; i <= to.year; i++) {
//       for (int j = 1; j <= 12; j++) {
//         if (i == from.year && j < from.month) {
//           continue;
//         }

//         if (i == to.year && j > to.month) {
//           continue;
//         }

//         var item = new _MonthItem(new DateTime(i, j), selected: false,indexval: months.length);
//         if (initialMonth != null) {
//           if (item.time.year == initialMonth.year &&
//               item.time.month == initialMonth.month) {
//             initialPage = months.length;
//             item.selected = true;
//           }
//         }
//         months.add(item);
//       }
//     }

//     return new _MonthStripState(
//         viewportFraction: viewportFraction!,
//         initialPage: initialPage,
//         dateFormat: new DateFormat(format),
//         months: months);
//   }
// }

// class _MonthStripState extends State<MonthStrip> {
//   final DateFormat ?dateFormat;
//   final List<_MonthItem>? months;
//   final PageController controller;
//   int? _lastReportedPage;

//   _MonthStripState(
//       {double ?viewportFraction, int ?initialPage, required this.dateFormat, required this.months})
//       : controller = new PageController(
//             viewportFraction: viewportFraction!, initialPage: initialPage!),
//         _lastReportedPage = initialPage;

//   @override
//   Widget build(BuildContext context) {
//     final AxisDirection axisDirection = AxisDirection.right;
//     final ScrollPhysics physics = _kPagePhysics.applyTo(widget.physics);
//     return new Container(
//       height: widget.height,
//       child: new NotificationListener<ScrollEndNotification>(
//         onNotification: (ScrollEndNotification notification) {
//           if (notification.depth == 0 &&
//               widget.onMonthChanged != null &&
//               notification is ScrollEndNotification) {
//             final PageMetrics metrics = notification.metrics;
//             final int currentPage = metrics.page!.round();
//             if (currentPage != _lastReportedPage) {
//               _lastReportedPage = currentPage;

//               setState(() {
//                 for (var item in months!) {
//                   item.selected = false;
//                 }
//                 var m = months![currentPage];
//                 var d = m.time;
//                 m.selected = true;
//                 widget.onMonthChanged(new DateTime(d.year, d.month));
//               });
//             }
//           }
//           return false;
//         },
//         child: new Scrollable(
//           axisDirection: axisDirection,
//           controller: controller,
//           physics: physics,
//           viewportBuilder: (BuildContext context, ViewportOffset position) {
//             return new Viewport(
//               axisDirection: axisDirection,
//               offset: position,
//               slivers: <Widget>[
//                 new SliverFillViewport(
//                   viewportFraction: controller.viewportFraction,
//                   delegate: new SliverChildBuilderDelegate(_buildContent,
//                       childCount: months!.length),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildContent(BuildContext context, int index) {
//     final item = months![index];
//     return new Container(
//       child: new Center(
//         child: new GestureDetector(
//           child: new Text(
//             dateFormat!.format(item.time),
//             style: item.selected
//                 ? widget.selectedTextStyle
//                 : widget.normalTextStyle,
//           ),
//           onTap: () async {
//             if (_lastReportedPage != index) {
//               controller.animateToPage(
//                 index,
//                 duration: new Duration(milliseconds: 300),
//                 curve: Curves.ease,
//               );
//             }else{
//               var itemtemp = new _MonthItem(new DateTime(item.time.year, 01), selected: false);
//                var map1 = Map.fromIterable(months!, key: (e) => e.time, value: (e) => e.indexval);
//                DateTime selected = await showYearPicker(
//                           context: context,
//                           initialDate: itemtemp.time,
//                         );

//                         if(selected!=null){
//                             itemtemp = new _MonthItem(new DateTime(selected.year, 01), selected: false);
//                             if(map1[itemtemp.time]!=null){
//                             controller.animateToPage(
//                             map1[itemtemp.time],
//                             duration: new Duration(milliseconds: 300),
//                             curve: Curves.ease,
//                               );
//                             widget.onMonthChanged(new DateTime(selected.year, 01));
//                             }
//                         }
              
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// class _MonthItem {
//   final DateTime time;
//   bool selected;
//   int indexval;

//   _MonthItem(this.time, {this.selected = false,required this.indexval});
// }
