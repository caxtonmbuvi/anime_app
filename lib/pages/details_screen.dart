import '../exports.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var description =
        'Tanjiro is a young boy of average height with fairly tanned skin and an athletic, muscular physique. He has ruffled, black hair with burgundy tips, combed back to expose his forehead, and wide, dark red eyes with white pupils that appear lighter around the lower section of his irises. He also has a scar on the top left of his forehead, first seen when his mother brought him to watch his father perform the Hinokami Kagura dance. The scar originally looked somewhat like a graze until his fight with the Hand Demon during Final Selection, after which it develops into a flame-like pattern as his Demon Slayer Mark. It is noted that his hands are visibly rougher for someone his age, as a result of his rigorous training under Sakonji Urokodaki. Tanjiro looks remarkably similar in appearance to his ancestor Sumiyoshi Kamado, possessing the same facial structure, eyes, and hairstyle as him, although Sumiyoshi\'s hair was longer, about shoulder-length and would be tied in a ponytail behind his head.Tanjiro first appears wearing a checkered, black-and-sea-foam-green haori over a white robe and black pants. He occasionally sports a turquoise scarf and is seen with circular, white bands looped around his calves. He also wears a distinct pair of hanafuda earrings, with the image of the rising sun over a mountain. His hair is also kept tied back in small ponytail or bun; as he trains with Sabito and Makomo, his hair grows to his shoulders.During the Final Selection, Tanjiro wears a blue, cloud-patterned samue-styled kimono and black pants, nearly identical to Sakonji\'s outfit. He still wears his hanafuda earrings, but his hair is cut extremely short and remains the same length since. Similar to the rest of the apprentices that were trained under Sakonji, Tanjiro wears a hand-carved fox mask crafted from his master on the left side of his head. The mask has red accents on the eyes, ears, and spots on each corner of its mouth. On the upper right corner of the mask, there is a sun-shaped design that likely symbolizes the scar on his forehead.After becoming a Demon Slayer, Tanjiro wears the standard Demon Slayer uniform, a dark-brown gakuran jacket, a white belt, baggy chocho zubon pants that extend into tabi socks, a pair of zōri with red straps, and bands of white cloth wrapped tightly around his calves resembling kyahan, all beneath his signature checkered haori. He carries a large wooden box on his back (which was a gift to him from Sakonji Urokodaki), where his sister sleeps as they travel during the day.During his second encounter with Muzan Kibutsuji, he injures his right eye in the Infinity Castle. As the battle progresses, Tanjiro suddenly collapses and his wound begins to form a large mass over his right eye due to the poison inflicted on him by Muzan. Later on, when Tanjiro wakes up, he is described as looking \'repulsive\' by Muzan.[9] Later in the battle Tanjiro\'s left arm is severed by Muzan.[10]After being turned into a demon by Muzan, Tanjiro is able to heal the growth on his face as well as regenerate his lost arm and other smaller injuries. He obtains eyes with slit pupils, fangs and flame-shaped marks over his left forehead and right jaw that are reminiscent of those of Kokushibo, in addition to a third, smaller flame-shaped mark coming down from the right side of his head down to his eyebrow after he conquered the weakness to sunlight. His scar turns into a flame-pattern as if it were a permanent Demon Slayer Mark, has become longer and is the largest of the three, and all three marks vaguely point towards his nose, though only his scar-mark reaches it. He still dons his bloodstained corps uniform, one sleeve ripped off where his arm was severed, but loses his checkered haori and the Nichirin Sword at his hip.[3]After returning to his human form, Tanjiro loses the ability to see from his right eye, the iris of which is now a dull pink-gray color and the pupil black rather than its original white. His left arm, which he regrew as a Demon, now takes the appearance of that which an older person may have, becoming wrinkled and skeletal, and he loses all feeling in it below the elbow and thus the ability to move it from his forearm down.[11]';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Background image
                Container(
                  height: 350.h, // Adjust the height as needed
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.images.welcome.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient overlay
                Container(
                  height:
                      350.h, // Should match the height of the image container
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.large(
                            'DEMON SLAYER: \n Tanjiro Kamodo',
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          AppText.small(
                            'Action, Demons, Historical, Shounen, Supernatural',
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ))
              ],
            ),

            Container(
              color: Colors.black,
              padding: EdgeInsets.all(15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText.large(
                    'About',
                    color: Colors.white,
                  ),
                  AppText.medium(
                    '🖋️',
                    fontSize: 18.sp,
                  )
                ],
              ),
            ),

            Container(
              color: Colors.black,
              height: 300.h,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Material(
                      child: Container(
                        height: 70.h,
                        color: Colors.black,
                        margin: EdgeInsets.zero,
                        child: TabBar(
                          isScrollable: true,
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          unselectedLabelColor: Colors.pink,
                          unselectedLabelStyle:
                              const TextStyle(color: Colors.pink),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Colors.pinkAccent),
                          tabs: [
                            Tab(
                              child: Container(
                                height: 50,
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.pinkAccent, width: 1)),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("Characteristics"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 50,
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.pinkAccent, width: 1)),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("Affiliation"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 50,
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.pinkAccent, width: 1)),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("Personal Status"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.separated(
                            padding: EdgeInsets.all(15.w),
                            itemCount: 1,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                          'Race:  ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          'Human (Initially, currently)[2] \nDemon (Temporarily)[3]',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppText.medium(
                                          'Gender: ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          'Male',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                          'Age: ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          '13 (Chapter 1) \n15 (End of Chapter 5) \n16 (End of Chapter 204)',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppText.medium(
                                          'Height: ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          '165 cm (5\'5")',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppText.medium(
                                          'Weight: ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          '61 kg (134 lb)',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppText.medium(
                                          'Birthday: ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          'July 14th[4]',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppText.medium(
                                          'Hair Color: ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          'Black to Red',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppText.medium(
                                          'Eye Color: ',
                                          color: Colors.white,
                                        ),
                                        AppText.small(
                                          'Dark Red',
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          ListView.separated(
                            padding: EdgeInsets.all(15),
                            itemCount: 20,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {},
                                title: Text("Status List $index"),
                                subtitle: Text("Tab bar ui"),
                                trailing: Icon(Icons.arrow_circle_right_sharp),
                              );
                            },
                          ),
                          ListView.separated(
                            padding: EdgeInsets.all(15),
                            itemCount: 20,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {},
                                title: Text("Call List $index"),
                                subtitle: Text("Tab bar ui"),
                                trailing: Icon(Icons.arrow_circle_right_sharp),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            //Apprearance Description
            Container(
              color: Colors.black,
              padding: EdgeInsets.all(15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    child: const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  AppText.large(
                    'Appearance Description 🕵️‍♂️',
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ReadMoreWidget(
                    text: description,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 130.h, // Set the height of the ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    100.h), // Adjust the rounding here
                                child: Image.asset(
                                  Assets.images.welcome2.path,
                                  width: 100.h, // Set your desired image width
                                  height:
                                      100.h, // Set your desired image height
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    child: const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),

            

            // Container(
            //   height: 100.h,
            //   width: ScreenUtil().screenWidth,
            //   child: Image.network('https://static.wikia.nocookie.net/kimetsu-no-yaiba/images/e/e8/Tanjiro_using_Fourth_Form_Striking_Tide.gif/revision/latest?cb=20190518192815'),
            // )
          ],
        ),
      ),
    );
  }
}
