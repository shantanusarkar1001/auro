import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';


class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text, this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String?animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (animation != null)
            Lottie.asset(
              animation!,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
           SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
           SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: onActionPressed,
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}