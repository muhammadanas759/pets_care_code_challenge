import 'package:code_challenge/app/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/widget.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return Scaffold(
      appBar: AppBar(title: Text('Carousels')),
      body: Column(
        children: [
          SearchItem(
            onSearch: (query) {
              context.read<HomeBloc>().add(SearchQueryChanged(query));
            },
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is HomeLoaded) {
                  return Directionality(
                    textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                    child: ListView(
                      children: state.groupedItems.entries.map((entry) {
                        return Carousel(
                          title: entry.key,
                          items: entry.value,
                        );
                      }).toList(),
                    ),
                  );
                }
                return Center(child: Text('Enter a search query'));
              },
            ),
          ),
        ],
      ),
    );
  }
}

