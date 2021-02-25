import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:tanipedia_mobile_app/model/base/response.dart';
import 'package:tanipedia_mobile_app/model/models.dart';
import 'package:tanipedia_mobile_app/network/api_url.dart';
import 'package:tanipedia_mobile_app/network/network.dart';
import 'package:http/http.dart' as http;
import 'package:tanipedia_mobile_app/services/services.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';
import 'package:tanipedia_mobile_app/ui/widgets/widgets.dart';

class FrustatedPage extends StatefulWidget {
  @override
  _FrustatedPageState createState() => _FrustatedPageState();
}

class _FrustatedPageState extends State<FrustatedPage> {
  int userId = getX.Get.arguments[0];
  String name = getX.Get.arguments[1];
  String nik = getX.Get.arguments[2];
  String kk = getX.Get.arguments[3];
  String tglLahir = getX.Get.arguments[4];
  String kodePos = getX.Get.arguments[5];
  String alamat = getX.Get.arguments[6];
  String rt = getX.Get.arguments[7];
  String rw = getX.Get.arguments[8];
  String gender = getX.Get.arguments[9];
  String golDarah = getX.Get.arguments[10];
  String suku = getX.Get.arguments[11];
  String agama = getX.Get.arguments[12];
  String pendidikan = getX.Get.arguments[13];
  String pekerjaan = getX.Get.arguments[14];
  String telp = getX.Get.arguments[15];
  String provinsi = getX.Get.arguments[16];
  String kabupaten = getX.Get.arguments[17];
  String kecamatan = getX.Get.arguments[18];
  String desa = getX.Get.arguments[19];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            onPress: () {
              // ProfileServices.create(
              //     1127,
              //     'Bismillah',
              //     '+628985953469',
              //     '01-01-1990',
              //     '1000101',
              //     '1000403',
              //     '1000203',
              //     '1000504',
              //     '1000304',
              //     '1000606',
              //     '94646',
              //     '64646',
              //     'bsbsb',
              //     '545',
              //     '545',
              //     '6466',
              //     '18',
              //     '71',
              //     '10',
              //     '1002');

              // ProfileServices.create(
              // 1126,
              // 'Julius',
              // '+628985953469',
              // '01-01-1990',
              // gender,
              // golDarah,
              // agama,
              // suku,
              // pendidikan,
              // pekerjaan,
              // nik,
              // kk,
              // alamat,
              // rt,
              // rw,
              // kodePos,
              // provinsi,
              // kabupaten,
              // kecamatan,
              // desa
              // );

              ProfileServices.create(
                  userId,
                  name,
                  telp,
                  tglLahir,
                  gender,
                  golDarah,
                  agama,
                  suku,
                  pendidikan,
                  pekerjaan,
                  nik,
                  kk,
                  alamat,
                  rt,
                  rw,
                  kodePos,
                  provinsi,
                  kabupaten,
                  kecamatan,
                  desa);
            },
            text: 'TES',
            color: mainColor),
      ),
    );
  }
}

class APIService {
  static Future<ApiReturnValue<Profile>> post() async {
    Map<String, dynamic> fieldFormURL = {
      'id_user': '1123',
      'nama': 'nama',
      'telp': '+628985953469',
      'tgl_lahir': '12-31-1999',
      'gender': "1000101",
      'gol_darah': "1000403",
    };

    print('Data Post : $fieldFormURL');
    var body = jsonEncode(fieldFormURL);
    try {
      final apiResponse = await http.post(ApiUrl.baseURL + ApiUrl.profile,
          headers: ApiUrl.headersAuth, body: body);

      final responseBody = ReturnResponse.response(apiResponse);
      final baseResponse = Response.fromJSON(responseBody);
      final responseCreateProfile = Profile.fromJSON(baseResponse.data);

      return ApiReturnValue(value: responseCreateProfile);
    } catch (e) {
      print('Test : ${e.toString()}');
      // return ApiReturnValue(message: "Tidak ada koneksi internet!");
      return ApiReturnValue(message: 'Terjadi Kesalahan..');
    }
  }
}
