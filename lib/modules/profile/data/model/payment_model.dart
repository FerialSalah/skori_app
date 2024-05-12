class PaymentModel {
  String? id;
  String? object;
  bool? liveMode;
  bool? customerInitiated;
  String? apiVersion;
  String? method;
  String? status;
  int? amount;
  String? currency;
  bool? threeDSecure;
  bool? cardThreeDSecure;
  bool? saveCard;
  String? product;
  List<Null>? order;
  Transaction? transaction;
  Response? response;
  Receipt? receipt;
  Customer? customer;
  Merchant? merchant;
  Source? source;
  Redirect? redirect;
  List<Activities>? activities;
  bool? autoReversed;

  PaymentModel(
      {this.id,
        this.object,
        this.liveMode,
        this.customerInitiated,
        this.apiVersion,
        this.method,
        this.status,
        this.amount,
        this.currency,
        this.threeDSecure,
        this.cardThreeDSecure,
        this.saveCard,
        this.product,
        this.order,
        this.transaction,
        this.response,
        this.receipt,
        this.customer,
        this.merchant,
        this.source,
        this.redirect,
        this.activities,
        this.autoReversed});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    liveMode = json['live_mode'];
    customerInitiated = json['customer_initiated'];
    apiVersion = json['api_version'];
    method = json['method'];
    status = json['status'];
    amount = json['amount'];
    currency = json['currency'];
    threeDSecure = json['threeDSecure'];
    cardThreeDSecure = json['card_threeDSecure'];
    saveCard = json['save_card'];
    product = json['product'];
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    receipt =
    json['receipt'] != null ? new Receipt.fromJson(json['receipt']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    redirect = json['redirect'] != null
        ? new Redirect.fromJson(json['redirect'])
        : null;
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
    autoReversed = json['auto_reversed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['live_mode'] = this.liveMode;
    data['customer_initiated'] = this.customerInitiated;
    data['api_version'] = this.apiVersion;
    data['method'] = this.method;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['threeDSecure'] = this.threeDSecure;
    data['card_threeDSecure'] = this.cardThreeDSecure;
    data['save_card'] = this.saveCard;
    data['product'] = this.product;
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    if (this.receipt != null) {
      data['receipt'] = this.receipt!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.merchant != null) {
      data['merchant'] = this.merchant!.toJson();
    }
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.redirect != null) {
      data['redirect'] = this.redirect!.toJson();
    }
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    data['auto_reversed'] = this.autoReversed;
    return data;
  }
}

class Transaction {
  String? timezone;
  String? created;
  String? url;
  Expiry? expiry;
  bool? asynchronous;
  int? amount;
  String? currency;

  Transaction(
      {this.timezone,
        this.created,
        this.url,
        this.expiry,
        this.asynchronous,
        this.amount,
        this.currency});

  Transaction.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    created = json['created'];
    url = json['url'];
    expiry =
    json['expiry'] != null ? new Expiry.fromJson(json['expiry']) : null;
    asynchronous = json['asynchronous'];
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timezone'] = this.timezone;
    data['created'] = this.created;
    data['url'] = this.url;
    if (this.expiry != null) {
      data['expiry'] = this.expiry!.toJson();
    }
    data['asynchronous'] = this.asynchronous;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class Expiry {
  int? period;
  String? type;

  Expiry({this.period, this.type});

  Expiry.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['period'] = this.period;
    data['type'] = this.type;
    return data;
  }
}

class Response {
  String? code;
  String? message;

  Response({this.code, this.message});

  Response.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Receipt {
  bool? email;
  bool? sms;

  Receipt({this.email, this.sms});

  Receipt.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    sms = json['sms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['sms'] = this.sms;
    return data;
  }
}

class Customer {
  String? firstName;
  String? lastName;
  String? email;
  Phone? phone;

  Customer({this.firstName, this.lastName, this.email, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'] != null ? new Phone.fromJson(json['phone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    if (this.phone != null) {
      data['phone'] = this.phone!.toJson();
    }
    return data;
  }
}

class Phone {
  String? countryCode;
  String? number;

  Phone({this.countryCode, this.number});

  Phone.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['number'] = this.number;
    return data;
  }
}

class Merchant {
  String? id;

  Merchant({this.id});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Source {
  String? object;
  String? id;

  Source({this.object, this.id});

  Source.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['id'] = this.id;
    return data;
  }
}

class Redirect {
  String? status;
  String? url;

  Redirect({this.status, this.url});

  Redirect.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['url'] = this.url;
    return data;
  }
}

class Activities {
  String? id;
  String? object;
  int? created;
  String? status;
  String? currency;
  int? amount;
  String? remarks;

  Activities(
      {this.id,
        this.object,
        this.created,
        this.status,
        this.currency,
        this.amount,
        this.remarks});

  Activities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    status = json['status'];
    currency = json['currency'];
    amount = json['amount'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    data['remarks'] = this.remarks;
    return data;
  }
}
