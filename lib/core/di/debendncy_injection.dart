import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app1/core/networking/api_service.dart';
import 'package:my_app1/core/networking/dio_factory.dart';
import 'package:my_app1/core/widgets/push_notification_service.dart';
import 'package:my_app1/features/appoinments/data/apis/appointment_service.dart';
import 'package:my_app1/features/appoinments/data/repo/appointment_repo_.dart';
import 'package:my_app1/features/appoinments/presentation/cubit/appoinments_cubit.dart';
import 'package:my_app1/features/doctor_details/data/apis/doctor_details_api_service.dart';
import 'package:my_app1/features/doctor_details/data/repo/doctor_details_repo.dart';
import 'package:my_app1/features/doctor_details/presentation/cubit/doctor_details_cubit.dart';
import 'package:my_app1/features/home/data/apis/home_api_service.dart';
import 'package:my_app1/features/home/data/repos/home_repo.dart';
import 'package:my_app1/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_app1/features/login/logic/repo.dart';
import 'package:my_app1/features/login/presentation/cubit/login_cubit.dart';
import 'package:my_app1/features/profile/cubit/profile_cubit.dart';
import 'package:my_app1/features/profile/data/apis/profile_api_service.dart';
import 'package:my_app1/features/profile/data/repo/profile_repo.dart';
import 'package:my_app1/features/search/cubit/search_cubit.dart';
import 'package:my_app1/features/search/data/apis/search_api_service.dart';
import 'package:my_app1/features/search/data/repo/search_repo.dart';
import 'package:my_app1/features/sign_up/data/repo/repo.dart';
import 'package:my_app1/features/sign_up/presentation/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // details
  getIt.registerLazySingleton<DoctorDetailsApiService>(
    () => DoctorDetailsApiService(dio),
  );
  getIt.registerLazySingleton<DoctorDetailsRepo>(
    () => DoctorDetailsRepo(getIt()),
  );
  getIt.registerFactory<DoctorDetailsCubit>(() => DoctorDetailsCubit(getIt()));

  getIt.registerLazySingleton<AppointmentService>(
    () => AppointmentService(dio), 
  );
  getIt.registerLazySingleton<AppointmentRepo>(
    () => AppointmentRepo(getIt()), 
  );
  getIt.registerFactory<AppoinmentsCubit>(
    () => AppoinmentsCubit(getIt()),
  );

  getIt.registerLazySingleton<SearchApiService>(() => SearchApiService(dio));
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

  // Profile
getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));

getIt.registerLazySingleton<PushNotificationService>(() => PushNotificationService());
}