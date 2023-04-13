class ComputationalHelper{
static String generateText({required int index, required List<dynamic>lookupData,}){
  late String text;
  for(var i in lookupData){
    if(i['index'] == index){
      text = (i['confidence']*100).toStringAsFixed(1);
      break;
    }
    else{ text = '0';}
    
  }
return '$text%';
}
static double generatePercentage({required int index, required List<dynamic>lookupData,}){
  late double per;
  for(var i in lookupData){
    if(i['index'] == index){
      per = i['confidence'];
      break;
    }
    else{ per = 0;}
    
  }
return per;
}

static double generateGraphPercentage({required int index, required List<dynamic>lookupData,}){
  late double per;
  for(var i in lookupData){
    if(i['index'] == index){
      per = (i['confidence']*100).truncateToDouble();
      break;
    }
    else{ per = 0;}
    
  }
return per;
}
}