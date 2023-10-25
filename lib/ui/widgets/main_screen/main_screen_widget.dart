import 'package:flutter/material.dart';
import 'package:flutter_application_2/library/widgets/inherited/provider.dart';
import 'package:flutter_application_2/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter_application_2/ui/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  final movieListModel = MovieListModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    movieListModel.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDb'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const Text(
            'News',
          ),
          NotifierProvider(
            model: movieListModel,
            child: const MovieListWidget(),
          ),
          const Text(
            'Serials',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Serials'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
