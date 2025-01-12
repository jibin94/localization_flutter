import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../controller/language_change_controller.dart';

enum Language { english, arabic, hindi }

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          AppLocalizations.of(context)!.localization,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return PopupMenuButton(
                iconColor: Colors.white,
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    provider.changeLanguage(const Locale('en'));
                  } else if (Language.arabic.name == item.name) {
                    provider.changeLanguage(const Locale('ar'));
                  } else {
                    provider.changeLanguage(const Locale('hi'));
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: Language.english,
                    child: Center(
                      child: Text('English'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: Language.arabic,
                    child: Center(
                      child: Text('Arabic'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: Language.hindi,
                    child: Center(
                      child: Text('Hindi'),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.hello('Jibin'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),
            // Name TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.nameLabel,
                  hintText: AppLocalizations.of(context)!.nameHint,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Email TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.emailLabel,
                  hintText: AppLocalizations.of(context)!.emailHint,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                context.read<LanguageChangeController>().incrementClickCount();
              },
              child: Text(AppLocalizations.of(context)!.submitButton),
            ),
            const SizedBox(height: 20),
            Consumer<LanguageChangeController>(
              builder: (context, provider, child) {
                return Text(
                  AppLocalizations.of(context)!
                      .clickedTimes(provider.clickCount),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
