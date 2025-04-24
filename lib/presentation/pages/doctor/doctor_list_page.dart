import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medpoint_mobile/core/utils/show_snackbar.dart';
import 'package:medpoint_mobile/domain/entities/doctor/doctor.dart';
import 'package:medpoint_mobile/presentation/cubit/doctor/doctor_cubit.dart';
import 'package:medpoint_mobile/presentation/widgets/custom_card.dart';
import 'package:medpoint_mobile/presentation/widgets/loader.dart';

class ListDoctor extends StatefulWidget {
  const ListDoctor({super.key});

  @override
  State<ListDoctor> createState() => _ListDoctorState();
}

class _ListDoctorState extends State<ListDoctor> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorCubit>().fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2EBF0),
      appBar: AppBar(
        centerTitle: true,
        title: BlocConsumer<DoctorCubit, DoctorState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is DoctorSuccess) {
              return Text(
                "${state.doctor.length} DOCTOR",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF6E8799), // warna abu-abu biru sesuai gambar
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              );
            }
            if (state is DoctorLoading) {
              return const Text(
                'Loading...',
                style: TextStyle(fontSize: 14),
              );
            }
            return const Text('0 DOCTOR');
          },
        ),
        leading: IconButton(
          onPressed: () {},
          color: const Color(0xFF6E8799),
          icon: const Icon(Iconsax.textalign_justifycenter),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is DoctorLoading) {
              return const Loader();
            }
            if (state is DoctorSuccess) {
              return ListView.builder(
                itemCount: state.doctor.length,
                itemBuilder: (context, index) {
                  final Doctor doctor = state.doctor[index];
                  return CustomCard(doctor: doctor);
                },
              );
            }
            return const Text('Data doctor tidak ditemukan');
          },
          listener: (context, state) {
            if (state is DoctorError) {
              showSnackBar(context, state.failure.message);
            }
          },
        ),
      ),
    );
  }
}
