// To parse this JSON data, do
//
//     final books = booksFromMap(jsonString);
// ignore_for_file: unnecessary_null_comparison, constant_identifier_names, prefer_null_aware_operators, prefer_if_null_operators, unnecessary_new

import 'dart:convert';

class BooksModel {
  BooksModel({
    this.id,
    required this.kind,
    required this.totalItems,
    this.items,
  });

  String? id;
  String kind;
  int totalItems;
  List<Book>? items;

  factory BooksModel.fromJson(String str) => BooksModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BooksModel.fromMap(Map<String, dynamic> json) => BooksModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Book>.from(json["items"].map((x) => Book.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Book {
  Book({
    this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  Kind? kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        kind: kindValues.map[json["kind"]],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromMap(json["volumeInfo"]),
        saleInfo: SaleInfo.fromMap(json["saleInfo"]),
        accessInfo: AccessInfo.fromMap(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null
            ? null
            : SearchInfo.fromMap(json["searchInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo!.toMap(),
        "saleInfo": saleInfo!.toMap(),
        "accessInfo": accessInfo!.toMap(),
        "searchInfo": searchInfo == null ? null : searchInfo!.toMap(),
      };
}

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    required this.embeddable,
    required this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  Country? country;
  Viewability? viewability;
  bool embeddable;
  bool publicDomain;
  TextToSpeechPermission? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  AccessViewStatus? accessViewStatus;
  bool quoteSharingAllowed;

  factory AccessInfo.fromJson(String str) =>
      AccessInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccessInfo.fromMap(Map<String, dynamic> json) => AccessInfo(
        country: countryValues.map[json["country"]],
        viewability: viewabilityValues.map[json["viewability"]],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission:
            textToSpeechPermissionValues.map[json["textToSpeechPermission"]],
        epub: Epub.fromMap(json["epub"]),
        pdf: Epub.fromMap(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toMap() => {
        "country": countryValues.reverse[country],
        "viewability": viewabilityValues.reverse[viewability],
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission":
            textToSpeechPermissionValues.reverse[textToSpeechPermission],
        "epub": epub!.toMap(),
        "pdf": pdf!.toMap(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

enum AccessViewStatus { SAMPLE, NONE, FULL_PUBLIC_DOMAIN }

final accessViewStatusValues = EnumValues({
  "FULL_PUBLIC_DOMAIN": AccessViewStatus.FULL_PUBLIC_DOMAIN,
  "NONE": AccessViewStatus.NONE,
  "SAMPLE": AccessViewStatus.SAMPLE
});

enum Country { US }

final countryValues = EnumValues({"US": Country.US});

class Epub {
  Epub({
    this.isAvailable,
    required this.acsTokenLink,
    required this.downloadLink,
  });

  bool? isAvailable;
  String? acsTokenLink;
  String? downloadLink;

  factory Epub.fromJson(String str) => Epub.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Epub.fromMap(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink:
            json["acsTokenLink"] == null ? null : json["acsTokenLink"],
        downloadLink:
            json["downloadLink"] == null ? null : json["downloadLink"],
      );

  Map<String, dynamic> toMap() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink == null ? null : acsTokenLink,
        "downloadLink": downloadLink == null ? null : downloadLink,
      };
}

enum TextToSpeechPermission { ALLOWED_FOR_ACCESSIBILITY, ALLOWED }

final textToSpeechPermissionValues = EnumValues({
  "ALLOWED": TextToSpeechPermission.ALLOWED,
  "ALLOWED_FOR_ACCESSIBILITY": TextToSpeechPermission.ALLOWED_FOR_ACCESSIBILITY
});

enum Viewability { PARTIAL, NO_PAGES, ALL_PAGES }

final viewabilityValues = EnumValues({
  "ALL_PAGES": Viewability.ALL_PAGES,
  "NO_PAGES": Viewability.NO_PAGES,
  "PARTIAL": Viewability.PARTIAL
});

enum Kind { BOOKS_VOLUME }

final kindValues = EnumValues({"books#volume": Kind.BOOKS_VOLUME});

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    required this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  Country? country;
  Saleability? saleability;
  bool isEbook;
  SaleInfoListPrice? listPrice;
  SaleInfoListPrice? retailPrice;
  String? buyLink;
  List<Offer>? offers;

  factory SaleInfo.fromJson(String str) => SaleInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaleInfo.fromMap(Map<String, dynamic> json) => SaleInfo(
        country: countryValues.map[json["country"]],
        saleability: saleabilityValues.map[json["saleability"]],
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null
            ? null
            : SaleInfoListPrice.fromMap(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : SaleInfoListPrice.fromMap(json["retailPrice"]),
        buyLink: json["buyLink"] == null ? null : json["buyLink"],
        offers: json["offers"] == null
            ? null
            : List<Offer>.from(json["offers"].map((x) => Offer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
        "listPrice": listPrice == null ? null : listPrice!.toMap(),
        "retailPrice": retailPrice == null ? null : retailPrice!.toMap(),
        "buyLink": buyLink == null ? null : buyLink,
        "offers": offers == null
            ? null
            : List<dynamic>.from(offers!.map((x) => x.toMap())),
      };
}

class SaleInfoListPrice {
  SaleInfoListPrice({
    required this.amount,
    required this.currencyCode,
  });

  double amount;
  String currencyCode;

  factory SaleInfoListPrice.fromJson(String str) =>
      SaleInfoListPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaleInfoListPrice.fromMap(Map<String, dynamic> json) =>
      SaleInfoListPrice(
        amount: json["amount"].toDouble(),
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Offer {
  Offer({
    required this.finskyOfferType,
    required this.listPrice,
    required this.retailPrice,
    required this.giftable,
  });

  int finskyOfferType;
  OfferListPrice listPrice;
  OfferListPrice retailPrice;
  bool giftable;

  factory Offer.fromJson(String str) => Offer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Offer.fromMap(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: OfferListPrice.fromMap(json["listPrice"]),
        retailPrice: OfferListPrice.fromMap(json["retailPrice"]),
        giftable: json["giftable"],
      );

  Map<String, dynamic> toMap() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice.toMap(),
        "retailPrice": retailPrice.toMap(),
        "giftable": giftable,
      };
}

class OfferListPrice {
  OfferListPrice({
    required this.amountInMicros,
    required this.currencyCode,
  });

  int amountInMicros;
  String currencyCode;

  factory OfferListPrice.fromJson(String str) =>
      OfferListPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfferListPrice.fromMap(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toMap() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
      };
}

enum Saleability { FOR_SALE, NOT_FOR_SALE, FREE }

final saleabilityValues = EnumValues({
  "FOR_SALE": Saleability.FOR_SALE,
  "FREE": Saleability.FREE,
  "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
  SearchInfo({
    required this.textSnippet,
  });

  String textSnippet;

  factory SearchInfo.fromJson(String str) =>
      SearchInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchInfo.fromMap(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toMap() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  VolumeInfo({
    required this.title,
    this.authors,
    required this.publisher,
    required this.publishedDate,
    this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    this.printType,
    this.categories,
    required this.averageRating,
    required this.ratingsCount,
    this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.pageCount,
    required this.subtitle,
  });

  String title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingModes readingModes;
  PrintType? printType;
  List<String>? categories;
  double? averageRating;
  int? ratingsCount;
  MaturityRating? maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  Language? language;
  String? previewLink;
  String infoLink;
  String canonicalVolumeLink;
  int? pageCount;
  String? subtitle;

  factory VolumeInfo.fromJson(String str) =>
      VolumeInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VolumeInfo.fromMap(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: json["authors"] == json["authors"]
            ? null
            : List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] == null ? null : json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"] == null ? null : json["description"],
        industryIdentifiers: List<IndustryIdentifier>.from(
            json["industryIdentifiers"]
                .map((x) => IndustryIdentifier.fromMap(x))),
        readingModes: ReadingModes.fromMap(json["readingModes"]),
        printType: printTypeValues.map[json["printType"]],
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
        averageRating: json["averageRating"] == null
            ? null
            : json["averageRating"].toDouble(),
        ratingsCount:
            json["ratingsCount"] == null ? null : json["ratingsCount"],
        maturityRating: maturityRatingValues.map[json["maturityRating"]],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: json["panelizationSummary"] == null
            ? null
            : PanelizationSummary.fromMap(json["panelizationSummary"]),
        imageLinks: json["imageLinks"] == null
            ? null
            : ImageLinks.fromMap(json["imageLinks"]),
        language: languageValues.map[json["language"]],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "authors":
            authors == null ? null : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher == null ? null : publisher,
        "publishedDate": publishedDate,
        "description": description == null ? null : description,
        "industryIdentifiers":
            List<dynamic>.from(industryIdentifiers!.map((x) => x.toMap())),
        "readingModes": readingModes.toMap(),
        "printType": printTypeValues.reverse[printType],
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x)),
        "averageRating": averageRating == null ? null : averageRating,
        "ratingsCount": ratingsCount == null ? null : ratingsCount,
        "maturityRating": maturityRatingValues.reverse[maturityRating],
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary":
            panelizationSummary == null ? null : panelizationSummary!.toMap(),
        "imageLinks": imageLinks == null ? null : imageLinks!.toMap(),
        "language": languageValues.reverse[language],
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
        "pageCount": pageCount == null ? null : pageCount,
        "subtitle": subtitle == null ? null : subtitle,
      };
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  String? smallThumbnail;
  String? thumbnail;

  factory ImageLinks.fromJson(String str) =>
      ImageLinks.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageLinks.fromMap(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  IndustryIdentifier({
    this.type,
    required this.identifier,
  });

  Type? type;
  String identifier;

  factory IndustryIdentifier.fromJson(String str) =>
      IndustryIdentifier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IndustryIdentifier.fromMap(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: typeValues.map[json["type"]],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toMap() => {
        "type": typeValues.reverse[type],
        "identifier": identifier,
      };
}

enum Type { ISBN_13, ISBN_10, OTHER }

final typeValues = EnumValues(
    {"ISBN_10": Type.ISBN_10, "ISBN_13": Type.ISBN_13, "OTHER": Type.OTHER});

enum Language { ES, EN }

final languageValues = EnumValues({"en": Language.EN, "es": Language.ES});

enum MaturityRating { NOT_MATURE }

final maturityRatingValues =
    EnumValues({"NOT_MATURE": MaturityRating.NOT_MATURE});

class PanelizationSummary {
  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  bool containsEpubBubbles;
  bool containsImageBubbles;

  factory PanelizationSummary.fromJson(String str) =>
      PanelizationSummary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PanelizationSummary.fromMap(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toMap() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

enum PrintType { BOOK }

final printTypeValues = EnumValues({"BOOK": PrintType.BOOK});

class ReadingModes {
  ReadingModes({
    required this.text,
    required this.image,
  });

  bool text;
  bool image;

  factory ReadingModes.fromJson(String str) =>
      ReadingModes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReadingModes.fromMap(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "image": image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // ignore: prefer_conditional_assignment
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}