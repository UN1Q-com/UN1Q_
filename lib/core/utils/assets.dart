const _baseSvgPath = 'assets/svgs/';
const _basePngPath = 'assets/pngs/';

// bodyType Png
final kLowMuscleImage = 'low_muscle'.bodyTypePng;
final kMediumMuscleImage = 'medium_muscle'.bodyTypePng;
final kHighMuscleImage = 'high_muscle'.bodyTypePng;

// dashboard Png
final kProfileBackgroundImage = 'profile_background'.dashboardPng;

// dashboard Svg
final kChangePasswordIcon = 'change_password'.dashboardSvg;
final kCheckMarkImage = 'checkmark'.dashboardSvg;
final kDashboardIcon = 'dashboard'.dashboardSvg;
final kLogOutIcon = 'log_out'.dashboardSvg;
final kMenuIcon = 'menu'.dashboardSvg;
final kNextIcon = 'next'.dashboardSvg;
final kPersonalDetailsIcon = 'personal_details'.dashboardSvg;

// app logos
final kBlackLogo = 'black'.logoSvg;
final kLongLogo = 'long_logo'.logoSvg;
final kLogoSvg = 'logo'.logoSvg;

// muscleGroupPng
String muscleGroupPng(String gender, String name) =>
    '$gender/$name'.muscleGroupPng;

// others Png
final kWatchImage = 'watch'.othersPng;

// others Svg
final kCheckmarkIcon = 'checkmark_icon'.othersSvg;
final kEmailIcon = 'email_icon'.othersSvg;
final kEmailSuccessIcon = 'email_sent_icon'.othersSvg;
final kLoginErrorIcon = 'login_error_icon'.othersSvg;
final kVerifyIcon = 'verify_icon'.othersSvg;

extension ImageExtension on String {
  String get png => '$_basePngPath$this.png';
  String get svg => '$_baseSvgPath$this.svg';

  String get bodyTypePng => '${_basePngPath}body_type/$this.png';
  String get dashboardPng => '${_basePngPath}dashboard/$this.png';
  String get dashboardSvg => '${_baseSvgPath}dashboard/$this.svg';
  String get logoSvg => '${_baseSvgPath}logo/$this.svg';
  String get muscleGroupPng => '${_basePngPath}muscle_group/$this.png';
  String get profilePng => '${_basePngPath}profile/$this.png';
  String get profileSvg => '${_basePngPath}profile/$this.svg';
  String get othersPng => '${_basePngPath}others/$this.png';
  String get othersSvg => '${_baseSvgPath}others/$this.svg';
}
