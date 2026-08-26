import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app1/features/city/location_screen.dart';
import 'package:my_app1/features/doctor_details/data/model/doctor_details_response_model.dart';
class DoctorLocationSection extends StatelessWidget {
  final DoctorData doctor;
  const DoctorLocationSection(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    final cityName = doctor.city?.name;
    final governrateName = doctor.city?.governrate?.name;
    final practicePlace = [
      if (cityName != null) cityName,
      if (governrateName != null) governrateName,
    ].join(', ');

    const LatLng clinicLocation = LatLng(30.0444, 31.2357);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Practice Place'),
        _buildSectionContent(practicePlace.isNotEmpty ? practicePlace : ""),
        SizedBox(height: 20.h),
        
        _buildSectionTitle('Address'),
        _buildSectionContent(doctor.address ?? ""),
        SizedBox(height: 20.h),

        _buildSectionTitle('Location Map'),
        SizedBox(height: 8.h),
        _buildMapPreview(context, clinicLocation),
        
        SizedBox(height: 40.h),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildMapPreview(BuildContext context, LatLng location) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, 
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenMap(location: location),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          height: 200.h,
          width: double.infinity,
          child: IgnorePointer( // بيمنع اللمس جوه الخريطة عشان السكرول ميبظش
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: location,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('preview_marker'),
                  position: location,
                ),
              },
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
            ),
          ),
        ),
      ),
    );
  }
}