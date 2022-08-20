class HomeModel {
  List<Problems>? problems;

  HomeModel({this.problems});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['problems'] != null) {
      problems = <Problems>[];
      json['problems'].forEach((v) {
        problems!.add(Problems.fromJson(v));
      });
    }
  }
}

class Problems {
  List<Diabetes>? diabetes;
  List<Asthma>? asthma;

  Problems({this.diabetes, this.asthma});

  Problems.fromJson(Map<String, dynamic> json) {
    if (json['Diabetes'] != null) {
      diabetes = <Diabetes>[];
      json['Diabetes'].forEach((v) {
        diabetes!.add(Diabetes.fromJson(v));
      });
    }
    if (json['Asthma'] != null) {
      asthma = <Asthma>[];
      json['Asthma'].forEach((v) {
        asthma!.add(Asthma.fromJson(v));
      });
    }
  }
}

class Diabetes {
  List<Medications>? medications;
  List<Labs>? labs;

  Diabetes({this.medications, this.labs});

  Diabetes.fromJson(Map<String, dynamic> json) {
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(Medications.fromJson(v));
      });
    }
    if (json['labs'] != null) {
      labs = <Labs>[];
      json['labs'].forEach((v) {
        labs!.add(Labs.fromJson(v));
      });
    }
  }
}

class Medications {
  List<MedicationsClasses>? medicationsClasses;

  Medications({this.medicationsClasses});

  Medications.fromJson(Map<String, dynamic> json) {
    if (json['medicationsClasses'] != null) {
      medicationsClasses = <MedicationsClasses>[];
      json['medicationsClasses'].forEach((v) {
        medicationsClasses!.add(MedicationsClasses.fromJson(v));
      });
    }
  }
}

class MedicationsClasses {
  List<ClassName>? className;
  List<ClassName>? className2;

  MedicationsClasses({this.className, this.className2});

  MedicationsClasses.fromJson(Map<String, dynamic> json) {
    if (json['className'] != null) {
      className = <ClassName>[];
      json['className'].forEach((v) {
        className!.add(ClassName.fromJson(v));
      });
    }
    if (json['className2'] != null) {
      className2 = <ClassName>[];
      json['className2'].forEach((v) {
        className2!.add(ClassName.fromJson(v));
      });
    }
  }
}

class ClassName {
  List<AssociatedDrug>? associatedDrug;
  List<AssociatedDrug>? associatedDrug2;

  ClassName({this.associatedDrug, this.associatedDrug2});

  ClassName.fromJson(Map<String, dynamic> json) {
    if (json['associatedDrug'] != null) {
      associatedDrug = <AssociatedDrug>[];
      json['associatedDrug'].forEach((v) {
        associatedDrug!.add(AssociatedDrug.fromJson(v));
      });
    }
    if (json['associatedDrug#2'] != null) {
      associatedDrug2 = <AssociatedDrug>[];
      json['associatedDrug#2'].forEach((v) {
        associatedDrug2!.add(AssociatedDrug.fromJson(v));
      });
    }
  }
}

class AssociatedDrug {
  String? name;
  String? dose;
  String? strength;

  AssociatedDrug({this.name, this.dose, this.strength});

  AssociatedDrug.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dose = json['dose'];
    strength = json['strength'];
  }
}

class Labs {
  String? missingField;

  Labs({this.missingField});

  Labs.fromJson(Map<String, dynamic> json) {
    missingField = json['missing_field'];
  }
}

class Asthma {
  Asthma.fromJson(Map<String, dynamic> json) {}
}
