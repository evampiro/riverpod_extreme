import 'package:http/http.dart';

abstract class Repository<T> {
  final baseUrl = "https://api.snmgroup.com.np/";
  final endPoint = "api";

  T fromJson(String json);
  // String toJson(T model);
  List<T> listfromJson(String json);

  Future<List<T>> fetch({Client? client}) async {
    client ??= Client();

    final response = await client.get(Uri.parse("$baseUrl$endPoint"));

    return listfromJson(_handleStatusCode(response).body);
  }

  Future<List<T>> search({Client? client, required String query}) async {
    client ??= Client();

    final response =
        await client.get(Uri.parse("$baseUrl$endPoint/search?query=$query"));

    return listfromJson(_handleStatusCode(response).body);
  }

  Future<T> fetchOne({Client? client, required String id}) async {
    client ??= Client();

    final response = await client.get(Uri.parse("$baseUrl$endPoint/$id"));

    // if (response.statusCode == 200)
    return fromJson(_handleStatusCode(response).body);
  }

  Future<T> updateOne(
      {Client? client, required Map<String, dynamic> data}) async {
    client ??= Client();

    final response =
        await client.put(Uri.parse(baseUrl + endPoint), body: data);

    // if (response.statusCode == 200)
    return fromJson(_handleStatusCode(response).body);
    // return null;
  }

  Future<T> removeOne({Client? client, required String id}) async {
    client ??= Client();

    final response = await client.delete(
      Uri.parse("$baseUrl$endPoint/id"),
    );

    // if (response.statusCode == 200)
    return fromJson(_handleStatusCode(response).body);
  }

  Future<T> add({Client? client, required Map<String, dynamic> data}) async {
    client ??= Client();

    final response =
        await client.post(Uri.parse(baseUrl + endPoint), body: data);

    // if (response.statusCode == 201)
    return fromJson(_handleStatusCode(response).body);
  }

  Response _handleStatusCode(
    Response response, {
    int code = 200,
  }) {
    if (response.statusCode == code) return response;

    throw "${response.statusCode}:${response.reasonPhrase}";
    // switch (response.statusCode) {
    //   case 400:
    //     throw "Bad Request";
    //   case 401:
    //     throw "Access Denied";
    //   case 403:
    //     throw "No Permission";
    //   case 405:
    //     throw "Method not allowed";
    //   case 429:
    //     throw "Too many requests";
    //   case 404:
    //     throw "Cannot find resource";
    //   case 500:
    //     throw "Internal Server Error";
    //   case 503:
    //     throw "Service Unavailable";
    //   default:
    //     throw "Oops! some error occured";
    // }
  }
}
