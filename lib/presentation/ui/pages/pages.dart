import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_select/smart_select.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/panen/get_list_panen_cubit.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/profile/create_profile_cubit.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/cubit.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/pupuk/get_detail_pupuk_cubit.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/pupuk/get_list_pupuk_cubit.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/profile/get_profile_cubit.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/profile/upload_photo_profile_cubit.dart';
import 'package:tanipedia_mobile_app/presentation/cubit/user/register_cubit.dart';
import 'package:tanipedia_mobile_app/data/local_storage/sharedpreference/key_shared_preference.dart';
import 'package:tanipedia_mobile_app/data/model/dropdown_data/data.dart';
import 'package:tanipedia_mobile_app/data/model/models.dart';
import 'package:tanipedia_mobile_app/core/network/api_url.dart';
import 'package:tanipedia_mobile_app/core/routes/app_routes.dart';
import 'package:tanipedia_mobile_app/core/shared/shared.dart';
import 'package:supercharged/supercharged.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tanipedia_mobile_app/data/data_source/remote/remote_services_impl.dart';
import 'package:tanipedia_mobile_app/presentation/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../../../injection_container.dart';

// Initial
part 'main_page.dart';
part 'test2.dart';

// General
part 'dashboard_page.dart';
part 'coming_soon_page.dart';

// Auth
part 'auth/login_page.dart';
part 'auth/auth_page.dart';
part 'auth/splash_page.dart';

// Register
part 'auth/register_page.dart';
part 'create_profile/create_profile_page1.dart';
part 'create_profile/create_profile_page2.dart';
part 'create_profile/create_profile_page3.dart';

// Profile
part 'profile/profile_page.dart';
part 'profile/biodata_page.dart';
part 'profile/address_page.dart';
part 'profile/help_page.dart';
part 'profile/interest_page.dart';
part 'profile/profile_pertanian.dart';

// Pupuk
part 'pupuk/list_pupuk_page.dart';
part 'pupuk/detail_pupuk_page.dart';

// Lahan
part 'lahan/list_lahan_page.dart';
part 'lahan/detail_lahan_page.dart';
part 'lahan/create_lahan_page.dart';

// Panen
part 'panen/create_panen_page.dart';
part 'panen/list_panen_page.dart';
part 'panen/detail_panen_page.dart';
