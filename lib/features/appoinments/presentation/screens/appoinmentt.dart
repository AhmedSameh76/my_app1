import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app1/features/appoinments/presentation/cubit/appoinments_cubit.dart';
import 'package:my_app1/features/appoinments/presentation/cubit/appoinments_state.dart';

class Appoinmentt extends StatefulWidget {
  const Appoinmentt({super.key});

  @override
  State<Appoinmentt> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<Appoinmentt> {
  @override
  void initState() {
    super.initState();
    // استدعاء الداتا أول ما الشاشة تفتح
    context.read<AppoinmentsCubit>().getAppointment(date: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        centerTitle: true,
      ),
      body: BlocBuilder<AppoinmentsCubit, AppoinmentsState>(
        builder: (context, state) {
          return state.maybeWhen(
            // 1. حالة التحميل
            appointmentloading: () {
              return const Center(child: CircularProgressIndicator());
            },

            // 2. حالة الفشل
            appointmentFailuer: (apiErrorModel) {
              return Center(
                child: Text(
                  apiErrorModel.message ?? "حدث خطأ غير متوقع",
                  style: TextStyle(fontSize: 16.sp, color: Colors.red),
                ),
              );
            },

            // 3. حالة النجاح 
            appointmentSuccess: (appoinmentsModel) {
              final appointmentsList = appoinmentsModel.data ?? [];

              if (appointmentsList.isEmpty) {
                return Center(
                  child: Text(
                    'You don\'t have any appointments yet.',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: appointmentsList.length,
                itemBuilder: (context, index) {
                  // المتغير ده دلوقتي من نوع AppointmentData
                  final appointment = appointmentsList[index];

                  return Card(
                    margin: EdgeInsets.only(bottom: 16.h),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.w),
                      title: Text(
                        // بما إن الموديل مفيهوش اسم دكتور، هنعرض رقم الحجز مؤقتاً
                        'Appointment #${appointment.id ?? 'Unknown'}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.h),
                          // استخدام startTime بناءً على الموديل بتاعك
                          Text('Start Time: ${appointment.startTime ?? 'N/A'}'),
                          
                          // لو فيه وقت نهاية هنعرضه
                          if (appointment.endTime != null)
                            Text('End Time: ${appointment.endTime}'),
                            
                          SizedBox(height: 4.h),
                          
                          // عرض حالة الحجز بلون مميز
                          Text(
                            appointment.isBooked == true ? 'Status: Booked' : 'Status: Available',
                            style: TextStyle(
                              color: appointment.isBooked == true ? Colors.green : Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.calendar_month, color: Colors.blue),
                    ),
                  );
                },
              );
            },

            // أي حالة تانية
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}