import 'package:flutter/foundation.dart' show kIsWeb;

import 'splash_interop_web.dart' if (dart.library.io) 'splash_interop_stub.dart'
    as impl;

/// Hides the HTML splash screen (web only, no-op elsewhere).
void hideSplashScreen() {
  if (kIsWeb) {
    impl.hideSplash();
  }
}
