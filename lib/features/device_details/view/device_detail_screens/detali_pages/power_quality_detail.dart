import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/current_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/frequency_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/totla_power_factor_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/voltage_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/loaders/image_loader.dart';
import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../controller/device_detail_controller.dart';
import '../widgets/device_detail_shimmer.dart';

class PowerQualityDetail extends StatefulWidget {
  const PowerQualityDetail({super.key});

  @override
  State<PowerQualityDetail> createState() => _PowerQualityDetailState();
}

class _PowerQualityDetailState extends State<PowerQualityDetail> {
  final DeviceDetailController controller = Get.put(DeviceDetailController());
  String _selectedDateRange = TTexts.chooseDateRange;

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    DateTime utcNow = now.toUtc();

    // Set the time to 00:00:00 (midnight) for the same date
    DateTime utcMidnight = DateTime.utc(utcNow.year, utcNow.month, utcNow.day);

    // Format the date to the desired format
    String formattedDateMidNight =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(utcMidnight);

    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(utcNow);
    // Call the API with the current date

    controller.getPfDetails(formattedDateMidNight,
        controller.deviceListModel.mMachineUniqueId, formattedDate);

    controller.getFrequencyDetails(formattedDateMidNight,
        controller.deviceListModel.mMachineUniqueId, formattedDate);

    controller.getVoltageDetails(formattedDateMidNight,
        controller.deviceListModel.mMachineUniqueId, formattedDate);

    controller.getCurrentDetails(formattedDateMidNight,
        controller.deviceListModel.mMachineUniqueId, formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeviceCardDetailsAppBar(title: TTexts.powerQuality),
      backgroundColor: TColors.primary,
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Date Range Section
              GestureDetector(
                onTap: () async {
                  // Open the DateRangePickerDialog
                  DateTimeRange? pickedDateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDateRange: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now(),
                    ),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: TColors.primaryDark2,
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: TColors.primaryDark1,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDateRange != null) {
                    // Formatting the date to 1-08-2024 format
                    String formattedStartDate = DateFormat('d-MM-yyyy').format(pickedDateRange.start);

                    String StartDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pickedDateRange.start);

                    String formattedEndDate = DateFormat('d-MM-yyyy').format(pickedDateRange.end);

                    String EndDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(pickedDateRange.end);

                    setState(() {
                      _selectedDateRange =
                          "From $formattedStartDate To $formattedEndDate";
                    });

                    controller.getPfDetails(StartDate,controller.deviceListModel.mMachineUniqueId, EndDate);

                    controller.getVoltageDetails(StartDate,controller.deviceListModel.mMachineUniqueId, EndDate);

                    controller.getCurrentDetails(StartDate,controller.deviceListModel.mMachineUniqueId, EndDate);

                    controller.getFrequencyDetails(StartDate, controller.deviceListModel.mMachineUniqueId, EndDate);


                  }
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColors.primaryDark1,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.calendar_2,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            TextView(text: _selectedDateRange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              /// Total Power Factors
              Obx(() {
                if (controller.isVoltageDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }

              /*   if (controller.voltageDetailsModel.value.volt?.value.isNullOrBlank == true) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/

                return TotalPowerFactorCard(pfDetailModel: controller.pfDetailModel.value);
              }),

              SizedBox(height: 20.h),

              /// Voltage
              Obx((){
                if (controller.isPfDetailsLoading.value) {
                  return const DeviceDetailShimmer();
                }

                /* if (controller.energyConsumptionData.value.normalUnit.isNull) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/

                return  VoltageCard(voltageDetailModel: controller.voltageDetailsModel.value);
              }),


              SizedBox(height: 20.h),

              ///Curent
              Obx((){
                if (controller.isCurrentDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }

                /* if (controller.energyConsumptionData.value.normalUnit.isNull) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/

                return CurrentCard(currentDetailModel: controller.currentDetailsModel.value,);
              }),

              SizedBox(height: 20.h),

              ///Frequency
              Obx((){     if (controller.isFrequencyDetailLoading.value) {
                return const DeviceDetailShimmer();
              }

              /* if (controller.energyConsumptionData.value.normalUnit.isNull) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/

              return FrequencyCard(frequencyDetailsModel: controller.frequencyDetailsModel.value,);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
