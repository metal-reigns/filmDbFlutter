import 'package:flutter/material.dart';
import 'package:flutter_application_2/ui/widgets/auth/auth_model.dart';
import 'package:flutter_application_2/ui/widgets/main_screen/main_screen_model.dart';
import 'package:flutter_application_2/ui/widgets/movie_list/movie_list.widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<MainScreenModel>(context);
    print(model);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDb'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          Text(
            'News',
          ),
          MovieListWidget(),
          Text(
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
