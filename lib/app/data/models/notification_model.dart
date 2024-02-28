class NotificationModel {
  int? id;
  int? userId;
  String? image;
  String? title;
  String? description;
  String? readStatus;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  NotificationModel(
      {this.id,
      this.userId,
      this.image,
      this.title,
      this.description,
      this.readStatus,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['read_status'] = readStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}