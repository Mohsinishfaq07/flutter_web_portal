

import 'package:flutter/cupertino.dart';

import 'app_class.dart';

class Responsive extends StatefulWidget {

var mobileView, webView, tabView;




Responsive({Key? key, this.mobileView, this.tabView, this.webView}) : super(key: key);
@override
State<Responsive> createState() => _ResponsiveState();
}
class _ResponsiveState extends State<Responsive> {
@override
Widget build(BuildContext context) {
CustomScreenType scrType = AppClass().getScreenType(context);
switch (scrType) {
case CustomScreenType.mobile:
return widget.mobileView;
case CustomScreenType.tab:
return widget.tabView;
case CustomScreenType.web:
return widget.webView;
}
}
}




