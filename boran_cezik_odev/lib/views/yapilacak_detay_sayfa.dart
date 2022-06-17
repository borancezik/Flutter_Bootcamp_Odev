import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/yapilacak_detay_cubit.dart';
import 'package:kisiler_uygulamasi/entity/Yapilacaklar.dart';

class YapilacakDetaySayfa extends StatefulWidget {

  Yapilacaklar yapilacak;
  YapilacakDetaySayfa({required this.yapilacak});

  @override
  _YapilacakDetaySayfaState createState() => _YapilacakDetaySayfaState();
}

class _YapilacakDetaySayfaState extends State<YapilacakDetaySayfa> {

  var yapilacakIs = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var yapilacak = widget.yapilacak;
    yapilacakIs.text = yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Kayıt detay"),
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
                    context.read<IsDetayCubit>().guncelle(widget.yapilacak.yapilacak_id, yapilacakIs.text);
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
                  child: const Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}

