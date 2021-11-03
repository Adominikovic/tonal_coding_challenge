/*
While the specification for our metrics widget states that our unit is always
pounds, this may not be the case for markets where body weight is measured in
different units. We can use an enumerated type to give our metrics widget the
ability to dynamically display the correct unit based on the region's, or
user's preferred body weight measurement unit without having to hard code it in
every time we need to re-use this widget.
 */

enum Unit { lbs, kg, st }
