import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_app_flutter/src/src.dart';
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
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4.w,
              crossAxisSpacing: 4.w,
              childAspectRatio: 0.7,
              children: List.generate(
                20,
                (index) => _PokemonCard(
                  index: index,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PokemonCard extends HookConsumerWidget {
  const _PokemonCard({Key? key, this.index}) : super(key: key);
  final int? index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 18.h,
      width: 10.w,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
