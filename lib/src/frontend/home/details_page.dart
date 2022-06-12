import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_app_flutter/src/src.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)?.settings.arguments as dynamic;

    // watch pokemon providers
    final pokemonData = ref.watch(
      pokemonDataProvider(args['index'].toString()),
    );

    // tabs list
    final tabs = [
      'Details',
      'Stats',
      'Moves',
      'Evolutions',
      'Types',
    ];

    // index to control current selected tab
    final tabIndex = useState(0);

    // function to show pokemon id count
    String count(index) {
      if (index.toString().length == 1) {
        return '00$index';
      } else if (index.toString().length == 2) {
        return '0$index';
      } else {
        return index.toString();
      }
    }

// function to change card color based on pokemon type
    Color type(String? type) {
      if (type == 'bug') {
        return const Color(0xFF3B9950);
      } else if (type == 'dark') {
        return const Color(0xFF5A5979);
      } else if (type == 'dragon') {
        return const Color(0xFF60CAD9);
      } else if (type == 'electric') {
        return const Color(0xFFFBFB70);
      } else if (type == 'fairy') {
        return const Color(0xFFEA1369);
      } else if (type == 'fighting') {
        return const Color(0xFFEF6138);
      } else if (type == 'fire') {
        return const Color(0xFFFC4C5A);
      } else if (type == 'flying') {
        return const Color(0xFF93B2C7);
      } else if (type == 'ghost') {
        return const Color(0xFF906790);
      } else if (type == 'grass') {
        return const Color(0xFF27CB4F);
      } else if (type == 'ground') {
        return const Color(0xFF6E491F);
      } else if (type == 'ice') {
        return const Color(0xFFD7F0FA);
      } else if (type == 'normal') {
        return const Color(0xFFC999A7);
      } else if (type == 'poison') {
        return const Color(0xFF9B69D9);
      } else if (type == 'psychic') {
        return const Color(0xFFF71C91);
      } else if (type == 'rock') {
        return const Color(0xFF8B3E21);
      } else if (type == 'steel') {
        return const Color(0xFF42BD94);
      } else if (type == 'water') {
        return const Color(0xFF86A9FA);
      } else {
        return AppColors.lightGreyGreen;
      }
    }

    // scroll controller
    final scrollController = useScrollController();
    final width = MediaQuery.of(context).size.width;

    // function to scroll list item to center
    void scrollToCenter(int index) {
      scrollController.animateTo(
        (index * width) - (width / 2),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    useEffect(() {
      if (scrollController.hasClients) {
        scrollToCenter(tabIndex.value);
      }

      return null;
    }, [tabIndex.value]);

    return Scaffold(
      backgroundColor: pokemonData.when(
        data: (data) {
          return AppColors.background;
        },
        error: (error, stack) {
          return Colors.red[50];
        },
        loading: () {
          return AppColors.background;
        },
      ),
      appBar: AppBar(
        toolbarHeight: 10.h,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: pokemonData.when(data: (data) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  upperCaseFirstLetter(args['name']) ?? 'Pokemon',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  count(data.id),
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          );
        }, error: (error, stack) {
          return Text(
            'Error',
            style: TextStyle(
              color: Colors.red.shade400,
            ),
          );
        }, loading: () {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white30,
            child: Container(
              height: 2.h,
              width: 70.w,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          );
        }),
        leading: IconButton(
          iconSize: 24.sp,
          color: Colors.black87,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: pokemonData.when(
        data: (data) {
          //    list of details to show
          final details = [
            {
              'title': 'Height',
              'value': pokemonData.value?.height,
            },
            {
              'title': 'Weight',
              'value': pokemonData.value?.weight,
            },
            {
              'title': 'Abilities',
              'value': pokemonData.value?.abilities
                  ?.map((e) => e.ability?.name)
                  .toList(),
            },
            {
              'title': 'Types',
              'value':
                  pokemonData.value?.types?.map((e) => e.type?.name).toList(),
            },
          ];
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Hero(
                    tag: '${data.id}',
                    createRectTween: (startR, endR) {
                      startR = Rect.fromLTRB(
                        70.h,
                        50.h,
                        0,
                        0,
                      );
                      return RectTween(
                        begin: startR,
                        end: endR,
                      );
                      // return MaterialRectArcTween(
                      //   begin: Rect.fromLTRB(0, 0, 0, 0),
                      //   end: Rect.fromLTRB(0, 0, 0, 0),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: type(data.types?.first.type?.name),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          data.sprites!.frontDefault!,
                          fit: BoxFit.fill,
                          height: 45.h,
                          width: 90.w,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 90.w,
                  height: 5.h,
                  child: ListView.separated(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 3.w,
                        );
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            tabIndex.value = index;
                          },
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: tabIndex.value == index
                                  ? Colors.black87
                                  : Colors.black54,
                              fontSize: 16.sp,
                              fontWeight: tabIndex.value == index
                                  ? FontWeight.w900
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (tabIndex.value == 0)
                        SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              SizedBox(
                                height: 20.h,
                                width: 100.w,
                                child: Card(
                                  color: type(data.types?.first.type?.name),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      for (var detail in details)
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(detail['title'].toString()),
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      else if (tabIndex.value == 1)
                        SizedBox(
                          height: 1.h,
                        )
                      else if (tabIndex.value == 2)
                        SizedBox(
                          height: 1.h,
                        )
                      else if (tabIndex.value == 3)
                        SizedBox(
                          height: 1.h,
                        )
                      else if (tabIndex.value == 4)
                        SizedBox(
                          height: 1.h,
                        ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return _DetailsPageError(
            error: error,
            id: args['index'].toString(),
          );
        },
        loading: () {
          return const _DetailsPageLoading();
        },
      ),
    );
  }
}

// page to show when pokemon data is loading
class _DetailsPageLoading extends StatelessWidget {
  const _DetailsPageLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1.h,
          ),
          Flexible(
            flex: 4,
            child: Center(
              child: Shimmer.fromColors(
                highlightColor: Colors.white54,
                baseColor: Colors.grey.shade300,
                child: Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: SizedBox(
              height: 5.h,
              width: 90.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List<Widget>.generate(4, (index) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(
                        3.w,
                      ),
                      child: Shimmer.fromColors(
                        highlightColor: Colors.white54,
                        baseColor: Colors.grey.shade300,
                        child: Container(
                          height: 3.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Flexible(
            child: Shimmer.fromColors(
              highlightColor: Colors.white54,
              baseColor: Colors.grey.shade300,
              child: Container(
                // height: 15.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// page to show when pokemon getting pokemon data failed
class _DetailsPageError extends HookConsumerWidget {
  const _DetailsPageError({
    Key? key,
    this.error,
    this.id,
  }) : super(key: key);
  final Object? error;
  final String? id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
//watch providers

    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: SizedBox(
          width: 70.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$error',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.red.shade900,
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.refresh(pokemonDataProvider(id!));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent.shade100,
                ),
                child: Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.red.shade900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
