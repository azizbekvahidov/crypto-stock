abstract class ApiConstants {
  static const int DEFAULT_PAGE_SIZE = 10;

  // static const String baseUrl = "https://api.izi-study.com";
  static const String authApi = "https://auth.mostbyte.uz/api/v1/";
  static const String warehouseApi = "https://warehouse.mostbyte.uz/api/v1/";
  static const String orderApi = "https://order.mostbyte.uz/api/v1/";
  static const String crmApi = "https://crm.mostbyte.uz/api/v1/";
  // static const String paymentCompletedUrl =
  //     "https://izi-study.com/?complete=true";
  // static const String introVideoLink = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4";
  // static const String introVideoLink = "https://izi-study.com/izi_promo.mp4";

  static const String androidPlayStoreLink =
      "https://play.google.com/store/apps/details?id=uz.owl.rus_tili.rus_tili";
  static const String appStoreLink =
      "https://apps.apple.com/us/app/izi-rus-tili/id1625591100";

  //auth
  static const String login = "auth/login";

  //user
  static const String users = "user";
  static const String userStore = "user";
  static const String userShow = "user/{uuid}";
  static const String userUpdate = "user/{uuid}";
  static const String userDelete = "user/{uuid}";

  static const String invoiceStore = "invoices";
  static const String invoiceList = "invoices/{id}";
  static const String invoice = "invoices";
  static const String storage = "storages";
  static const String filialStorage = "filials/storages";
  static const String storageDefaultAmount = "storages/default-amount";
// product endpoints
  static const String products = "products";
// department endpoints
  static const String measurements = "measurements";
  static const String measurementStore = "measurements";
  static const String measurementShow = "measurements/{id}";
  static const String measurementUpdate = "measurements/{id}";
  static const String measurementDelete = "measurements/{id}";
// department endpoints
  static const String departments = "departments";
  static const String departmentStore = "departments";
  static const String departmentShow = "departments/{id}";
  static const String departmentUpdate = "departments/{id}";
  static const String departmentDelete = "departments/{id}";
// provider endpoints
  static const String providers = "providers";
  static const String providerStore = "providers";
  static const String providerShow = "providers/{id}";
  static const String providerUpdate = "providers/{id}";
  static const String providerDelete = "providers/{id}";
// filial endpoints
  static const String filials = "branch";
  static const String filialStore = "branch";
  static const String filialShow = "branch/{id}";
  static const String filialUpdate = "branch/{id}";
  static const String filialDelete = "branch/{id}";

  // order save
  static const String orderStore = "orders";

  // fast access buttons
  static const String fastAccess = "fast-access";
}
