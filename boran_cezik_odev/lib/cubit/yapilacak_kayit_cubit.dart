import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/repo/yapilacaklardao_repository.dart';

class IsKayitCubit extends Cubit<void>{

  IsKayitCubit():super(0);

  var krepo = YapilacaklarDaoRepository();

  Future<void> kayit(String yapilacak_is) async {
    await krepo.isKayit(yapilacak_is);
  }
}