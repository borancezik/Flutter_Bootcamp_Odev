import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class VeritabaniYardimcisi{
  static final String veritabaniAdi = "todo.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);

    if(await databaseExists(veritabaniYolu))
      {
        print("VeritabanÄ± zaten var kopyalamaya gerek yok");
      }
    else
      {
        ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
        await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
        print("VeritabanÄ± kopyalandÄ±");

      }

    return openDatabase(veritabaniYolu);

  }
}