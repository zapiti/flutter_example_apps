
import 'package:flutter/cupertino.dart';


enum ThemeSize{BIG,MEDIUM,SMALL}

class AppTheme {
  ThemeSize getTypeSize(BuildContext context) {
    if (MediaQuery.of(context).size.width >= 1300){
      return ThemeSize.BIG;
    } else if (MediaQuery.of(context).size.width >= 700){
      return ThemeSize.MEDIUM;
    } else {
      return ThemeSize.SMALL;
    }
  }
  double getWidthSize(BuildContext context) {
    switch (this.getTypeSize(context)){
      case ThemeSize.BIG :

        break;
      case ThemeSize.MEDIUM:
        // TODO: Handle this case.
        break;
      case ThemeSize.SMALL:
        // TODO: Handle this case.
        break;
    }
  }






}
final appTheme = AppTheme();