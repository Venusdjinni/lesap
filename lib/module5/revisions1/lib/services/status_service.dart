import 'package:dio/dio.dart';
import 'package:revisions1/models/status.dart';

class StatusService {
  late final Dio dio;

  StatusService() {
    dio = Dio(BaseOptions(
      baseUrl: "https://lesap-status.arnoldwabo.cm/",
    ));
  }

  Future<List<Status>> getAllStatuses([int? page]) async {
    final response = await dio.get(
      "/statuses",
      queryParameters: {
        'page': page
      },
    );

    final list = response.data["content"] as Iterable;

    final List<Status> statusList = [];
    for (final element in list) {
      final status = Status(
        content: element["content"],
        creationDate: DateTime.fromMillisecondsSinceEpoch(element["creation_date"]),
        viewsCount: element["views_count"]
      );
      statusList.add(status);
    }

    return statusList;
  }

  Future<Status> createStatus(String content) async {
    final response = await dio.post(
      "/status",
      data: {
        "content": content
      }
    );

    final data = response.data["status"];
    return Status(
      content: data["content"],
      creationDate: DateTime.fromMillisecondsSinceEpoch(data["creation_date"]),
      viewsCount: data["views_count"]
    );
  }
}