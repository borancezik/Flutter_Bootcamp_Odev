import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/repo/yapilacaklardao_repository.dart';

class IsDetayCubit extends Cubit<void>{
  IsDetayCubit():super(0);

  var krepo = YapilacaklarDaoRepository();

  Future<void> guncelle(int yapilacak_id, String yapilacak_is) async {
    await krepo.IsGuncelle(yapilacak_id, yapilacak_is);
  }
}