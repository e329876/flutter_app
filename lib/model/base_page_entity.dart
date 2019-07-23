class BasePageEntity<T> {
  int errorCode;
  String errorMsg;
  List<PageEntity<T>> data;

  BasePageEntity({this.errorCode, this.errorMsg, this.data});
}

class PageEntity<T> extends Object {
  int curPage;

  List<T> datas;

  int offset;

  bool over;

  int pageCount;

  int size;

  int total;

  PageEntity(
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  );
}
