import 'package:course_hotelio/config/app_assets.dart';
import 'package:course_hotelio/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 24),
        const header(),
        const SizedBox(height: 24),
        Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search by name or city',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
              Material(
                color: AppColor.secondary,
                borderRadius: BorderRadius.circular(45),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: ImageIcon(
                    AssetImage(AppAssets.iconSearch),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              AppAssets.profile,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Near me',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const Text(
                '100 Hotels',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
