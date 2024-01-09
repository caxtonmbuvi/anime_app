// import '../../exports.dart';

// class ReadMoreCustomText extends StatelessWidget {
//   final String text;
//   final Color color;
//   const ReadMoreCustomText({Key? key, required this.text, required this.color}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeState>(
//       builder: (context, state) {
//         return ReadMoreText(
//           text,
//           trimLines: 6,
//           preDataTextStyle: const TextStyle(fontWeight: FontWeight.w500),
//           style: TextStyle(
//             color: color,
//             fontSize: 14.0,
//           ),
//           colorClickableText: Colors.blue,
//           trimMode: TrimMode.Line,
//           trimCollapsedText: 'Read More',
//           trimExpandedText: ' show less',
//           textAlign: TextAlign.justify,
//         );
//       },
//     );
//   }
// }

import '../../exports.dart';

class ReadMoreWidget extends StatelessWidget {
  final String text;
  final Color color;

  const ReadMoreWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReadMoreCubit(),
      child: BlocBuilder<ReadMoreCubit, bool>(
        builder: (context, isExpanded) {
          final lines = isExpanded ? null : 4;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.medium(text, textOverflow: TextOverflow.fade, maxLine: lines, color: color,),
              TextButton(
                child: AppText.medium(isExpanded ? 'Read Less' : 'Read More', color: Colors.red,),
                onPressed: () => context.read<ReadMoreCubit>().toggle(),
              ),
            ],
          );
        },
      ),
    );
  }
}
