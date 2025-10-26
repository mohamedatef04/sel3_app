import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel3_app/Features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:sel3_app/Features/search/logic/cubits/search/search_cubit.dart';
import 'package:sel3_app/Features/search/ui/widgets/search_grid_view.dart';
import 'package:sel3_app/core/widgets/custom_app_bar.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    context.read<SearchCubit>().getAllSearchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'البحث',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomTextFormField(
                  hintText: 'ادخل كلمة البحث هنا',
                  onChanged: (value) {
                    context.read<SearchCubit>().getSearchItems(query: value);
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 10.h),
              ),
              const SearchGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
