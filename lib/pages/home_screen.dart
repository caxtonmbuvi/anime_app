import 'dart:math';
import '../data/controller/chip/cubit/chip_cubit.dart';
import '../exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final itemsCubit = context.read<ItemCubit>();
    final themeCubit = context.read<ThemeCubit>();
    itemsCubit.getItemsLocal();
    themeCubit.loadTheme();
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ItemCubit, ItemState>(
          listener: (context, state) {
            if (state is ItemFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is ItemInitial) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: AppText.large('No new data')));
            }
          },
          builder: (context, state) {
            if (state is ItemLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ItemLoaded) {
              return pageDisplay(state.data, context);
            } else if (state is ItemFailure) {
              return Center(
                child: AppText.small(state.message),
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    AppText.large("No Data"),
                  ],
                ),
              );
            }
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomButton(
      //   sync: true,
      //   width1: 150.w,
      //   height1: 70.w,
      //   text: 'SYNC',
      //   onTap: () {
      //     final itemCubit = context.read<ItemCubit>();
      //     itemCubit.syncNotes();
      //   },
      // ),
    );
  }

  // List<Widget> characterChips(List<ItemDetailLocalModel> _chipsList, ThemeState state) {
  //   List<Widget> chips = [];
  //   for (int i = 0; i < _chipsList.length; i++) {
  //     Widget item = BlocBuilder<ChipCubit, ChipState>(
  //       builder: (context, chipState) {
  //         return SizedBox(
  //           width: 300.w,
  //           child: Card(
  //             semanticContainer: true,
  //             clipBehavior: Clip.antiAliasWithSaveLayer,
  //             elevation: 5,
  //             margin: EdgeInsets.all(10.h),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10.r)),
  //             child: Center(
  //               child: Padding(
  //                 padding: EdgeInsets.all(8.w),
  //                 child: Column(
  //                   children: [
  //                     // Like Icon here
  //                     GestureDetector(
  //                       child: Stack(
  //                         alignment: Alignment.center,
  //                         children: [
  //                           // ... other children ...
  //                           Opacity(
  //                             opacity: chipState.isHeartAnimating ? 1 : 0,
  //                             child: HeartAnimationWidget(
  //                               isAnimating: chipState.isHeartAnimating,
  //                               duration: const Duration(milliseconds: 700),
  //                               onEnd: () =>
  //                                   context.read<ChipCubit>().stopAnimation(),
  //                               index: i,
  //                               child: Icon(
  //                                 Icons.favorite,
  //                                 color: ColorName.whiteColor,
  //                                 size: 100.w,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       onDoubleTap: () {
  //                         context.read<ChipCubit>().startAnimation();
  //                         context.read<ChipCubit>().toggleLike();
  //                       },
  //                     ),
  //                     // ... other widgets ...
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //     chips.add(item);
  //   }
  //   return chips;
  // }


  List<Widget> characterChips(
      List<ItemDetailLocalModel> _chipsList, ThemeState state) {
    bool isLiked = true;
    bool isHeartAnimating = false;

    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.charInfo),
        child: SizedBox(
          width: 300.w,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            margin: EdgeInsets.all(10.h),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    //Like Icon here
                    // GestureDetector(
                    //   child: Stack(
                    //     alignment: Alignment.center,
                    //     children: [
      
                    //       Opacity(
                    //         opacity: isHeartAnimating ? 1 : 0,
                    //         child: HeartAnimationWidget(
                    //           index: i,
                    //             isAnimating: isHeartAnimating,
                    //             duration: Duration(milliseconds: 700),
                    //             child: Icon(
                    //               Icons.favorite,
                    //               color: ColorName.whiteColor,
                    //               size: 100.w,
                    //             ),
                    //             onEnd: () => setState(() => isHeartAnimating = false),
                    //           ),
                    //       ),
                    //     ],
                    //   ),
                    //   onDoubleTap: () {
                    //     setState(() {
                    //       isHeartAnimating = true;
                    //       isLiked = true;
                    //     });
                    //   },
                    // ),
      
                    SizedBox(
                      height: _getHeight(),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          _chipsList[i].image.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
      
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          AppText.medium(_chipsList[i].name.toString(),
                              color: state is ThemeDark
                                  ? ColorName.whiteColor
                                  : ColorName.blackColor),
                          AppText.small(
                            _chipsList[i].race.toString(),
                            textOverflow: TextOverflow.ellipsis,
                            color: state is ThemeDark
                                ? ColorName.whiteColor
                                : ColorName.blackColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  Widget pageDisplay(List<ItemDetailLocalModel> items, BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: state is ThemeDark
                            ? ColorName.whiteColor
                            : ColorName.blackColor),
                    loadToggle(context),
                  ],
                ),
              ),
              Expanded(
                  child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 300.h,
                      width: ScreenUtil().screenWidth,
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 5,
                          margin: EdgeInsets.all(10.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r)),
                          child: Image.asset(
                            Assets.images.welcome2.path,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 90.h,
                      child: categoryChips(context, state),
                    ),
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      children: characterChips(items, state),
                    )
                  ]))
                ],
              )),
            ],
          ),
        );
      },
    );
  }

  double _getHeight() {
    double defaultValue = 170.0;
    Random random = Random();

    return defaultValue + random.nextInt(80);
  }

  Widget loadToggle(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final icon =
            state is ThemeDark ? Icons.brightness_7 : Icons.brightness_2;

        return ElevatedButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(10.h),
              // Button color
              backgroundColor: ColorName.blackColor,
            ),
            child: Icon(icon));
        // ElevatedButton.icon(
        //   // This button uses the ThemeCubit to toggle the theme.
        //   onPressed: () => context.read<ThemeCubit>().toggleTheme(),
        //   icon: Icon(icon),
        //   label: Text(text),
        // );
      },
    );
  }

  List<Category> chipsList = [
    Category("All", false),
    Category("Canada", false),
    Category("London", false),
    Category("Paris", false),
    Category("Japan", false),
    Category("Maldives", false),
    Category("Switzerland", false)
  ];

  Widget categoryChips(BuildContext context, ThemeState state) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: chipsList.length,
        itemBuilder: (context, index) {
          var item = chipsList[index];
          return Padding(
            padding: EdgeInsets.only(left: 10.w, right: 5.w),
            child: FilterChip(
              labelPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: const BorderSide(color: ColorName.blackColor),
              ),
              label: AppText.medium(item.label, color: ColorName.blackColor),
              backgroundColor: ColorName.whiteColor,
              selected: item.isSelected,
              onSelected: (bool value) {
                // setState(() {
                //   _chipsList[i].isSelected = value;
                // });
              },
            ),
          );
        });
  }
}

class Category {
  String label;
  bool isSelected;
  Category(this.label, this.isSelected);
}

class HeartAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final int index;

  const HeartAnimationWidget(
      {Key? key,
      required this.child,
      required this.isAnimating,
      this.duration = const Duration(milliseconds: 150),
      this.onEnd,
      required this.index})
      : super(key: key);

  @override
  State<HeartAnimationWidget> createState() => _HeartAnimationWidgetState();
}

class _HeartAnimationWidgetState extends State<HeartAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final halfDuration = widget.duration.inMilliseconds ~/ 2;
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: halfDuration));
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(HeartAnimationWidget oldWidget) {
    // TODO: implement didChangeDependencies
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      doAnimation();
    }
  }

  Future doAnimation() async {
    await controller.forward();
    await controller.reverse();
    await Future.delayed(const Duration(microseconds: 400));

    if (widget.onEnd != null) {
      widget.onEnd!();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: scale,
        child: widget.child,
      );
}
