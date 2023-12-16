import 'dart:convert';

Datakos datakosFromJson(String str) => Datakos.fromJson(json.decode(str));

String datakosToJson(Datakos data) => json.encode(data.toJson());

class Datakos {
    final String deksripsi;
    final String detail;
    final String harga;
    final String image;
    final String nama;

    Datakos({
        required this.deksripsi,
        required this.detail,
        required this.harga,
        required this.image,
        required this.nama,
    });

    factory Datakos.fromJson(Map<String, dynamic> json) => Datakos(
        deksripsi: json["deksripsi"],
        detail: json["detail"],
        harga: json["harga"],
        image: json["image"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "deksripsi": deksripsi,
        "detail": detail,
        "harga": harga,
        "image": image,
        "nama": nama,
    };
}
