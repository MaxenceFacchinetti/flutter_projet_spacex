import 'package:flutter/material.dart';
import 'package:flutter_projet_facchinetti/locator.dart';
import 'api_manager.dart';
import 'package:flutter_projet_facchinetti/lancement.dart';
import 'package:provider/provider.dart';

import 'launch_viewmodel.dart';

class DetailLancementPage extends StatefulWidget {
  DetailLancementPage({Key key, this.title, this.lancementDetail})
      : super(key: key);

  final Lancement lancementDetail;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  String cacatest;

  List<Widget> tabWidget;
  LancementViewModel lancementViewModel = LancementViewModel();

  @override
  _DetailLancementPageState createState() =>
      _DetailLancementPageState(lancementDetail);
}

class _DetailLancementPageState extends State<DetailLancementPage> {
  _DetailLancementPageState(Lancement lancementDetail) {
    this.lancementDetail = lancementDetail;
  }

  Lancement lancementDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Image imageLaunch(String url){
    try{
      return Image.network(url,fit: BoxFit.cover);
    }catch(e){
      return Image.network("https://previews.123rf.com/images/koya79/koya791510/koya79151000606/46059738-bande-dessinée-fusée-vaisseau-spatial.jpg",fit: BoxFit.cover);
    }
  }

  String detailLaunch(String detail){
    if(detail == null){
      return "Pas de détail";
    }
    return detail;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
      title: Text(lancementDetail.name),
    ),
    body: Column(
        children: [
          Container(
            child: imageLaunch(lancementDetail.links.patch.small),
          ),
          Text(lancementDetail.name),
          Text(detailLaunch(lancementDetail.details)),
        ],
      )
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }
}
