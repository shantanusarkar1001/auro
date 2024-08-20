import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import 'bar_graph.dart';

class MultipleBarGraphCard extends StatelessWidget {
  const MultipleBarGraphCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.primaryDark1,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// On-Peak Bar Graph
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text: TTexts.onPeak),
              TextView(text: TTexts.timeRange),
            ],
          ),
          const BarGraph(),
          SizedBox(height: 10.h),

          /// Off-Peak Bar Graph
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text: TTexts.offPeak),
              TextView(text: TTexts.timeRange),
            ],
          ),
          const BarGraph(),
          SizedBox(height: 10.h),

          /// Normal Bar Graph
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text: TTexts.normal),
              TextView(text: TTexts.timeRange),
            ],
          ),
          const BarGraph(),
        ],
      ),
    );
  }
}