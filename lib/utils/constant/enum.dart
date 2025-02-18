enum STATUSCODE {
  // ignore: constant_identifier_names
  Success(200, 'Success'),
  // ignore: constant_identifier_names
  Unauthorized(401, 'Unauthorized'),
  // ignore: constant_identifier_names
  NotFound(404, 'Not Found'),
  // ignore: constant_identifier_names
  MethodNotAllowed(405, 'Method Not Allowed');

  const STATUSCODE(this.value, this.uiName);
  final int value;
  final String uiName;
}

enum PAGES {
  // ignore: constant_identifier_names
  Discover(0, 'Discover (TV and Movies)'),
  // ignore: constant_identifier_names
  Favorites(1, 'Favorites'),
  // ignore: constant_identifier_names
  TopRated(2, 'Top-Rated');

  const PAGES(this.value, this.uiName);
  final int value;
  final String uiName;
}
