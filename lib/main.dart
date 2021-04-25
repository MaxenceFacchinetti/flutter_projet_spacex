import 'package:flutter/material.dart';
import 'package:flutter_projet_facchinetti/locator.dart';
import 'api_manager.dart';
import 'package:flutter_projet_facchinetti/lancement.dart';
import 'package:provider/provider.dart';

import 'detail_lancement.dart';
import 'launch_viewmodel.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projet Lancements Space X',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Projet Lancements Space X'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  LancementViewModel lancementViewModel = LancementViewModel();
  List<Lancement> listLancements;

  int _currentIndex = 0;



  screenLancementsHistorique(LancementViewModel model){
    model.loadDataHisotorique();
    return Center(
      child:ListView.builder(

          itemBuilder: (context, position) {
            return ListTile(
                title: Text(model.historiqueLancements[position].name),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailLancementPage(lancementDetail: model.historiqueLancements[position])));
                }
            );
          },
          itemCount: model.lancements.length)
    );
  }

  screenLancementsUpcoming(LancementViewModel model){
    model.loadData();
    return Center(
      child: ListView.builder(

          itemBuilder: (context, position) {
            return ListTile(
                title: Text(model.lancements[position].name),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailLancementPage(lancementDetail: model.lancements[position])));
                }
            );
          },
          itemCount: model.lancements.length)
    );
  }

  List<Widget> screensWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screensWidget = [screenLancementsHistorique(lancementViewModel), screenLancementsUpcoming(lancementViewModel)];
  }


  Image imageLaunch(String url){
    try{
      return Image.network(url,fit: BoxFit.cover);
    }catch(e){
      return Image.network("https://previews.123rf.com/images/koya79/koya791510/koya79151000606/46059738-bande-dessinée-fusée-vaisseau-spatial.jpg",fit: BoxFit.cover);
    }
  }

  Widget listLaunch(LancementViewModel model){

    List<Lancement> lancements;

    if(_currentIndex == 0){
      lancements = model.lancements;
    }
    else{
      lancements = model.historiqueLancements;
    }

    return ListView.builder(

        itemBuilder: (context, position) {
      return ListTile(
          title: Text(lancements[position].name),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 44,
              maxWidth: 44,
              maxHeight: 44,
            ),
            child: imageLaunch(lancements[position].links.patch.small),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailLancementPage(lancementDetail: lancements[position])));
          }
      );
    },
    itemCount: model.lancements.length,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ChangeNotifierProvider(
      create: (_) => new LancementViewModel(),
      child: Consumer<LancementViewModel>(
        builder: (context, LancementViewModel model, child) => Scaffold(
          appBar: AppBar(
            title: Text("Projet Flutter Space X"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: "Futurs lancements",
                activeIcon: Icon(
                  Icons.looks_one,
                  color: Colors.blue,
                ),
                icon: Icon(Icons.looks_one),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.looks_two),
                  label: "Historique",
                  activeIcon: Icon(
                      Icons.looks_two,
                      color:Colors.blue
                  )
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (newIndex){
              setState(() {
                _currentIndex=newIndex;
              });
            },
          ),

          body: model.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : listLaunch(model)





          /*model.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView.builder(

            itemBuilder: (context, position) {
              return ListTile(
                title: Text(model.lancements[position].name),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailLancementPage(lancementDetail: model.lancements[position])));
                }
              );
            },
            itemCount: model.lancements.length,
*/
          ),
        ),
      );

  }
}
