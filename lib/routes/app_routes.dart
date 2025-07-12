part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const MAIN = _Paths.MAIN;
  static const BASE_DEMO = _Paths.BASE_DEMO;
  static const BASE_LIST_DEMO = _Paths.BASE_LIST_DEMO;
  static const BASE_NETWORK_DEMO = _Paths.BASE_NETWORK_DEMO;
  static const BASE_REFRESH_DEMO = _Paths.BASE_REFRESH_DEMO;
  static const BASE_TAB_DEMO = _Paths.BASE_TAB_DEMO;
  static const BASE_DIALOG_DEMO = _Paths.BASE_DIALOG_DEMO;
  static const EXAMPLE_DEMO = _Paths.EXAMPLE_DEMO;
  static const LOGIN = _Paths.LOGIN;
  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  _Paths._();

  static const MAIN = '/main';
  static const BASE_DEMO = '/base-demo';
  static const BASE_LIST_DEMO = '/base-list-demo';
  static const BASE_NETWORK_DEMO = '/base-network-demo';
  static const BASE_REFRESH_DEMO = '/base-refresh-demo';
  static const BASE_TAB_DEMO = '/base-tab-demo';
  static const BASE_DIALOG_DEMO = '/base-dialog-demo';
  static const EXAMPLE_DEMO = '/example-demo';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';
}
