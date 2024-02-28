import 'package:rbf_task/app/data/models/notification_model.dart';

class NotificationResponseModel {
	String? status;
	String? message;
	Error? error;
	Data? data;

	NotificationResponseModel({this.status, this.message, this.error, this.data});

	NotificationResponseModel.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		message = json['message'];
		data = json['data'] != null ? Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['status'] = status;
		data['message'] = message;
		if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
		return data;
	}
}


class Data {
	int? totalunread;
	List<NotificationModel>? results;

	Data({this.totalunread, this.results});

	Data.fromJson(Map<String, dynamic> json) {
		totalunread = json['totalunread'];
		if (json['results'] != null) {
			results = <NotificationModel>[];
			json['results'].forEach((v) { results!.add(NotificationModel.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['totalunread'] = totalunread;
		if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

