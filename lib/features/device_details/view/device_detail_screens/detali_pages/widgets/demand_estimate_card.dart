import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../widgets/custom_bars.dart';


class DemandEstimateCard extends StatelessWidget {
  const DemandEstimateCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextView(text: TTexts.demandEstimate),
            SizedBox(
              height: 15.h,
            ),
            const TextView(
              text: TTexts.three20,
              fontSize: 30,
              bold: true,
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomBar(),
            SizedBox(
              height: 10.h,
            ),
            const TextView(text: TTexts.averageKva),
            SizedBox(
              height: 10.h,
            ),
            const TextView(text: TTexts.highestKva),
            SizedBox(
              height: 10.h,
            ),
            const TextView(text: TTexts.loadFactor),
          ],
        ),
      ),
    );
  }
}