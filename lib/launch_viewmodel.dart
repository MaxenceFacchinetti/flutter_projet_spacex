import 'package:flutter/material.dart';
import 'package:flutter_projet_facchinetti/api_manager.dart';
import 'detail_lancement.dart';
import 'locator.dart';

import 'lancement.dart';

class LancementViewModel extends ChangeNotifier {
  ApiManager api = locator<ApiManager>();

  List<Lancement> lancements = [];
  Lancement lancementDetail;
  List<Lancement> historiqueLancements = [];

  // The view is loading by default, waiting for API call to succeed
  bool isLoading = true;

  LancementViewModel() {
    loadData();
    loadDataHisotorique();
  }

  List<Widget> screensWidget;

  screenLancementsHistorique(){
    return Center(
        child:ListView.builder(

            itemBuilder: (context, position) {
              return ListTile(
                  title: Text(historiqueLancements[position].name),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailLancementPage(lancementDetail: historiqueLancements[position])));
                  }
              );
            },
            itemCount: historiqueLancements.length)
    );
  }

  screenLancementsUpcoming(){
    return Center(
        child: ListView.builder(

            itemBuilder: (context, position) {
              return ListTile(
                  title: Text(lancements[position].name),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailLancementPage(lancementDetail: lancements[position])));
                  }
              );
            },
            itemCount: lancements.length)
    );
  }

  void loadData() async {
    try {
      var response = await api.getLancements();
      lancements.addAll(List<Lancement>.from(
          response.data.map((item) => Lancement.fromJson(item))));
      screensWidget.add(screenLancementsUpcoming());
    } catch (error, stackTrace) {
      print(stackTrace);
    }
    isLoading = false;
    notifyListeners();
  }

  void loadDataHisotorique() async {
    try {
      var response = await api.getLancementsHistorique();
      historiqueLancements.addAll(List<Lancement>.from(
          response.data.map((item) => Lancement.fromJson(item))));
      screensWidget.add(screenLancementsHistorique());
    } catch (error, stackTrace) {
      print(stackTrace);
    }
    isLoading = false;
    notifyListeners();
  }

}