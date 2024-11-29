class Recipes {
  Recipes({
    required this.COOKRCP02,
  });
  late final COOKRCP01 COOKRCP02;
  
  Recipes.fromJson(Map<String, dynamic> json){
    COOKRCP02 = COOKRCP01.fromJson(json['COOKRCP01']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['COOKRCP01'] = COOKRCP02.toJson();
    return _data;
  }
}

class COOKRCP01 {
  late final String totalCount;
  late final List<Row> row;
  late final RESULT RESULT2;
  COOKRCP01({
    required this.totalCount,
    required this.row,
    required this.RESULT2,
  });
  
  COOKRCP01.fromJson(Map<String, dynamic> json){
    totalCount = json['total_count'];
    row = List.from(json['row']).map((e)=>Row.fromJson(e)).toList();
    RESULT2 = RESULT.fromJson(json['RESULT']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['row'] = row.map((e)=>e.toJson()).toList();
    _data['RESULT'] = RESULT2.toJson();
    return _data;
  }
}

class Row {
  Row({
    required this.RCPPARTSDTLS,
    required this.RCPWAY2,
    required this.MANUALIMG20,
    required this.MANUAL20,
    required this.RCPSEQ,
    required this.INFONA,
    required this.INFOWGT,
    required this.INFOPRO,
    required this.MANUALIMG13,
    required this.MANUALIMG14,
    required this.MANUALIMG15,
    required this.MANUALIMG16,
    required this.MANUALIMG10,
    required this.MANUALIMG11,
    required this.MANUALIMG12,
    required this.MANUALIMG17,
    required this.MANUALIMG18,
    required this.MANUALIMG19,
    required this.INFOFAT,
    required this.HASHTAG,
    required this.MANUALIMG02,
    required this.MANUALIMG03,
    required this.RCPPAT2,
    required this.MANUALIMG04,
    required this.MANUALIMG05,
    required this.MANUALIMG01,
    required this.MANUAL01,
    required this.ATTFILENOMK,
    required this.MANUALIMG06,
    required this.MANUALIMG07,
    required this.MANUALIMG08,
    required this.MANUALIMG09,
    required this.MANUAL08,
    required this.MANUAL09,
    required this.MANUAL06,
    required this.MANUAL07,
    required this.MANUAL04,
    required this.MANUAL05,
    required this.MANUAL02,
    required this.MANUAL03,
    required this.ATTFILENOMAIN,
    required this.MANUAL11,
    required this.MANUAL12,
    required this.MANUAL10,
    required this.INFOCAR,
    required this.MANUAL19,
    required this.INFOENG,
    required this.MANUAL17,
    required this.MANUAL18,
    required this.RCPNM,
    required this.MANUAL15,
    required this.MANUAL16,
    required this.MANUAL13,
    required this.MANUAL14,
  });
  late final String RCPPARTSDTLS;
  late final String RCPWAY2;
  late final String MANUALIMG20;
  late final String MANUAL20;
  late final String RCPSEQ;
  late final String INFONA;
  late final String INFOWGT;
  late final String INFOPRO;
  late final String MANUALIMG13;
  late final String MANUALIMG14;
  late final String MANUALIMG15;
  late final String MANUALIMG16;
  late final String MANUALIMG10;
  late final String MANUALIMG11;
  late final String MANUALIMG12;
  late final String MANUALIMG17;
  late final String MANUALIMG18;
  late final String MANUALIMG19;
  late final String INFOFAT;
  late final String HASHTAG;
  late final String MANUALIMG02;
  late final String MANUALIMG03;
  late final String RCPPAT2;
  late final String MANUALIMG04;
  late final String MANUALIMG05;
  late final String MANUALIMG01;
  late final String MANUAL01;
  late final String ATTFILENOMK;
  late final String MANUALIMG06;
  late final String MANUALIMG07;
  late final String MANUALIMG08;
  late final String MANUALIMG09;
  late final String MANUAL08;
  late final String MANUAL09;
  late final String MANUAL06;
  late final String MANUAL07;
  late final String MANUAL04;
  late final String MANUAL05;
  late final String MANUAL02;
  late final String MANUAL03;
  late final String ATTFILENOMAIN;
  late final String MANUAL11;
  late final String MANUAL12;
  late final String MANUAL10;
  late final String INFOCAR;
  late final String MANUAL19;
  late final String INFOENG;
  late final String MANUAL17;
  late final String MANUAL18;
  late final String RCPNM;
  late final String MANUAL15;
  late final String MANUAL16;
  late final String MANUAL13;
  late final String MANUAL14;
  
  Row.fromJson(Map<String, dynamic> json){
    RCPPARTSDTLS = json['RCP_PARTS_DTLS'];
    RCPWAY2 = json['RCP_WAY2'];
    MANUALIMG20 = json['MANUAL_IMG20'];
    MANUAL20 = json['MANUAL20'];
    RCPSEQ = json['RCP_SEQ'];
    INFONA = json['INFO_NA'];
    INFOWGT = json['INFO_WGT'];
    INFOPRO = json['INFO_PRO'];
    MANUALIMG13 = json['MANUAL_IMG13'];
    MANUALIMG14 = json['MANUAL_IMG14'];
    MANUALIMG15 = json['MANUAL_IMG15'];
    MANUALIMG16 = json['MANUAL_IMG16'];
    MANUALIMG10 = json['MANUAL_IMG10'];
    MANUALIMG11 = json['MANUAL_IMG11'];
    MANUALIMG12 = json['MANUAL_IMG12'];
    MANUALIMG17 = json['MANUAL_IMG17'];
    MANUALIMG18 = json['MANUAL_IMG18'];
    MANUALIMG19 = json['MANUAL_IMG19'];
    INFOFAT = json['INFO_FAT'];
    HASHTAG = json['HASH_TAG'];
    MANUALIMG02 = json['MANUAL_IMG02'];
    MANUALIMG03 = json['MANUAL_IMG03'];
    RCPPAT2 = json['RCP_PAT2'];
    MANUALIMG04 = json['MANUAL_IMG04'];
    MANUALIMG05 = json['MANUAL_IMG05'];
    MANUALIMG01 = json['MANUAL_IMG01'];
    MANUAL01 = json['MANUAL01'];
    ATTFILENOMK = json['ATT_FILE_NO_MK'];
    MANUALIMG06 = json['MANUAL_IMG06'];
    MANUALIMG07 = json['MANUAL_IMG07'];
    MANUALIMG08 = json['MANUAL_IMG08'];
    MANUALIMG09 = json['MANUAL_IMG09'];
    MANUAL08 = json['MANUAL08'];
    MANUAL09 = json['MANUAL09'];
    MANUAL06 = json['MANUAL06'];
    MANUAL07 = json['MANUAL07'];
    MANUAL04 = json['MANUAL04'];
    MANUAL05 = json['MANUAL05'];
    MANUAL02 = json['MANUAL02'];
    MANUAL03 = json['MANUAL03'];
    ATTFILENOMAIN = json['ATT_FILE_NO_MAIN'];
    MANUAL11 = json['MANUAL11'];
    MANUAL12 = json['MANUAL12'];
    MANUAL10 = json['MANUAL10'];
    INFOCAR = json['INFO_CAR'];
    MANUAL19 = json['MANUAL19'];
    INFOENG = json['INFO_ENG'];
    MANUAL17 = json['MANUAL17'];
    MANUAL18 = json['MANUAL18'];
    RCPNM = json['RCP_NM'];
    MANUAL15 = json['MANUAL15'];
    MANUAL16 = json['MANUAL16'];
    MANUAL13 = json['MANUAL13'];
    MANUAL14 = json['MANUAL14'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['RCP_PARTS_DTLS'] = RCPPARTSDTLS;
    _data['RCP_WAY2'] = RCPWAY2;
    _data['MANUAL_IMG20'] = MANUALIMG20;
    _data['MANUAL20'] = MANUAL20;
    _data['RCP_SEQ'] = RCPSEQ;
    _data['INFO_NA'] = INFONA;
    _data['INFO_WGT'] = INFOWGT;
    _data['INFO_PRO'] = INFOPRO;
    _data['MANUAL_IMG13'] = MANUALIMG13;
    _data['MANUAL_IMG14'] = MANUALIMG14;
    _data['MANUAL_IMG15'] = MANUALIMG15;
    _data['MANUAL_IMG16'] = MANUALIMG16;
    _data['MANUAL_IMG10'] = MANUALIMG10;
    _data['MANUAL_IMG11'] = MANUALIMG11;
    _data['MANUAL_IMG12'] = MANUALIMG12;
    _data['MANUAL_IMG17'] = MANUALIMG17;
    _data['MANUAL_IMG18'] = MANUALIMG18;
    _data['MANUAL_IMG19'] = MANUALIMG19;
    _data['INFO_FAT'] = INFOFAT;
    _data['HASH_TAG'] = HASHTAG;
    _data['MANUAL_IMG02'] = MANUALIMG02;
    _data['MANUAL_IMG03'] = MANUALIMG03;
    _data['RCP_PAT2'] = RCPPAT2;
    _data['MANUAL_IMG04'] = MANUALIMG04;
    _data['MANUAL_IMG05'] = MANUALIMG05;
    _data['MANUAL_IMG01'] = MANUALIMG01;
    _data['MANUAL01'] = MANUAL01;
    _data['ATT_FILE_NO_MK'] = ATTFILENOMK;
    _data['MANUAL_IMG06'] = MANUALIMG06;
    _data['MANUAL_IMG07'] = MANUALIMG07;
    _data['MANUAL_IMG08'] = MANUALIMG08;
    _data['MANUAL_IMG09'] = MANUALIMG09;
    _data['MANUAL08'] = MANUAL08;
    _data['MANUAL09'] = MANUAL09;
    _data['MANUAL06'] = MANUAL06;
    _data['MANUAL07'] = MANUAL07;
    _data['MANUAL04'] = MANUAL04;
    _data['MANUAL05'] = MANUAL05;
    _data['MANUAL02'] = MANUAL02;
    _data['MANUAL03'] = MANUAL03;
    _data['ATT_FILE_NO_MAIN'] = ATTFILENOMAIN;
    _data['MANUAL11'] = MANUAL11;
    _data['MANUAL12'] = MANUAL12;
    _data['MANUAL10'] = MANUAL10;
    _data['INFO_CAR'] = INFOCAR;
    _data['MANUAL19'] = MANUAL19;
    _data['INFO_ENG'] = INFOENG;
    _data['MANUAL17'] = MANUAL17;
    _data['MANUAL18'] = MANUAL18;
    _data['RCP_NM'] = RCPNM;
    _data['MANUAL15'] = MANUAL15;
    _data['MANUAL16'] = MANUAL16;
    _data['MANUAL13'] = MANUAL13;
    _data['MANUAL14'] = MANUAL14;
    return _data;
  }



  dynamic get(String propertyName){
    var _mapRep = toJson();
    if(_mapRep.containsKey(propertyName)){
      return _mapRep[propertyName];
    }

  }

}

class RESULT {
  RESULT({
    required this.MSG,
    required this.CODE,
  });
  late final String MSG;
  late final String CODE;
  
  RESULT.fromJson(Map<String, dynamic> json){
    MSG = json['MSG'];
    CODE = json['CODE'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MSG'] = MSG;
    _data['CODE'] = CODE;
    return _data;
  }
}