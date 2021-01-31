import 'package:covinfo/DetailScreen.dart';
import 'package:covinfo/ForInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covinfo/network.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavBar();
  }
}


class FirstScreen extends StatefulWidget{
  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen>{
  Future data1;
  Future data2;
  var tanggal = new DateFormat("d MMMM yyyy").format(DateTime.now());
  @override
  void initState(){
    super.initState();
    data1 = getDataIndonesia();
    data2 = getDataJawa();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cov',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Info',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: dataCovidIndonesia(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          color: Colors.redAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Hindari kerumunan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Jarak dengan orang dimanapun harus lebih dari 1 meter',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: dataCovidJawa(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getDataIndonesia() async {
    Network network1 = Network('https://api.kawalcorona.com/indonesia/');
    return network1.fetchData();
  }

  Future getDataJawa() async {
    Network network2 = Network('https://api.kawalcorona.com/indonesia/provinsi');
    return network2.fetchData();
  }

  Widget dataCovidIndonesia(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'images/total_covid.png',
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Data Terkini di Indonesia',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      tanggal.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: data1,
                            builder: (context, AsyncSnapshot snapshot) {
                              if(snapshot.hasData){
                                return Text(
                                  '${snapshot.data[0]["positif"]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                              else{
                                return Text(
                                  '~',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                );
                              }
                            },
                          ),
                          Text(
                            'Terkonfirmasi',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: data1,
                            builder: (context, AsyncSnapshot snapshot) {
                              if(snapshot.hasData){
                                return Text(
                                  '${snapshot.data[0]["sembuh"]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                              else{
                                return Text(
                                  '~',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                );
                              }
                            },
                          ),
                          Text(
                            'Sembuh',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: data1,
                            builder: (context, AsyncSnapshot snapshot) {
                              if(snapshot.hasData){
                                return Text(
                                  '${snapshot.data[0]["dirawat"]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                              else{
                                return Text(
                                  '~',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                );
                              }
                            },
                          ),
                          Text(
                            'Dalam Perawatan',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: data1,
                            builder: (context, AsyncSnapshot snapshot) {
                              if(snapshot.hasData){
                                return Text(
                                  '${snapshot.data[0]["meninggal"]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                              else{
                                return Text(
                                  '~',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                );
                              }
                            },
                          ),
                          Text(
                            'Meninggal',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataCovidJawa(){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.search,
                  size: 40,
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Data Terkini di Pulau Jawa',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(
                      tanggal.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Provinsi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('DKI Jakarta'),
                    SizedBox(height: 10),
                    Text('Banten'),
                    SizedBox(height: 10),
                    Text('Jawa Barat'),
                    SizedBox(height: 10),
                    Text('Jawa Tengah'),
                    SizedBox(height: 10),
                    Text('Jawa Timur'),
                    SizedBox(height: 10),
                    Text('DI Yogyakarta'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Positif',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[0]["attributes"]["Kasus_Posi"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[11]["attributes"]["Kasus_Posi"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[2]["attributes"]["Kasus_Posi"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[3]["attributes"]["Kasus_Posi"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[1]["attributes"]["Kasus_Posi"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[22]["attributes"]["Kasus_Posi"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Sembuh',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[0]["attributes"]["Kasus_Semb"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[11]["attributes"]["Kasus_Semb"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[2]["attributes"]["Kasus_Semb"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[3]["attributes"]["Kasus_Semb"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[1]["attributes"]["Kasus_Semb"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[22]["attributes"]["Kasus_Semb"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Meninggal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 15),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[0]["attributes"]["Kasus_Meni"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[11]["attributes"]["Kasus_Meni"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[2]["attributes"]["Kasus_Meni"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[3]["attributes"]["Kasus_Meni"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[1]["attributes"]["Kasus_Meni"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                      future: data2,
                      builder: (context, AsyncSnapshot snapshot) {
                        if(snapshot.hasData){
                          return Text(
                            '${snapshot.data[22]["attributes"]["Kasus_Meni"]}',
                          );
                        }
                        else{
                          return Text('~');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Cov',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Info',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 5),
        children: forInfoList.map((info) {
          return FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(detailInfo: info);
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height: 80,
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        info.image,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          info.judul,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedNavBar = 0;

  static List<Widget> _nyoba = <Widget>[
    FirstScreen(),
    SecondScreen(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: _nyoba.elementAt(_selectedNavBar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Informasi'),
          ),
        ],
        currentIndex: _selectedNavBar,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}

var forInfoList = [
  ForInfo(
      judul: 'Apa itu Covid-19?',
      image: 'images/covid.png',
      konten: 'COVID-19, singkatan dari coronavirus disease 2019, adalah penyakit yang disebabkan oleh jenis coronavirus baru yaitu virus severe acute respiratory syndrome coronavirus 2 atau SARS-CoV-2, yang dilaporkan pertama kali di Wuhan Tiongkok pada tanggal 31 Desember 2019. Setelah itu, COVID-19 menular antarmanusia dengan sangat cepat dan menyebar ke puluhan negara, termasuk Indonesia, hanya dalam beberapa bulan. Penyebarannya yang cepat membuat beberapa negara menerapkan kebijakan untuk memberlakukan lockdown untuk mencegah penyebaran virus Corona. Di Indonesia, pemerintah menerapkan kebijakan Pembatasan Sosial Berskala Besar atau disebut dengan PSBB untuk menekan penyebaran virus ini.',
  ),
  ForInfo(
    judul: 'Gejala terinfeksi Covid-19',
    image: 'images/gejala.png',
    konten: 'Masing-masing orang memiliki respons yang berbeda terhadap COVID-19. Sebagian besar orang yang terpapar virus ini akan mengalami gejala ringan hingga sedang, dan akan pulih tanpa perlu dirawat di rumah sakit.\n\nGejala yang paling umum:\n-demam\n-batuk kering\n-kelelahan\n\nGejala yang sedikit tidak umum: \n-rasa tidak nyaman dan nyeri\n-nyeri tenggorokan\n-diare\n-konjungtivitis (mata merah) \n-sakit kepala\n-hilangnya indera perasa atau penciuman\n-ruam pada kulit, atau perubahan warna pada jari tangan atau jari kaki\n\nGejala serius: \n-kesulitan bernapas atau sesak napas\n-nyeri dada atau rasa tertekan pada dada\n-hilangnya kemampuan berbicara atau bergerak\n\nSegera cari bantuan medis jika Anda mengalami gejala serius. Selalu hubungi dokter atau fasilitas kesehatan yang ingin Anda tuju sebelum mengunjunginya. \n\nOrang dengan gejala ringan yang dinyatakan sehat harus melakukan perawatan mandiri di rumah. Rata-rata gejala akan muncul 5–6 hari setelah seseorang pertama kali terinfeksi virus ini, tetapi bisa juga 14 hari setelah terinfeksi.',
  ),
  ForInfo(
    judul: 'Cara Pencegahan Covid-19',
    image: 'images/pencegahan.png',
    konten: 'Ada beberapa cara yang bisa kita gunakan untuk mencegah penyebaran dan terinfeksi Covid-19, antara lain:\n-Cuci tangan Anda secara rutin. Gunakan sabun dan air, atau cairan pembersih tangan berbahan alkohol. \n-Selalu jaga jarak aman dengan orang yang batuk atau bersin. \n-Kenakan masker jika pembatasan fisik tidak dimungkinkan. \n-Jangan sentuh mata, hidung, atau mulut Anda. \n-Saat batuk atau bersin, tutup mulut dan hidung Anda dengan lengan atau tisu. \n-Jangan keluar rumah jika merasa tidak enak badan. \n-Jika demam, batuk, atau kesulitan bernapas, segera cari bantuan medis. \n\nMengapa kita perlu memakai masker? \nKarena masker dapat membantu mencegah penyebaran virus dari orang yang mengenakannya kepada orang lain. Mengenakan masker saja pun tidak cukup untuk melindungi diri dari COVID-19, sehingga harus dikombinasikan dengan pembatasan fisik dan kebersihan tangan. Kita juga harus mengikuti saran yang diberikan oleh otoritas kesehatan setempat. \n\nKetika kita ingin memeriksakan kesehatan, telepon terlebih dahulu agar penyedia layanan kesehatan dapat segera mengarahkan Anda ke fasilitas kesehatan yang tepat. Tindakan ini akan melindungi Anda serta mencegah penyebaran virus dan infeksi lainnya.',
  ),
  ForInfo(
    judul: 'Larangan semasa Pandemi',
    image: 'images/larangan.png',
    konten: 'Di masa pandemi Covid-19 ini, salah satu larangan yang umum adalah tidak boleh berkerumun. Memang hal tersebut wajib kita taati karena penyebaran Covid-19 melalui orang-orang yang saling berkerumun dan tentu tidak memakai masker. Berikut larangan-larangan semasa pandemi Covid-19.\n1. Jangan makan di tempat umum seperti restoran, cafe, dan lainnya.\n2. Tidak boleh berkerumun di tempat umum (lebih dari 5 orang), tempat ibadah, tempat kerja, dan lain sebagainya.\n3. Tidak boleh menggelar resepsi pernikahan atau kegiatan yang dapat mengundang orang berkerumun.',
  ),
  ForInfo(
    judul: 'Cara cuci tangan yang benar',
    image: 'images/cuci_tangan.png',
    konten: 'Apakah Anda tahu bahwa untuk mencuci tangan secara menyeluruh, Anda perlu waktu sekitar 40 detik hingga satu menit, atau kira-kira selama menyanyikan lagu ‘Selamat Ulang Tahun’ dua kali, agar benar-benar bersih? Anda mungkin ingin menyanyikannya keras-keras, namun ini adalah pengingat yang bermanfaat bagi Anda untuk mengambil waktu yang Anda perlukan untuk mencuci tangan Anda! Tidaklah semudah membasahi tangan, mengoleskan pencuci tangan, menggosok dengan cepat dan membilasnya kembali.\n\nKebersihan tangan yang baik bisa secara signifikan mengurangi penyebaran bakteri dan kuman berbahaya lainnya yang bisa menyebabkan diare, muntah dan infeksi berbahaya lainnya. Ikuti 8 langkah berikut ini untuk menyempurnakan teknik mencuci tangan anda.\n\nLangkah-Langkah Mencuci Tangan\n1. Basahi tangan dengan air mengalir yang bersih dan hangat\n2. Pakai sejumlah kecil sabun\n3. Gosok telapak tangan bersamaan, jauh dari air\n4. Gosok jemari dan jempol dan kulit di sela-sela\n5. Bersihkan telapak tangan Anda dengan kuku Anda\n6. Gosok bagian belakang setiap tangan\n7. Cuci dengan air bersih mengalir\n8. Keringkan dengan handuk atau tisu yang bersih',
  ),
];
