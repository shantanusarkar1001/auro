import 'package:auro/utils/helpers/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/helpers/number_formaters.dart';
import '../model/cost_estimate_details_demand_distribution_model.dart';

class DemandDistributionCard extends StatelessWidget {
  const DemandDistributionCard({
    super.key,
    required this.demandDistribution, required this.color,
  });

 final DemandDistribution demandDistribution;
 final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: TColors.primaryDark4,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
        child: Column(
          children: [

            Row(
              children: [
                TextView(text: DateHelper().getMonth(demandDistribution.start.toString()),textColor: TColors.primaryLight1,fontSize: 13,),
              ],
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Expanded(child: Center(child: TextView(text: "Demand",bold: true,))),
                  // Expanded(child: Center(child: TextView(text:""))),
                  Expanded(child: Center(child: TextView(text: "Rate",bold: true,))),
                  Expanded(child: Center(child: TextView(text: ""))),
                ],
              ),
            ),


            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [

                  Expanded(child: Center(child: TextView(text: demandDistribution.demand.toString(),textColor: color,))),
                  // Expanded(child: Center(child: TextView(text:""))),
                  Expanded(child: Center(child: TextView(text: demandDistribution.rate.toString(),textColor: color,))),
                  Expanded(child: Center(child: TextView(text: NumberFormater().numberComma(number:demandDistribution.cost!.toDouble(),  ),textColor: color,))),

                 /* GestureDetector(onTap:(){

                   showDialog<void>(
                        context: context,
                        barrierDismissible: true, // Prevents closing the dialog by tapping outside
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: TColors.primaryLight1,
                            title: const TextView(
                              text: "Info...!",
                              textColor: TColors.primary,
                              fontSize: 25,
                              bold: true,
                            ),
                            content:  SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  TextView(
                                    text: "Start :${DateHelper().formatDateTime(demandDistribution.start.toString())}",
                                    textColor: TColors.primary,
                                  ),

                                  TextView(
                                    text: "End :${DateHelper().formatDateTime(demandDistribution.end.toString())}",
                                    textColor: TColors.primary,
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const TextView(
                                  text: TTexts.dialogOk,
                                  textColor: TColors.primary,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Handle OK action
                                },
                              ),
                              *//*TextButton(
                                child: const TextView(
                                  text: TTexts.dialogCancel,
                                  textColor: TColors.accentDark1,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                              ),*//*
                            ],
                          );
                        },
                      );
                  },child: Icon(Iconsax.info_circle,color: TColors.white,))*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}