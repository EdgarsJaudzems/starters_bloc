import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starters_bloc/constants/colors.dart';
import 'package:starters_bloc/constants/sizes.dart';
import 'package:starters_bloc/models/food.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({
    super.key,
    required this.foodItem,
  });

  final Food foodItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kSizedBoxLarge),
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: kBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(kPaddingMarginLarge),
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(-1, 10),
                      blurRadius: 10,
                    )
                  ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kBorderRadiusGigantic),
                    child: CachedNetworkImage(
                      imageUrl: foodItem.imageURL!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
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
