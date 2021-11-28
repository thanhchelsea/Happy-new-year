import 'dart:ui';
import 'data/model/model.dart';

class Constants {
  // locale
  static const String VI = "vi";
  static const String EN = "en";
  static const SUPPORT_LOCALE = [Locale(VI), Locale(EN)];

  static const List<GroupModel> wishGroups = [
    GroupModel("wish", 0),
    GroupModel("poem", 1),
    GroupModel( "english", 2),
    GroupModel("doc", 3),
    GroupModel("family", 4),
    GroupModel("friend", 5),
    GroupModel('co_worker', 6),
    GroupModel('lover', 7),
  ];

  static const List<GroupModel> camNangGroups = [
    GroupModel("tradition", 0),
    GroupModel("good_thing", 1),
    GroupModel( "taboo", 2),
    GroupModel("delicious_food", 3),
    GroupModel("tips", 4),
  ];

  static const List<GroupModel> vanKhanGroups = [
    GroupModel("rule", 0),
    GroupModel("van_khan_tet", 1),
    GroupModel( "van_khan_tiet_trong_nam", 2),
    GroupModel("van_khan_m1_va_ram", 3),
    GroupModel("van_khan_le_tuc_vong_doi", 4),
    GroupModel("van_khan_dang_sao_giai_han", 5),
    GroupModel("van_khan_tang_le", 6),
    GroupModel("van_khan_cung_gio", 7),
    GroupModel("van_khan_than_linh_tại_gia", 8),
    GroupModel("van_khan_tai_chua", 9),
    GroupModel("van_khan_tai_dinh_den_mieu_phu", 10),

  ];
}

class SPrefCache {
  static const String PREF_KEY_LANGUAGE = "pref_key_language";
  static const String TYPE_MAP = "type_map";
  static const String LIST_PHONE = "list_phone_setting1134";
  static const String MESSAGE_SOS = "message_sos";
}
