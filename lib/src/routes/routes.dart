import 'package:designs_backgrounds/src/pages/graphs_circular_page.dart';
import 'package:designs_backgrounds/src/pages/pinterest_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:designs_backgrounds/src/challenge/animated_square_page.dart';
import 'package:designs_backgrounds/src/labs/circular_progress_page.dart';
import 'package:designs_backgrounds/src/pages/animate_do_page.dart';
import 'package:designs_backgrounds/src/pages/emergency_page.dart';
import 'package:designs_backgrounds/src/pages/headers_page.dart';
import 'package:designs_backgrounds/src/pages/slideshow_page.dart';
import 'package:designs_backgrounds/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[

  _Route( FontAwesomeIcons.slideshare, 'SlideShow', SlideshowPage()),
  _Route( FontAwesomeIcons.truckMedical, 'Emergency', EmergencyPage()),
  _Route( FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route( FontAwesomeIcons.peopleCarryBox, 'Animated Square', SquareAnimatedPage()),
  _Route( FontAwesomeIcons.circleNotch, 'Progress Bar', GraphCircularPage()),
  _Route( FontAwesomeIcons.pinterest, 'Pinterest Page', PinterestPage()),
  _Route( FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
  _Route( FontAwesomeIcons.star, 'Animate Do', AnimatePage1()),


];


class _Route {

  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);

}