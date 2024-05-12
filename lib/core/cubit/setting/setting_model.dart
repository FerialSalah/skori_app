class SettingModel {
  App? app;
  Contacts? contacts;
  Apps? apps;

  SettingModel({this.app, this.contacts, this.apps});

  SettingModel.fromJson(Map<String, dynamic> json) {
    app = json['app'] != null ? new App.fromJson(json['app']) : null;
    contacts = json['contacts'] != null
        ? new Contacts.fromJson(json['contacts'])
        : null;
    apps = json['apps'] != null ? new Apps.fromJson(json['apps']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.app != null) {
      data['app'] = this.app!.toJson();
    }
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.toJson();
    }
    if (this.apps != null) {
      data['apps'] = this.apps!.toJson();
    }
    return data;
  }
}

class App {
  String? name;
  String? copyright;
  String? logo;
  String? about;
  String? terms;
  String? footerContent;

  App(
      {this.name,
        this.copyright,
        this.logo,
        this.about,
        this.terms,
        this.footerContent});

  App.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    copyright = json['copyright'];
    logo = json['logo'];
    about = json['about'];
    terms = json['terms'];
    footerContent = json['footer_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['copyright'] = this.copyright;
    data['logo'] = this.logo;
    data['about'] = this.about;
    data['terms'] = this.terms;
    data['footer_content'] = this.footerContent;
    return data;
  }
}

class Contacts {
  String? facebook;
  String? instagram;
  String? snapchat;
  String? twitter;
  String? phone;
   String? subscribtionPhone;
  String? email;

  Contacts(
      {this.facebook,
        this.instagram,
        this.snapchat,
        this.twitter,
        this.phone,
        this.subscribtionPhone,
        this.email});

  Contacts.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    snapchat = json['snapchat'];
    twitter = json['twitter'];
    phone = json['phone'];
    subscribtionPhone=json['subscribtion_phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['snapchat'] = this.snapchat;
    data['twitter'] = this.twitter;
    data['phone'] = this.phone;
    data['subscribtion_phone']=this.subscribtionPhone;
    data['email'] = this.email;
    return data;
  }
}

class Apps {
  String? apple;
  String? android;

  Apps({this.apple, this.android});

  Apps.fromJson(Map<String, dynamic> json) {
    apple = json['apple'];
    android = json['android'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apple'] = this.apple;
    data['android'] = this.android;
    return data;
  }
}
