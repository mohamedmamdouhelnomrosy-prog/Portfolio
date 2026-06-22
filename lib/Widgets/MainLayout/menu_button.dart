// import 'package:flutter/material.dart';
// import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar_item.dart';
// import 'package:portfolio/Widgets/Portfilio/animated_background.dart';
//
// import '../../Utilities/Constants/global_keys.dart';
// import '../../Utilities/Constants/strings.dart';
// import '../../Utilities/extensions.dart';
// import '../../Utilities/portifilo_icons.dart';
//
// class MenuButton extends StatefulWidget {
//   const MenuButton({
//     super.key,
//   });
//
//   @override
//   State<MenuButton> createState() => _MenuButtonState();
// }
//
// class _MenuButtonState extends State<MenuButton>
//     with SingleTickerProviderStateMixin {
//   bool _isOpen = false;
//   late AnimationController _ctrl;
//   late Animation<double> _fadeAnim;
//   late Animation<double> _scaleAnim;
//
//   @override
//   void initState() {
//     super.initState();
//     _ctrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//     _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
//     _scaleAnim = Tween<double>(begin: 0.95, end: 1.0)
//         .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
//
//     _ctrl.addStatusListener((status) {
//       if (status == AnimationStatus.dismissed) {
//         setState(() => _isOpen = false);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }
//
//   void _toggle() {
//     if (_isOpen) {
//       _ctrl.reverse();
//     } else {
//       setState(() => _isOpen = true);
//       _ctrl.forward();
//     }
//   }
//
//   void _select(GlobalKey keyName) {
//     if (keyName.currentContext != null) {
//       Scrollable.ensureVisible(
//         keyName.currentContext!,
//         duration: const Duration(seconds: 1),
//         curve: Curves.easeInOut,
//       );
//     }
//     _ctrl.reverse();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//      spacing: 8,
//       children: [
//         // ── AppBar ──
//         _HamburgerBtn(
//           isOpen: _isOpen,
//           onTap: _toggle,
//         ),
//
//
//         // ── Dropdown overlay ──
//         if (_isOpen)
//           FadeTransition(
//             opacity: _fadeAnim,
//             child: ScaleTransition(
//               scale: _scaleAnim,
//               alignment: Alignment.topCenter,
//               child: AnimatedBackground(
//                 //border: Border.symmetric(horizontal: BorderSide(color: context.colors.border)),
//                 child: Column(
//                   children: [
//                     HomeAppBarItem(
//                       icon: Portfolio.summary,
//                       onTap: () => _select(GlobalKeys.aboutMe),
//                       title: Strings.aboutMe.translate,
//                     ),
//                     HomeAppBarItem(
//                       icon: Portfolio.education,
//                       onTap: () => _select(GlobalKeys.education),
//                       title: Strings.education.translate,
//                     ),
//                     HomeAppBarItem(
//                       icon: Portfolio.skills,
//                       onTap: () => _select(GlobalKeys.skill),
//                       title: Strings.mySkill.translate,
//                     ),
//                     HomeAppBarItem(
//                       icon: Portfolio.work,
//                       onTap: () => _select(GlobalKeys.experince),
//                       title: Strings.experience.translate,
//                     ),
//                     HomeAppBarItem(
//                       icon: Portfolio.projects,
//                       onTap: () => _select(GlobalKeys.projects),
//                       title: Strings.projects.translate,
//                     ),
//                     HomeAppBarItem(
//                       icon: Portfolio.certification,
//                       onTap: () => _select(GlobalKeys.certification),
//                       title: Strings.certification.translate,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//       ],
//     );
//   }
// }
//
// class _HamburgerBtn extends StatelessWidget {
//   final bool isOpen;
//   final Function() onTap;
//
//   const _HamburgerBtn({
//     required this.isOpen,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = context.colors;
//     return InkWell(
//       onTap: onTap,
//       hoverColor: Colors.transparent,
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 220),
//         child: Container(
//           width: 32,
//           height: 32,
//           decoration: BoxDecoration(
//             color: colors.secondary.withValues(alpha: 0.2),
//             borderRadius: const BorderRadius.all(Radius.circular(4))
//           ),
//           child: Icon(
//             isOpen ? Portfolio.close : Portfolio.menu,
//             key: ValueKey<bool>(isOpen),
//             color: colors.secondary,
//             size: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }