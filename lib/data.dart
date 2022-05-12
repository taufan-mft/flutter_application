class Baju {
  String jenis,
      merk,
      harga,
      gambar,
      deskripsi =
          'kondisi bagus, ukuran muat untuk dewasa, rekomendasi untuk yang memakai ukuran XL';
  int stok;
  double rating;

  Baju(this.jenis, this.merk, this.harga, this.gambar, this.rating, this.stok);
}

final List<Baju> bajus = [
  Baju('Atasan Wanita Bunga Lengan Panjang', 'Clothess', 'Rp 50.000',
      'assets/atasbunga.jpeg', 4.0, 10),
  Baju('Atasan Wanita Kemeja Lengan Panjang', 'Clothess', 'Rp 60.000',
      'assets/ataskemeja.jpeg', 4.2, 10),
  Baju('Atasan Wanita Tali Lengan Panjang', 'Clothess', 'Rp 53.000',
      'assets/atastali.jpeg', 3.0, 10),
  Baju('Atasan Cowok Batik Lengan Pendek', 'Clothess', 'Rp 70.000',
      'assets/batik.jpeg', 5.0, 10),
  Baju('Atasan Wanita Batik Lengan Panjang', 'Clothess', 'Rp 70.000',
      'assets/batikcowo.jpeg', 4.0, 10),
  Baju('Atasan Cowok Galur Lengan Pendek', 'Clothess', 'Rp 50.000',
      'assets/galur.jpeg', 4.2, 10),
  Baju('Atasan Wanita Galur Lengan Panjang', 'Clothess', 'Rp 53.000',
      'assets/galurcew.jpeg', 4.0, 10),
  Baju('Atasan Wanita Jeans Lengan Panjang', 'Clothess', 'Rp 70.000',
      'assets/jeans.jpeg', 4.5, 10),
];
