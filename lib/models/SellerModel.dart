/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the SellerModel type in your schema. */
class SellerModel extends amplify_core.Model {
  static const classType = const _SellerModelModelType();
  final String id;
  final String? _uniqueid;
  final String? _banner;
  final String? _logo;
  final String? _name;
  final String? _description;
  final String? _full_description;
  final double? _rating_star;
  final int? _total_rated;
  final int? _total_positive;
  final String? _joined;
  final String? _awsemail;
  final String? _weblink;
  final String? _weblink1;
  final String? _gstnumber;
  final String? _gstpic;
  final bool? _block;
  final bool? _review;
  final int? _maxproducts;
  final bool? _top;
  final String? _featuredproductid;
  final String? _adhaarid;
  final String? _adhaarpic;
  final String? _address;
  final double? _lat;
  final double? _lon;
  final String? _officer;
  final String? _address1;
  final String? _headquaters;
  final double? _headlat;
  final double? _headlon;
  final String? _mcaid;
  final List<String>? _categories_applied;
  final String? _note;
  final String? _documnets;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SellerModelModelIdentifier get modelIdentifier {
      return SellerModelModelIdentifier(
        id: id
      );
  }
  
  String? get uniqueid {
    return _uniqueid;
  }
  
  String? get banner {
    return _banner;
  }
  
  String? get logo {
    return _logo;
  }
  
  String? get name {
    return _name;
  }
  
  String? get description {
    return _description;
  }
  
  String? get full_description {
    return _full_description;
  }
  
  double? get rating_star {
    return _rating_star;
  }
  
  int? get total_rated {
    return _total_rated;
  }
  
  int? get total_positive {
    return _total_positive;
  }
  
  String? get joined {
    return _joined;
  }
  
  String? get awsemail {
    return _awsemail;
  }
  
  String? get weblink {
    return _weblink;
  }
  
  String? get weblink1 {
    return _weblink1;
  }
  
  String? get gstnumber {
    return _gstnumber;
  }
  
  String? get gstpic {
    return _gstpic;
  }
  
  bool? get block {
    return _block;
  }
  
  bool? get review {
    return _review;
  }
  
  int? get maxproducts {
    return _maxproducts;
  }
  
  bool? get top {
    return _top;
  }
  
  String? get featuredproductid {
    return _featuredproductid;
  }
  
  String? get adhaarid {
    return _adhaarid;
  }
  
  String? get adhaarpic {
    return _adhaarpic;
  }
  
  String? get address {
    return _address;
  }
  
  double? get lat {
    return _lat;
  }
  
  double? get lon {
    return _lon;
  }
  
  String? get officer {
    return _officer;
  }
  
  String? get address1 {
    return _address1;
  }
  
  String? get headquaters {
    return _headquaters;
  }
  
  double? get headlat {
    return _headlat;
  }
  
  double? get headlon {
    return _headlon;
  }
  
  String? get mcaid {
    return _mcaid;
  }
  
  List<String>? get categories_applied {
    return _categories_applied;
  }
  
  String? get note {
    return _note;
  }
  
