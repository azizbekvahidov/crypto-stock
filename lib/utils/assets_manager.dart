/*
 * Created by Makhmudov Bekhruz
 */

abstract class Assets {
  static String icon(String iconName, {String? format}) =>
      "assets/img/icons/$iconName" + (format ?? ".svg");

  static String image(String imageName, {String? format}) =>
      "assets/img/$imageName" + (format ?? ".svg");

  static String banner(String imageName, {String? format}) =>
      image("assets/banners/$imageName", format: format);

  static String animation(String name) => "assets/animation/$name.json";

  // static String network(int id) => ApiConstants.baseUrl + "/file/$id";
}
