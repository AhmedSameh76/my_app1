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
            appointmentloading: () {
              return const Center(child: CircularProgressIndicator());
            },

            appointmentFailuer: (apiErrorModel) {
              return Center(
                child: Text(
                  apiErrorModel.message ?? "error",
                  style: TextStyle(fontSize: 16.sp, color: Colors.red),
                ),
              );
            },

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
                        'Appointment #${appointment.id ?? 'Unknown'}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.h),
                          Text('Start Time: ${appointment.startTime ?? 'N/A'}'),
                          
                          if (appointment.endTime != null)
                            Text('End Time: ${appointment.endTime}'),
                            
                          SizedBox(height: 4.h),
                          
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

            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}