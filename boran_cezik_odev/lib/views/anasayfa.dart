import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi/entity/Yapilacaklar.dart';
import 'package:kisiler_uygulamasi/views/yapilacak_detay_sayfa.dart';
import 'package:kisiler_uygulamasi/views/yapilacak_kayit_sayfa.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().isleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: aramaYapiliyorMu
            ? TextField(
                decoration: InputDecoration(hintText: "Ara"),
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
              )
            : Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                      context.read<AnasayfaCubit>().isleriYukle();
                    });
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yapilacaklar>>(
        builder: (context, islerListesi) {
          if (islerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: islerListesi.length,
              itemBuilder: (contex, index) {
                var islr = islerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                YapilacakDetaySayfa(yapilacak: islr))).then((_) {
                      context.read<AnasayfaCubit>().isleriYukle();
                    }); //üzerine tıkladıgımızda detay sayfasına gidiyor
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${islr.yapilacak_id} - ${islr.yapilacak_is}"),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("${islr.yapilacak_is} Silinsin mi ?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: () {
                                    context
                                        .read<AnasayfaCubit>()
                                        .sil(islr.yapilacak_id);
                                  },
                                ),
                              ));
                            },
                            icon: const Icon(Icons.delete_outline),
                            color: Colors.black45,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => YapilacakKayitSayfa()))
              .then((_) {
            context.read<AnasayfaCubit>().isleriYukle();
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
