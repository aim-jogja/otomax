class ProductModel {
  final int id;
  final int? harga_produk, merek, promo, kategori_produk;
  final String? nama_produk, deskripsi_produk,
               tipe_produk, gambar_produk;
  

  ProductModel({ 
    required this.id, 
    required this.nama_produk,
    required this.harga_produk,
    required this.deskripsi_produk,
    required this.kategori_produk,
    required this.tipe_produk,
    required this.gambar_produk,
    required this.merek,
    required this.promo
    });
  
  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['id'],
      nama_produk: json['nama'], 
      harga_produk: json['harga'],
      deskripsi_produk: json['deskripsi'].toString(),
      kategori_produk: json['kategori_id'],
      tipe_produk: json['tipe'],
      gambar_produk: json['gambar'] != null ? json['gambar'] : "",
      merek: json['merek_id'],
      promo: json['promo'],
      );
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['id'] = id;
    m['nama'] = nama_produk;
    m['harga'] = harga_produk;
    m['deskripsi'] = deskripsi_produk;
    m['kategori'] = kategori_produk;
    m['tipe'] = tipe_produk;
    m['gambar'] = gambar_produk;
    m['merek'] = merek;
    m['promo'] = promo;
    return m;
  }
}
