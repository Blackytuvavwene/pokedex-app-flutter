import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_app_flutter/src/src.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: implement tablet and desktop views
    return const _MobileHomePage();
  }
}

// mobile page view
class _MobileHomePage extends HookConsumerWidget {
  const _MobileHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch providers
    final pokList = ref.watch(pokemonListProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              AppStrings.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            elevation: 0,
            floating: true,
            snap: true,
            pinned: true,
            backgroundColor: const Color(0xFFF5F5F5),
            expandedHeight: 26.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 4.w,
                      right: 2.w,
                    ),
                    child: Text(
                      AppStrings.search,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 9.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search_rounded,
                                  ),
                                ),
                                hintText: AppStrings.searchInput,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 100.h,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: const Color.fromARGB(255, 2, 47, 115),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.tune,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 2.h,
            ),
            sliver: pokList.when(
              data: (data) {
                // var list = data
                //     .map((e) => {
                //           {
                //             'name': e['name'],
                //             'image': e['image'],
                //             'id': e['index'],
                //           }
                //         })
                //     .toList();

                // list.toList();
                return SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.w,
                    crossAxisSpacing: 4.w,
                    childAspectRatio: 0.7,
                    children: [
                      for (var pok in data)
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/details',
                              arguments: pok,
                            );
                          },
                          child: Hero(
                            tag: pok['index'],
                            child: _PokemonCard(
                              index: pok['index'],
                              name: pok['name'],
                              img: pok['image'],
                              pokType: pok['type'],
                            ),
                          ),
                        ),
                    ]);
              },
              error: (error, stack) {
                var data = [0, 1, 2, 3, 4, 5];
                return SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.w,
                    crossAxisSpacing: 4.w,
                    childAspectRatio: 0.7,
                    children: [
                      for (var pok in data)
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/details',
                              arguments: pok,
                            );
                          },
                          child: Shimmer.fromColors(
                            highlightColor: Colors.black,
                            baseColor: Colors.grey.shade500,
                            child: const _PokemonCard(),
                          ),
                        ),
                    ]);
              },
              loading: () {
                var data = [0, 1, 2, 3, 4, 5];
                return SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.w,
                    crossAxisSpacing: 4.w,
                    childAspectRatio: 0.7,
                    children: [
                      for (var pok in data)
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/details',
                              arguments: pok,
                            );
                          },
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white54,
                            baseColor: Colors.grey.shade300,
                            child: const _PokemonCard(),
                          ),
                        ),
                    ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PokemonCard extends HookConsumerWidget {
  const _PokemonCard({
    Key? key,
    this.index,
    this.img,
    this.name,
    this.pokType,
  }) : super(key: key);
  final int? index;
  final String? img;
  final String? name;
  final String? pokType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    Color type(type) {
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

    return Container(
      decoration: BoxDecoration(
        color: type(pokType),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 18.h,
      width: 10.w,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: img != null
                ? Image.network(
                    '$img',
                    height: 100.h,
                    width: 150.w,
                    scale: 0.5,
                  )
                : const SizedBox(),
          ),
          Expanded(
            child: Text(
              upperCaseFirstLetter('$name') ?? '',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 0.1.h,
          ),
          Expanded(
            child: Text(
              count(index) ?? '',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