  String? get documnets {
    return _documnets;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SellerModel._internal({required this.id, uniqueid, banner, logo, name, description, full_description, rating_star, total_rated, total_positive, joined, awsemail, weblink, weblink1, gstnumber, gstpic, block, review, maxproducts, top, featuredproductid, adhaarid, adhaarpic, address, lat, lon, officer, address1, headquaters, headlat, headlon, mcaid, categories_applied, note, documnets, createdAt, updatedAt}): _uniqueid = uniqueid, _banner = banner, _logo = logo, _name = name, _description = description, _full_description = full_description, _rating_star = rating_star, _total_rated = total_rated, _total_positive = total_positive, _joined = joined, _awsemail = awsemail, _weblink = weblink, _weblink1 = weblink1, _gstnumber = gstnumber, _gstpic = gstpic, _block = block, _review = review, _maxproducts = maxproducts, _top = top, _featuredproductid = featuredproductid, _adhaarid = adhaarid, _adhaarpic = adhaarpic, _address = address, _lat = lat, _lon = lon, _officer = officer, _address1 = address1, _headquaters = headquaters, _headlat = headlat, _headlon = headlon, _mcaid = mcaid, _categories_applied = categories_applied, _note = note, _documnets = documnets, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SellerModel({String? id, String? uniqueid, String? banner, String? logo, String? name, String? description, String? full_description, double? rating_star, int? total_rated, int? total_positive, String? joined, String? awsemail, String? weblink, String? weblink1, String? gstnumber, String? gstpic, bool? block, bool? review, int? maxproducts, bool? top, String? featuredproductid, String? adhaarid, String? adhaarpic, String? address, double? lat, double? lon, String? officer, String? address1, String? headquaters, double? headlat, double? headlon, String? mcaid, List<String>? categories_applied, String? note, String? documnets}) {
    return SellerModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      uniqueid: uniqueid,
      banner: banner,
      logo: logo,
      name: name,
      description: description,
      full_description: full_description,
      rating_star: rating_star,
      total_rated: total_rated,
      total_positive: total_positive,
      joined: joined,
      awsemail: awsemail,
      weblink: weblink,
      weblink1: weblink1,
      gstnumber: gstnumber,
      gstpic: gstpic,
      block: block,
      review: review,
      maxproducts: maxproducts,
      top: top,
      featuredproductid: featuredproductid,
      adhaarid: adhaarid,
      adhaarpic: adhaarpic,
      address: address,
      lat: lat,
      lon: lon,
      officer: officer,
      address1: address1,
      headquaters: headquaters,
      headlat: headlat,
      headlon: headlon,
      mcaid: mcaid,
      categories_applied: categories_applied != null ? List<String>.unmodifiable(categories_applied) : categories_applied,
      note: note,
      documnets: documnets);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SellerModel &&
      id == other.id &&
      _uniqueid == other._uniqueid &&
      _banner == other._banner &&
      _logo == other._logo &&
      _name == other._name &&
      _description == other._description &&
      _full_description == other._full_description &&
      _rating_star == other._rating_star &&
      _total_rated == other._total_rated &&
      _total_positive == other._total_positive &&
      _joined == other._joined &&
      _awsemail == other._awsemail &&
      _weblink == other._weblink &&
      _weblink1 == other._weblink1 &&
      _gstnumber == other._gstnumber &&
      _gstpic == other._gstpic &&
      _block == other._block &&
      _review == other._review &&
      _maxproducts == other._maxproducts &&
      _top == other._top &&
      _featuredproductid == other._featuredproductid &&
      _adhaarid == other._adhaarid &&
      _adhaarpic == other._adhaarpic &&
      _address == other._address &&
      _lat == other._lat &&
      _lon == other._lon &&
      _officer == other._officer &&
      _address1 == other._address1 &&
      _headquaters == other._headquaters &&
      _headlat == other._headlat &&
      _headlon == other._headlon &&
      _mcaid == other._mcaid &&
      DeepCollectionEquality().equals(_categories_applied, other._categories_applied) &&
      _note == other._note &&
      _documnets == other._documnets;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SellerModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("uniqueid=" + "$_uniqueid" + ", ");
    buffer.write("banner=" + "$_banner" + ", ");
    buffer.write("logo=" + "$_logo" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("full_description=" + "$_full_description" + ", ");
    buffer.write("rating_star=" + (_rating_star != null ? _rating_star!.toString() : "null") + ", ");
    buffer.write("total_rated=" + (_total_rated != null ? _total_rated!.toString() : "null") + ", ");
    buffer.write("total_positive=" + (_total_positive != null ? _total_positive!.toString() : "null") + ", ");
    buffer.write("joined=" + "$_joined" + ", ");
    buffer.write("awsemail=" + "$_awsemail" + ", ");
    buffer.write("weblink=" + "$_weblink" + ", ");
    buffer.write("weblink1=" + "$_weblink1" + ", ");
    buffer.write("gstnumber=" + "$_gstnumber" + ", ");
    buffer.write("gstpic=" + "$_gstpic" + ", ");
    buffer.write("block=" + (_block != null ? _block!.toString() : "null") + ", ");
    buffer.write("review=" + (_review != null ? _review!.toString() : "null") + ", ");
    buffer.write("maxproducts=" + (_maxproducts != null ? _maxproducts!.toString() : "null") + ", ");
    buffer.write("top=" + (_top != null ? _top!.toString() : "null") + ", ");
    buffer.write("featuredproductid=" + "$_featuredproductid" + ", ");
    buffer.write("adhaarid=" + "$_adhaarid" + ", ");
    buffer.write("adhaarpic=" + "$_adhaarpic" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lon=" + (_lon != null ? _lon!.toString() : "null") + ", ");
    buffer.write("officer=" + "$_officer" + ", ");
    buffer.write("address1=" + "$_address1" + ", ");
    buffer.write("headquaters=" + "$_headquaters" + ", ");
    buffer.write("headlat=" + (_headlat != null ? _headlat!.toString() : "null") + ", ");
    buffer.write("headlon=" + (_headlon != null ? _headlon!.toString() : "null") + ", ");
    buffer.write("mcaid=" + "$_mcaid" + ", ");
    buffer.write("categories_applied=" + (_categories_applied != null ? _categories_applied!.toString() : "null") + ", ");
    buffer.write("note=" + "$_note" + ", ");
    buffer.write("documnets=" + "$_documnets" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SellerModel copyWith({String? uniqueid, String? banner, String? logo, String? name, String? description, String? full_description, double? rating_star, int? total_rated, int? total_positive, String? joined, String? awsemail, String? weblink, String? weblink1, String? gstnumber, String? gstpic, bool? block, bool? review, int? maxproducts, bool? top, String? featuredproductid, String? adhaarid, String? adhaarpic, String? address, double? lat, double? lon, String? officer, String? address1, String? headquaters, double? headlat, double? headlon, String? mcaid, List<String>? categories_applied, String? note, String? documnets}) {
    return SellerModel._internal(
      id: id,
      uniqueid: uniqueid ?? this.uniqueid,
      banner: banner ?? this.banner,
      logo: logo ?? this.logo,
      name: name ?? this.name,
      description: description ?? this.description,
      full_description: full_description ?? this.full_description,
      rating_star: rating_star ?? this.rating_star,
      total_rated: total_rated ?? this.total_rated,
      total_positive: total_positive ?? this.total_positive,
      joined: joined ?? this.joined,
      awsemail: awsemail ?? this.awsemail,
      weblink: weblink ?? this.weblink,
      weblink1: weblink1 ?? this.weblink1,
      gstnumber: gstnumber ?? this.gstnumber,
      gstpic: gstpic ?? this.gstpic,
      block: block ?? this.block,
      review: review ?? this.review,
      maxproducts: maxproducts ?? this.maxproducts,
      top: top ?? this.top,
      featuredproductid: featuredproductid ?? this.featuredproductid,
      adhaarid: adhaarid ?? this.adhaarid,
      adhaarpic: adhaarpic ?? this.adhaarpic,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      officer: officer ?? this.officer,
      address1: address1 ?? this.address1,
      headquaters: headquaters ?? this.headquaters,
      headlat: headlat ?? this.headlat,
      headlon: headlon ?? this.headlon,
      mcaid: mcaid ?? this.mcaid,
      categories_applied: categories_applied ?? this.categories_applied,
      note: note ?? this.note,
      documnets: documnets ?? this.documnets);
  }
  
  SellerModel copyWithModelFieldValues({
    ModelFieldValue<String?>? uniqueid,
    ModelFieldValue<String?>? banner,
    ModelFieldValue<String?>? logo,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? full_description,
    ModelFieldValue<double?>? rating_star,
    ModelFieldValue<int?>? total_rated,
    ModelFieldValue<int?>? total_positive,
    ModelFieldValue<String?>? joined,
    ModelFieldValue<String?>? awsemail,
    ModelFieldValue<String?>? weblink,
    ModelFieldValue<String?>? weblink1,
    ModelFieldValue<String?>? gstnumber,
    ModelFieldValue<String?>? gstpic,
    ModelFieldValue<bool?>? block,
    ModelFieldValue<bool?>? review,
    ModelFieldValue<int?>? maxproducts,
    ModelFieldValue<bool?>? top,
    ModelFieldValue<String?>? featuredproductid,
    ModelFieldValue<String?>? adhaarid,
    ModelFieldValue<String?>? adhaarpic,
    ModelFieldValue<String?>? address,
    ModelFieldValue<double?>? lat,
    ModelFieldValue<double?>? lon,
    ModelFieldValue<String?>? officer,
    ModelFieldValue<String?>? address1,
    ModelFieldValue<String?>? headquaters,
    ModelFieldValue<double?>? headlat,
    ModelFieldValue<double?>? headlon,
    ModelFieldValue<String?>? mcaid,
    ModelFieldValue<List<String>?>? categories_applied,
    ModelFieldValue<String?>? note,
    ModelFieldValue<String?>? documnets
  }) {
    return SellerModel._internal(
      id: id,
      uniqueid: uniqueid == null ? this.uniqueid : uniqueid.value,
      banner: banner == null ? this.banner : banner.value,
      logo: logo == null ? this.logo : logo.value,
      name: name == null ? this.name : name.value,
      description: description == null ? this.description : description.value,
      full_description: full_description == null ? this.full_description : full_description.value,
      rating_star: rating_star == null ? this.rating_star : rating_star.value,
      total_rated: total_rated == null ? this.total_rated : total_rated.value,
      total_positive: total_positive == null ? this.total_positive : total_positive.value,
      joined: joined == null ? this.joined : joined.value,
      awsemail: awsemail == null ? this.awsemail : awsemail.value,
      weblink: weblink == null ? this.weblink : weblink.value,
      weblink1: weblink1 == null ? this.weblink1 : weblink1.value,
      gstnumber: gstnumber == null ? this.gstnumber : gstnumber.value,
      gstpic: gstpic == null ? this.gstpic : gstpic.value,
      block: block == null ? this.block : block.value,
      review: review == null ? this.review : review.value,
      maxproducts: maxproducts == null ? this.maxproducts : maxproducts.value,
      top: top == null ? this.top : top.value,
      featuredproductid: featuredproductid == null ? this.featuredproductid : featuredproductid.value,
      adhaarid: adhaarid == null ? this.adhaarid : adhaarid.value,
      adhaarpic: adhaarpic == null ? this.adhaarpic : adhaarpic.value,
      address: address == null ? this.address : address.value,
      lat: lat == null ? this.lat : lat.value,
      lon: lon == null ? this.lon : lon.value,
      officer: officer == null ? this.officer : officer.value,
      address1: address1 == null ? this.address1 : address1.value,
      headquaters: headquaters == null ? this.headquaters : headquaters.value,
      headlat: headlat == null ? this.headlat : headlat.value,
      headlon: headlon == null ? this.headlon : headlon.value,
      mcaid: mcaid == null ? this.mcaid : mcaid.value,
      categories_applied: categories_applied == null ? this.categories_applied : categories_applied.value,
      note: note == null ? this.note : note.value,
      documnets: documnets == null ? this.documnets : documnets.value
    );
  }
  
  SellerModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _uniqueid = json['uniqueid'],
      _banner = json['banner'],
      _logo = json['logo'],
      _name = json['name'],
      _description = json['description'],
      _full_description = json['full_description'],
      _rating_star = (json['rating_star'] as num?)?.toDouble(),
      _total_rated = (json['total_rated'] as num?)?.toInt(),
      _total_positive = (json['total_positive'] as num?)?.toInt(),
      _joined = json['joined'],
      _awsemail = json['awsemail'],
      _weblink = json['weblink'],
      _weblink1 = json['weblink1'],
      _gstnumber = json['gstnumber'],
      _gstpic = json['gstpic'],
      _block = json['block'],
      _review = json['review'],
      _maxproducts = (json['maxproducts'] as num?)?.toInt(),
      _top = json['top'],
      _featuredproductid = json['featuredproductid'],
      _adhaarid = json['adhaarid'],
      _adhaarpic = json['adhaarpic'],
      _address = json['address'],
      _lat = (json['lat'] as num?)?.toDouble(),
      _lon = (json['lon'] as num?)?.toDouble(),
      _officer = json['officer'],
      _address1 = json['address1'],
      _headquaters = json['headquaters'],
      _headlat = (json['headlat'] as num?)?.toDouble(),
      _headlon = (json['headlon'] as num?)?.toDouble(),
      _mcaid = json['mcaid'],
      _categories_applied = json['categories_applied']?.cast<String>(),
      _note = json['note'],
      _documnets = json['documnets'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'uniqueid': _uniqueid, 'banner': _banner, 'logo': _logo, 'name': _name, 'description': _description, 'full_description': _full_description, 'rating_star': _rating_star, 'total_rated': _total_rated, 'total_positive': _total_positive, 'joined': _joined, 'awsemail': _awsemail, 'weblink': _weblink, 'weblink1': _weblink1, 'gstnumber': _gstnumber, 'gstpic': _gstpic, 'block': _block, 'review': _review, 'maxproducts': _maxproducts, 'top': _top, 'featuredproductid': _featuredproductid, 'adhaarid': _adhaarid, 'adhaarpic': _adhaarpic, 'address': _address, 'lat': _lat, 'lon': _lon, 'officer': _officer, 'address1': _address1, 'headquaters': _headquaters, 'headlat': _headlat, 'headlon': _headlon, 'mcaid': _mcaid, 'categories_applied': _categories_applied, 'note': _note, 'documnets': _documnets, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'uniqueid': _uniqueid,
    'banner': _banner,
    'logo': _logo,
    'name': _name,
    'description': _description,
    'full_description': _full_description,
    'rating_star': _rating_star,
    'total_rated': _total_rated,
    'total_positive': _total_positive,
    'joined': _joined,
    'awsemail': _awsemail,
    'weblink': _weblink,
    'weblink1': _weblink1,
    'gstnumber': _gstnumber,
    'gstpic': _gstpic,
    'block': _block,
    'review': _review,
    'maxproducts': _maxproducts,
    'top': _top,
    'featuredproductid': _featuredproductid,
    'adhaarid': _adhaarid,
    'adhaarpic': _adhaarpic,
    'address': _address,
    'lat': _lat,
    'lon': _lon,
    'officer': _officer,
    'address1': _address1,
    'headquaters': _headquaters,
    'headlat': _headlat,
    'headlon': _headlon,
    'mcaid': _mcaid,
    'categories_applied': _categories_applied,
    'note': _note,
    'documnets': _documnets,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<SellerModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<SellerModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final UNIQUEID = amplify_core.QueryField(fieldName: "uniqueid");
  static final BANNER = amplify_core.QueryField(fieldName: "banner");
  static final LOGO = amplify_core.QueryField(fieldName: "logo");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final FULL_DESCRIPTION = amplify_core.QueryField(fieldName: "full_description");
  static final RATING_STAR = amplify_core.QueryField(fieldName: "rating_star");
  static final TOTAL_RATED = amplify_core.QueryField(fieldName: "total_rated");
  static final TOTAL_POSITIVE = amplify_core.QueryField(fieldName: "total_positive");
  static final JOINED = amplify_core.QueryField(fieldName: "joined");
  static final AWSEMAIL = amplify_core.QueryField(fieldName: "awsemail");
  static final WEBLINK = amplify_core.QueryField(fieldName: "weblink");
  static final WEBLINK1 = amplify_core.QueryField(fieldName: "weblink1");
  static final GSTNUMBER = amplify_core.QueryField(fieldName: "gstnumber");
  static final GSTPIC = amplify_core.QueryField(fieldName: "gstpic");
  static final BLOCK = amplify_core.QueryField(fieldName: "block");
  static final REVIEW = amplify_core.QueryField(fieldName: "review");
  static final MAXPRODUCTS = amplify_core.QueryField(fieldName: "maxproducts");
  static final TOP = amplify_core.QueryField(fieldName: "top");
  static final FEATUREDPRODUCTID = amplify_core.QueryField(fieldName: "featuredproductid");
  static final ADHAARID = amplify_core.QueryField(fieldName: "adhaarid");
  static final ADHAARPIC = amplify_core.QueryField(fieldName: "adhaarpic");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final LAT = amplify_core.QueryField(fieldName: "lat");
  static final LON = amplify_core.QueryField(fieldName: "lon");
  static final OFFICER = amplify_core.QueryField(fieldName: "officer");
  static final ADDRESS1 = amplify_core.QueryField(fieldName: "address1");
  static final HEADQUATERS = amplify_core.QueryField(fieldName: "headquaters");
  static final HEADLAT = amplify_core.QueryField(fieldName: "headlat");
  static final HEADLON = amplify_core.QueryField(fieldName: "headlon");
  static final MCAID = amplify_core.QueryField(fieldName: "mcaid");
  static final CATEGORIES_APPLIED = amplify_core.QueryField(fieldName: "categories_applied");
  static final NOTE = amplify_core.QueryField(fieldName: "note");
  static final DOCUMNETS = amplify_core.QueryField(fieldName: "documnets");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SellerModel";
    modelSchemaDefinition.pluralName = "SellerModels";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.UNIQUEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.BANNER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.LOGO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.FULL_DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.RATING_STAR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.TOTAL_RATED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.TOTAL_POSITIVE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.JOINED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.AWSEMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.WEBLINK,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.WEBLINK1,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.GSTNUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.GSTPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.BLOCK,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.REVIEW,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.MAXPRODUCTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.TOP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.FEATUREDPRODUCTID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.ADHAARID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.ADHAARPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.ADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.LAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.LON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.OFFICER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.ADDRESS1,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.HEADQUATERS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.HEADLAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.HEADLON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.MCAID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.CATEGORIES_APPLIED,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.NOTE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SellerModel.DOCUMNETS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _SellerModelModelType extends amplify_core.ModelType<SellerModel> {
  const _SellerModelModelType();
  
  @override
  SellerModel fromJson(Map<String, dynamic> jsonData) {
    return SellerModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SellerModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [SellerModel] in your schema.
 */
class SellerModelModelIdentifier implements amplify_core.ModelIdentifier<SellerModel> {
  final String id;

  /** Create an instance of SellerModelModelIdentifier using [id] the primary key. */
  const SellerModelModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'SellerModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SellerModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}