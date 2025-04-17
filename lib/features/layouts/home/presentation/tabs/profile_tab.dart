import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/app_theme/app_text_style.dart';
import 'package:ai_app/features/layouts/home/data/data_sources/update_data_source_impl.dart';
import 'package:ai_app/features/layouts/home/data/repositories/update_repo_impl.dart';
import 'package:ai_app/features/layouts/home/presentation/bloc/update_cubit.dart';
import 'package:ai_app/features/layouts/home/presentation/bloc/user_data_states.dart';
import 'package:ai_app/features/layouts/home/presentation/widgets/profile_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatefulWidget {
  // final UpdateUserModel? updateUserModel;
  // final UserDataCubit? userDataCubit;

  const ProfileTab({
    super.key,
  });

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  // final nameController = TextEditingController();
  //
  // final phoneController = TextEditingController();
  //
  // final formKey = GlobalKey<FormState>();

  // late int selectedAvatarIndex;

  // @override
  // void initState() {
  //   super.initState();
  //   selectedAvatarIndex = widget.updateUserModel?.indexOfImage ??
  //       0; // Initialize with the current index
  // }

  // @override
  // void dispose() {
  //   phoneController.dispose();
  //   nameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return UserDataCubit(updateRepo: UpdateRepoImpl(UpdateDataSourceImpl()))
          ..getUser();
      },
      child: BlocBuilder<UserDataCubit, UserDataStates>(
        buildWhen: (previous, current) {
          return (current is GetDataOnLoadingStates ||
              current is GetDataOnErrorStates ||
              current is GetDataOnSuccessStates);
        },
        builder: (context, state) {
          if (state is GetDataOnLoadingStates) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetDataOnErrorStates) {
            return Center(
              child: Text("Error Data",
                  style: AppTextStyle.getMediumTextStyle(
                      color: AppColors.backgroundColor)),
            );
          }
          if (state is GetDataOnSuccessStates) {
            return ProfileTabWidget(
              updateUserModel: state.updateUserModel!,
            );
          }
          return SizedBox(
            child: Center(
              child: Text(
                "data data data",
                style: AppTextStyle.getMediumTextStyle(
                    color: AppColors.backgroundColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
