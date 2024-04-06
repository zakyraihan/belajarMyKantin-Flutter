// To parse this JSON data, do
//
//     final popular = popularFromJson(jsonString);

part of 'model.dart';

Popular popularFromJson(String str) => Popular.fromJson(json.decode(str));

String popularToJson(Popular data) => json.encode(data.toJson());

class Popular {
  List<PopularList> data;
  Links links;
  Meta meta;

  Popular({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        data: List<PopularList>.from(json["data"].map((x) => PopularList.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class PopularList {
  String name;
  int harga;
  String waktu;
  int jumlah;
  String rating;
  String image;
  int pesan;

  PopularList({
    required this.name,
    required this.harga,
    required this.waktu,
    required this.jumlah,
    required this.rating,
    required this.image,
    required this.pesan,
  });

  factory PopularList.fromJson(Map<String, dynamic> json) => PopularList(
        name: json["name"],
        harga: json["harga"],
        waktu: json["waktu"],
        jumlah: json["jumlah"],
        rating: json["rating"],
        image: json["image"],
        pesan: json["pesan"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "harga": harga,
        "waktu": waktu,
        "jumlah": jumlah,
        "rating": rating,
        "image": image,
        "pesan": pesan,
      };
}
