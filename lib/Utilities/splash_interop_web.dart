import 'dart:js_interop';

@JS('hideSplash')
external void _hideSplash();

void hideSplash() => _hideSplash();
