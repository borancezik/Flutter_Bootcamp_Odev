import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/entity/Yapilacaklar.dart';
import 'package:kisiler_uygulamasi/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>>{

  AnasayfaCubit():super(<Yapilacaklar>[]);

  var krepo = YapilacaklarDaoRepository();

  Future<void> isleriYukle() async {
    var liste = await krepo.tumIsleriAl();
    emit(liste);
  }

  Future<void> ara(String arananKelime) async {
    var liste = await krepo.isAra(arananKelime);
    emit(liste);
  }
  Future<void> sil(int yapilacak_id) async {
    await krepo.isSil(yapilacak_id);
    await isleriYukle();
  }

}