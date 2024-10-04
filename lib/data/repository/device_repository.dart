import 'package:auro/data/http/http_client.dart';
import 'package:auro/data/http/http_client2.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:auro/utils/constant/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../features/device_details/view/device_detail_screens/model/dart_items.dart';
import '../../features/device_details/view/device_detail_screens/model/graph_data_model_api.dart';
import 'package:http/http.dart' as http;


class DeviceRepository extends GetxController {
  static DeviceRepository get instance => Get.find();

  ///Device List
  Future<List<DeviceListModel>> getDeviceList(String userId) async {
    try {
      Map<String, dynamic> request = {"user_id": userId};

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.machineEND, request);

      if (kDebugMode) {
        print('machine  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DeviceListModel> deviceList = deviceListData
            .map((data) => DeviceListModel.fromJson(data))
            .toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Device Details
  Future<List<DeviceListModel>> getDeviceDetail(String deviceId) async {
    try {
      Map<String, dynamic> request = {'machine_id': deviceId};

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.machineDetailsEND, request);

      if (kDebugMode) {
        print('machine_details  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DeviceListModel> deviceList = deviceListData
            .map((data) => DeviceListModel.fromJson(data))
            .toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Device List
  Future<List<DataItems>> getDataItems() async {
    try {
      Map<String, dynamic> request = {};

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.machineDetailsDataItemsEND, request);

      if (kDebugMode) {
        print('readflux.php  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DataItems> deviceList =
            deviceListData.map((data) => DataItems.fromJson(data)).toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Device Graph data
  Future<List<GraphData>> getGraphData(String field, deviceId, range) async {
    try {
      Map<String, dynamic> request = {
        "field": field,
        "deviceid": deviceId,
        "range": range
      };

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.machineDetailsGraphDataEND, request);

      if (kDebugMode) {
        print('readfieldwisedata.php  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceGraphDa = response['data'];

        List<GraphData> deviceGraphData =
            deviceGraphDa.map((data) => GraphData.fromJson(data)).toList();

        return deviceGraphData;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Energy Consumption
  Future<Map<String, dynamic>> getEnergyConsumption(
      String date, String deviceId) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(APIKeys2.energyConsumption, request,);

      print(response);
      if (kDebugMode) {
        print('energy-consumption  Response: $response');
      }

      if (response['status'] == 'success') {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  ///Energy Detail Consumption
  Future<Map<String, dynamic>> getEnergyDetailConsumption(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(APIKeys2.energyConsumptionDetails, request,);

      print(response);
      if (kDebugMode) {
        print('energy-consumption_details  Response: $response');
      }

      if (response['status'] == 'success') {

        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }


  /// Demand
  Future<Map<String, dynamic>> getDemand(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(APIKeys2.demand, request,);

      print(response);
      if (kDebugMode) {
        print('demand  Response: $response');
      }

      if (response['status'] == 'success') {

        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }



  /// Demand Details
  Future<Map<String, dynamic>> getDemandDetails(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(APIKeys2.demandDetail, request,);

      print(response);
      if (kDebugMode) {
        print('demandDetails  Response: $response');
      }

      if (response['status'] == 'success') {

        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }


  /// Total Power Factors
  Future<Map<String, dynamic>> getTotalPowerFactors(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(APIKeys2.powerQuality, request,);

      print(response);
      if (kDebugMode) {
        print('powerFactors  Response: $response');
      }

      if (response['status'] == 'success') {

        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }


  /// Cost Estimate
  Future<Map<String, dynamic>> getCostEstimate(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(APIKeys2.costEstimate, request,);

      print(response);
      if (kDebugMode) {
        print('coat Estimate  Response: $response');
      }

      if (response['status'] == 'success') {

        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// History Fields
  Future<Map<String, dynamic>> getHistoryFields() async {
    try {
      // Build query parameters
      Map<String, dynamic> queryParams = {
      };

      if (kDebugMode) {
        print("CheckRequest Query Params:");
        print(queryParams);
      }

      // Send the GET request with the query parameters
      final response = await THttpHelper2.get(
        APIKeys2.historyFields,
        queryParams: queryParams,
      );

      if (kDebugMode) {
        print('History Fields Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("Error in status response");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("Error in Try-Catch block");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// History Graph
  Future<Map<String, dynamic>> getHistory(
      String date, String deviceId, String stop, String fieldName, String duration) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "field_name": fieldName,
        "start": date,
        "stop": stop,
        "duration": duration,
      };

      print("CheckRequest");
      print(request);

      final response = await THttpHelper2.redirectPost(APIKeys2.history, request);

      if (response == null) {
        throw Exception("No response from server");
      }

      print(response);

      if (response is! Map<String, dynamic>) {
        // The server may have returned an HTML error page
        print("Response is not a JSON object. Possible server error.");
        throw Exception("Invalid response format");
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("Error on status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("Error in Try-Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }



}
