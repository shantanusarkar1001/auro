import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../model/cost_estimate_detail_model.dart';

class LegendNameCard extends StatefulWidget {
  const LegendNameCard({
    super.key,
    required this.costEstimateDetailModel,
  });

  final CostEstimateDetailModel costEstimateDetailModel;

  @override
  _LegendNameCardState createState() => _LegendNameCardState();
}

class _LegendNameCardState extends State<LegendNameCard> {
  bool _isDetailVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Name
        Card(
          elevation: 10.h,
          color: TColors.primaryDark2,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: TColors.green,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                SizedBox(width: 5.w),
                const TextView(text: "Energy : ", fontSize: 20),
                TextView(
                  text: (widget.costEstimateDetailModel.totalEnergyCost
                              ?.value ??
                          0.0)
                      .toStringAsFixed(2),
                  // Referencing widget.titleValue
                  fontSize: 20,
                  textColor: TColors.green,
                ),
                const TextView(text: " Rs", fontSize: 20),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // Toggle visibility of LegendDetailCard
                    setState(() {
                      _isDetailVisible = !_isDetailVisible;
                    });
                  },
                  icon: const Icon(Iconsax.arrow_right_3, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        /// Details - Only visible if _isDetailVisible is true
        if (_isDetailVisible)
          Card(
            color: TColors.primaryDark2,
            elevation: 5.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Column(
                children: [
                  /// On Peak
                  Row(
                    children: [
                      const TextView(text: "On Peak Unit"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  Row(
                    children: [
                      TextView(
                        text: (widget.costEstimateDetailModel.onPeak
                                    ?.value ??
                                0.0)
                            .toStringAsFixed(2),
                        // Referencing widget.onPeakValue
                        textColor: TColors.green,
                      ),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(
                        text: (widget.costEstimateDetailModel.onPeakRate
                                    ?.value ??
                                0.0)
                            .toStringAsFixed(2),
                        // Referencing widget.onPeakRate
                        textColor: TColors.green,
                      ),
                      Spacer(),
                      TextView(
                          text: ((widget.costEstimateDetailModel.onPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.onPeakRate?.value ?? 0.0)).toStringAsFixed(2),
                          textColor: TColors.green),
                    ],
                  ),

                  /// Off Peak
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(text: "Off Peak Unit"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  Row(
                    children: [
                      TextView(
                        text: (widget.costEstimateDetailModel.offPeak
                                    ?.value ??
                                0.0)
                            .toStringAsFixed(2),
                        // Referencing widget.offPeakValue
                        textColor: TColors.green,
                      ),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(
                        text: (widget.costEstimateDetailModel.offPeakRate?.value ?? 0.0).toStringAsFixed(2),
                        // Referencing widget.offPeakRate
                        textColor: TColors.green,
                      ),
                      Spacer(),
                      TextView(
                          text: ((widget.costEstimateDetailModel.offPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.offPeakRate?.value ?? 0.0)).toStringAsFixed(2), textColor: TColors.green),
                    ],
                  ),

                  /// Normal
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(text: "Normal Units"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  Row(
                    children: [
                      TextView(
                        text: (widget.costEstimateDetailModel.normEnergy?.value ?? 0.0).toStringAsFixed(2),
                        // Referencing widget.offPeakValue
                        textColor: TColors.green,
                      ),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(
                        text: (widget.costEstimateDetailModel.normEnergyRate?.value ?? 0.0).toStringAsFixed(2),
                        // Referencing widget.offPeakRate
                        textColor: TColors.green,
                      ),
                      Spacer(),
                      TextView(
                          text: ((widget.costEstimateDetailModel.normEnergy?.value ?? 0.0)*(widget.costEstimateDetailModel.normEnergyRate?.value ?? 0.0)).toStringAsFixed(2), textColor: TColors.green),
                    ],
                  ),

                  /// Grand Total
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(
                        text: "Total :",
                        fontSize: 20,
                        bold: true,
                      ),
                      Spacer(),
                      TextView(
                        text:(((widget.costEstimateDetailModel.onPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.onPeakRate?.value ?? 0.0))+
                            ((widget.costEstimateDetailModel.offPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.offPeakRate?.value ?? 0.0))+
                            ((widget.costEstimateDetailModel.normEnergy?.value ?? 0.0)*(widget.costEstimateDetailModel.normEnergyRate?.value ?? 0.0))).toStringAsFixed(2),
                        fontSize: 20,
                        bold: true,
                        textColor: TColors.green,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
