class BaseListEntity<T> {
  int errorCode;
  String errorMsg;
  List<T> data;

  BaseListEntity({this.errorCode, this.errorMsg, this.data});
}