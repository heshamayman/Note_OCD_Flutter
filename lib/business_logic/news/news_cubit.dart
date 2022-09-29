import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc/data/models/main/news/news_model.dart';
import 'package:odc/data/data_provider/remote/dio_helper.dart';
import 'package:odc/presentation/constants/end_points.dart';
import 'package:odc/presentation/constants/constants.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  NewsModel? newsModel;

  //load news from api
  void getNews() {
    emit(NewsLoading());

    DioHelper.getData(url: newsEndPoint , token: token).then((value) {
      print(value.data);
      newsModel = NewsModel.fromJson(value.data);

      emit(NewsSuccess());
    }).catchError((onError) {
      print(onError);
      print("Cannot load news");
      emit(NewsError());
    });
  }
}
