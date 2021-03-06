class Rec {
  final int id;
  final String merek,foto_merek;

  Rec({ 
    required this.id, 
    required this.merek,
    required this.foto_merek
    });
  
  factory Rec.fromJson(Map<String, dynamic> json){
    return Rec(
      id: (json['id']), 
      merek: json['merek'],
      foto_merek: json['foto_merek'] != null ? json['foto_merek'] : "rays.png" 
      );
  }
}
