import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utilities/helper_function.dart';
import '../../../../Utilities/portifilo_icons.dart';
import 'contact/contact_button.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, p) => c.data?.profile != p.data?.profile,
        builder: (context, s) {
          return Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactButton(
                onTap: () async {
                  final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: s.data?.profile?.email ?? "");
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  }
                },
                icon: Portfolio.email,
              ),
              ContactButton(
                onTap: () {
                  HelperFunctions.openUrl(
                      s.data?.profile?.linkedin ?? "", context);
                },
                icon: Portfolio.linkedin,
              ),
              ContactButton(
                onTap: () {
                  HelperFunctions.openUrl(
                      s.data?.profile?.github ?? "", context);
                },
                icon: Portfolio.github,
              ),
              ContactButton(
                onTap: () {
                  HelperFunctions.openWhatsApp(
                      phoneNumber: s.data?.profile?.phone ?? "",
                      message: 'Hello');
                },
                icon: Portfolio.whatsapp,
              ),
              ContactButton(
                onTap: () {
                  HelperFunctions.openUrl(
                      s.data?.profile?.cv ?? "", context);
                },
                icon: Portfolio.cv,
              ),
            ],
          );
        });
  }
}

