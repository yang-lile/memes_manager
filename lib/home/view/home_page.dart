import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memes_manager/home/riverpod/memes_packages_riverpod.dart';
import 'package:memes_manager/home/view/memes_grid_view.dart';
import 'package:memes_manager/memes_package/model/memes_package_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(getMemesPackagesRiverpodProvider);

    return asyncValue.map(
      data: (data) => HomeView(memesPackages: data.value),
      error: (error) => Scaffold(
        body: Text(error.toString()),
      ),
      loading: (loading) => const CircularProgressIndicator.adaptive(),
    );
  }
}

class HomeView extends HookWidget {
  const HomeView({
    required this.memesPackages,
    super.key,
  });
  final List<MemesPackageModel> memesPackages;

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: memesPackages.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, kTextTabBarHeight),
          child: Row(
            children: [
              Expanded(
                child: TabBar(
                  controller: tabController,
                  tabs: [...memesPackages.map((e) => Tab(text: e.packageName))],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          for (final element in memesPackages)
            MemesGridView(memes: element.memes),
        ],
      ),
    );
  }
}
