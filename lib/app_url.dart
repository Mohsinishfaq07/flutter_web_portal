class AppUrl {
  static const baseUrl = 'http://192.168.11.215:3000/';
  //   static const baseUrl = 'http://20.212.227.60:3041/';
  static const login = 'api/admin/login';
  static const createAsset = "asset/create_asset";
  static const allAsset = "asset/allAssets";
  static const allAssetCount = "asset/all_asset_count";
  static const firstFloorAsset = 'asset/location/Ais-F1';
  static const firstFloorAssetCount = 'asset/location/total-assets/Ais-F1';
  static const secondFloorAsset = 'asset/location/Ais-F2';
  static const secondFloorAssetCount = 'asset/location/total-assets/Ais-F2';
  static const assignedEmployees = 'asset/assigned-employee';
  static const assignedUserCount = 'asset/assigned-user-count';
  static const unAssignedUserCount = 'asset/unassigned-user-count';
  static const unAssignedAssetCount = 'asset/unassigned_asset_count';
  static const unAssignedEmployees = 'asset/unassigned-employees';
  static const assignAsset = 'asset/assign_asset';
  static const unAssignedAsset = 'asset/un_assign_asset';
  static const unAssignAsset = 'asset/empassetdelete';
  static const deleteAsset = 'asset/delete_asset';
  static const history = 'history';
  static const scrap = 'asset/scrap_assets';
  static const assignScrap = 'asset/mark_scrap/52';
  //static const getUser = 'http://192.168.202.111:3000/user/search/$query';
}
