import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app1/core/di/debendncy_injection.dart';
import 'package:my_app1/features/profile/cubit/profile_cubit.dart';
import 'package:my_app1/features/profile/cubit/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color primaryColor = Color(0xFF4E7EF7);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserProfile(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FA),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (userData) => CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 220.h,
                    pinned: true,
                    backgroundColor: primaryColor,
                    elevation: 0,
                    title: Text(
                      'My Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ClipPath(
                        clipper: HeaderCurveClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [primaryColor, primaryColor.withOpacity(0.75)],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.h),
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50.r,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 46.r,
                                      backgroundColor: Colors.white.withOpacity(0.2),
                                      child: Icon(Icons.person, size: 55.r, color: Colors.white),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(6.r),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.camera_alt, size: 16.r, color: primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                userData.name ?? "N/A",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Info",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          _buildInfoCard("Name", userData.name ?? "N/A", Icons.person_outline),
                          _buildInfoCard("Email", userData.email ?? "N/A", Icons.email_outlined),
                          _buildInfoCard("Phone", userData.phone ?? "N/A", Icons.phone_outlined),
                          _buildInfoCard("Gender", userData.gender ?? "N/A", Icons.transgender),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              failure: (errorHandler) => Center(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Text(
                    errorHandler.apiErrorModel.message ?? "Error",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  ),
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: primaryColor, size: 20.r),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.grey[500], fontSize: 12.sp)),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// كليبر بيعمل كيرف ناعم من الجنب الشمال بس في أسفل الحتة الزرقا
/// اليمين بيفضل مستقيم لحد آخر الهيدر، والشمال بينزل بمنحنى ناعم
class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // ابدأ من أعلى الشمال، وانزل لحد نقطة قبل آخر الهيدر بشوية (قيمة ثابتة مؤقتاً للاختبار)
    path.lineTo(0, size.height - 40);

    // كيرف ناعم بينزل لتحت في الجنب الشمال بس
    path.quadraticBezierTo(
      size.width * 0.15, size.height, // نقطة التحكم
      size.width * 0.3, size.height, // نقطة النهاية (وصلت لأسفل الهيدر)
    );

    // باقي الهيدر يفضل مستقيم لحد اليمين
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}