import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  final bool isDark;

  const ThemeState({required this.isDark});

  factory ThemeState.init() => const ThemeState(isDark: false);

  ThemeState copyWithMethod({bool? isDark}) =>
      ThemeState(isDark: isDark ?? this.isDark);

  @override
  List<Object?> get props => [isDark];
}
