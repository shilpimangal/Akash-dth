import 'package:Akash/config/theme/custom_colors.dart';
import 'package:Akash/core/resources/exception_handler.dart';
import 'package:get_it/get_it.dart';
import '../core/helper/preference_manager.dart';
import '../core/resources/http_client.dart';
import '../config/routes/app_routes.dart';
import '../data/repositories/auth/auth_repository_impl.dart';
import '../data/services/auth/auth_service.dart';
import '../domain/auth_repository.dart';
import '../presenter/helper/button_widget.dart';
import '../presenter/helper/common_widget.dart';
import '../presenter/helper/info_bottom_sheet.dart';
import '../presenter/helper/text_form_field_widget.dart';
import '../presenter/helper/text_widget.dart';
import '../presenter/logic/auth/auth_cubit.dart';
import '../presenter/logic/common/text_toggle_cubit.dart';
import '../presenter/logic/navigation/navigation_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // App Routes
  sl.registerSingleton<AppRoutes>(AppRoutes());

  // http client
  sl.registerLazySingleton<ApiHttpClient>(() => ApiHttpClient());

  //Navigation cubit
  sl.registerFactory<NavigationCubit>(() => NavigationCubit());

  // Dependencies
  sl.registerSingleton<AuthService>(AuthService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
  sl.registerFactory<TextToggleCubit>(() => TextToggleCubit());


  sl.registerLazySingleton<ExceptionHandler>(() => ExceptionHandler());
  sl.registerLazySingleton<InfoBottomSheet>(() => InfoBottomSheet());
  sl.registerLazySingleton<PreferenceManager>(() => PreferenceManager());
  sl.registerLazySingleton<CustomColors>(() => CustomColors());
  sl.registerLazySingleton<CommonWidget>(() => CommonWidget());
  sl.registerLazySingleton<ButtonWidget>(() => ButtonWidget());
  sl.registerLazySingleton<TextFormFieldWidget>(() => TextFormFieldWidget());
  sl.registerLazySingleton<TextWidget>(() => TextWidget());
}
