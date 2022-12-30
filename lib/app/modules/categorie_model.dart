import 'dart:convert';

CategorieModel categorieModelFromJson(String str) => CategorieModel.fromJson(json.decode(str));
String categorieModelToJson(CategorieModel data) => json.encode(data.toJson());
class CategorieModel {
  List<Reponses>? reponses;

  CategorieModel({this.reponses});

  CategorieModel.fromJson(Map<String, dynamic> json) {
    if (json['reponses'] != null) {
      reponses = <Reponses>[];
      json['reponses'].forEach((v) {
        reponses!.add(new Reponses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reponses != null) {
      data['reponses'] = this.reponses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reponses {
  String? inuminfo;
  String? c3Support;
  String? inbrang;
  String? inbpagereelle;
  String? iindconf;
  String? inivconf;
  Null? c3Cloison;
  String? iattente;
  String? inumranggarde;
  String? inbranggarde;
  String? inumdocactuel;
  String? inumdocprec;
  String? inumdocsuiv;
  String? istatut;
  String? itimelastmodifdoc;
  String? iindrevision;
  String? idocselecte;
  String? ivalsupport0;
  String? ivalsupport1;
  String? ivalsupport2;
  String? ivalsupport3;
  String? ivalsupport4;
  String? iD;
  String? sLU;
  String? cRE;
  Null? uPD;
  String? lEN;
  String? lFR;
  String? sTT;
  Null? aVU;
  Null? aSU;
  Null? aMO;
  String? pST;
  String? iCA;
  String? cOD;
  String? dEL;

  Reponses(
      {this.inuminfo,
        this.c3Support,
        this.inbrang,
        this.inbpagereelle,
        this.iindconf,
        this.inivconf,
        this.c3Cloison,
        this.iattente,
        this.inumranggarde,
        this.inbranggarde,
        this.inumdocactuel,
        this.inumdocprec,
        this.inumdocsuiv,
        this.istatut,
        this.itimelastmodifdoc,
        this.iindrevision,
        this.idocselecte,
        this.ivalsupport0,
        this.ivalsupport1,
        this.ivalsupport2,
        this.ivalsupport3,
        this.ivalsupport4,
        this.iD,
        this.sLU,
        this.cRE,
        this.uPD,
        this.lEN,
        this.lFR,
        this.sTT,
        this.aVU,
        this.aSU,
        this.aMO,
        this.pST,
        this.iCA,
        this.cOD,
        this.dEL});

  Reponses.fromJson(Map<String, dynamic> json) {
    inuminfo = json['inuminfo'];
    c3Support = json['c3_support'];
    inbrang = json['inbrang'];
    inbpagereelle = json['inbpagereelle'];
    iindconf = json['iindconf'];
    inivconf = json['inivconf'];
    c3Cloison = json['c3_cloison'];
    iattente = json['iattente'];
    inumranggarde = json['inumranggarde'];
    inbranggarde = json['inbranggarde'];
    inumdocactuel = json['inumdocactuel'];
    inumdocprec = json['inumdocprec'];
    inumdocsuiv = json['inumdocsuiv'];
    istatut = json['istatut'];
    itimelastmodifdoc = json['itimelastmodifdoc'];
    iindrevision = json['iindrevision'];
    idocselecte = json['idocselecte'];
    ivalsupport0 = json['ivalsupport0'];
    ivalsupport1 = json['ivalsupport1'];
    ivalsupport2 = json['ivalsupport2'];
    ivalsupport3 = json['ivalsupport3'];
    ivalsupport4 = json['ivalsupport4'];
    iD = json['ID'];
    sLU = json['SLU'];
    cRE = json['CRE'];
    uPD = json['UPD'];
    lEN = json['LEN'];
    lFR = json['LFR'];
    sTT = json['STT'];
    aVU = json['AVU'];
    aSU = json['ASU'];
    aMO = json['AMO'];
    pST = json['PST'];
    iCA = json['ICA'];
    cOD = json['COD'];
    dEL = json['DEL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inuminfo'] = this.inuminfo;
    data['c3_support'] = this.c3Support;
    data['inbrang'] = this.inbrang;
    data['inbpagereelle'] = this.inbpagereelle;
    data['iindconf'] = this.iindconf;
    data['inivconf'] = this.inivconf;
    data['c3_cloison'] = this.c3Cloison;
    data['iattente'] = this.iattente;
    data['inumranggarde'] = this.inumranggarde;
    data['inbranggarde'] = this.inbranggarde;
    data['inumdocactuel'] = this.inumdocactuel;
    data['inumdocprec'] = this.inumdocprec;
    data['inumdocsuiv'] = this.inumdocsuiv;
    data['istatut'] = this.istatut;
    data['itimelastmodifdoc'] = this.itimelastmodifdoc;
    data['iindrevision'] = this.iindrevision;
    data['idocselecte'] = this.idocselecte;
    data['ivalsupport0'] = this.ivalsupport0;
    data['ivalsupport1'] = this.ivalsupport1;
    data['ivalsupport2'] = this.ivalsupport2;
    data['ivalsupport3'] = this.ivalsupport3;
    data['ivalsupport4'] = this.ivalsupport4;
    data['ID'] = this.iD;
    data['SLU'] = this.sLU;
    data['CRE'] = this.cRE;
    data['UPD'] = this.uPD;
    data['LEN'] = this.lEN;
    data['LFR'] = this.lFR;
    data['STT'] = this.sTT;
    data['AVU'] = this.aVU;
    data['ASU'] = this.aSU;
    data['AMO'] = this.aMO;
    data['PST'] = this.pST;
    data['ICA'] = this.iCA;
    data['COD'] = this.cOD;
    data['DEL'] = this.dEL;
    return data;
  }
}