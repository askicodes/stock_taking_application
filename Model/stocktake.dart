class Stocktake{
  int id;
  String stocktake_id;
  String store_name;
  String location;
  String store_id;
  String created_by;
  String status;
  String deleted;
  DateTime date_created;
  DateTime date_closed;
  String note;
  Stocktake({this.id,
    this.stocktake_id,
    this.store_name,
    this.location,
    this.store_id,
    this.created_by,
    this.status,
    this.deleted,
    this.date_created,
    this.date_closed,
    this.note});
  factory Stocktake.fromJson(Map<String, dynamic> json){
    return Stocktake(
      id: json['id'] as int,
      stocktake_id: json['stocktake_id'] as String,
      store_name: json['store_name'] as String,
      location: json['location'] as String,
      store_id: json['store_id'] as String,
      created_by: json['created_by'] as String,
      status: json['status'] as String,
      deleted: json['deleted'] as String,
      date_created: json['date_created'] as DateTime,
      date_closed: json['date_closed'] as DateTime,
      note: json['note'] as String,
    );
  }
}