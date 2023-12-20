import 'package:cubid_crud/pages/widgets/custom_button.dart';

import '../exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsCubit = context.read<ItemCubit>();
    itemsCubit.getItemsLocal();

    return Scaffold(
        body: SafeArea(
          child: BlocConsumer<ItemCubit, ItemState>(
              listener: (context, state) {
          if (state is ItemFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          }
              },
              builder: (context, state) {
          if (state is ItemInitial) {
            return Center(
              child: AppText.large("No New Data"),
            );
          } else if (state is ItemLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ItemLoaded) {
            return pageDisplay(state.data, context);
          } else {
            return Center(
              child: Column(
                children: [
                  AppText.large("No New Data"),
                ],
              ),
            );
          }
              },
            ),
        ));
  }
}

Widget pageDisplay(List<ItemModel> items, BuildContext context) {
  return Center(
    child: Column(
      children: [
        CustomButton(
          width1: 300.w,
          text: 'SYNC',
          onTap: () {
            final itemCubit = context.read<ItemCubit>();
            itemCubit.syncNotes();
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return AppText.large(item.name);
              }),
        ))
      ],
    ),
  );
}
