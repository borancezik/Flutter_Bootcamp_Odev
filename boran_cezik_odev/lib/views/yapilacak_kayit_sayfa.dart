import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/yapilacak_kayit_cubit.dart';

class YapilacakKayitSayfa extends StatefulWidget {
  const YapilacakKayitSayfa({Key? key}) : super(key: key);

  @override
  _YapilacakKayitSayfaState createState() => _YapilacakKayitSayfaState();
}

class _YapilacakKayitSayfaState extends State<YapilacakKayitSayfa> {
  var yapilacakIs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Kayit Sayfası"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              TextField(
                controller: yapilacakIs,
                decoration: const InputDecoration(hintText: "Yapilacak is"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<IsKayitCubit>().kayit(yapilacakIs.text);
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
                  child: const Text("Kayit et"))
            ],
          ),
        ),
      ),
    );
  }
}

