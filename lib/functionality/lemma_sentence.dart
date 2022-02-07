import 'package:flutter/services.dart';
import 'package:lemmatizer/lemmatizer.dart';

class Lemmatization{
  List sw_list;

  Lemmatization() {
    _loadstopwords();
  }

  final sw_file = 'stopwords.txt';
  List lemmalist = [];
  Lemmatizer lemmatizer = new Lemmatizer();

  String tolemma(String input){
    List stringlist = input.split(" ");
    for(String word in stringlist){
      if(sw_list.contains(word)){
        stringlist.remove(word);
      }
    }
    for (String word in stringlist){
      lemmalist.add(lemmatizer.lemma(word));
    }
    String lemma_string = lemmalist.join(' ');
    return lemma_string;
  }

  void _loadstopwords() async{
    final stop_words = await rootBundle.loadString('assets/$sw_file');
    print(stop_words);
    final sw = stop_words.split(',');
    print(sw);
    sw_list = sw;
  }

}