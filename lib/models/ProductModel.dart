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


/** This is an auto generated class representing the ProductModel type in your schema. */
class ProductModel extends amplify_core.Model {
  static const classType = const _ProductModelModelType();
  final String id;
  final String? _email;
  final String? _brandname;
  final String? _name;
  final int? _buyed;
  final int? _mrp;
  final int? _sellingvlue;
  final double? _lat;
  final double? _lon;
  final String? _company_name;
  final String? _shipername;
  final String? _boxcontent;
  final String? _description;
  final String? _fulldescription;
  final bool? _isdiffrentiable;
  final List<String>? _arrayname;
  final List<int>? _arrayamount;
  final List<int>? _arraymrp;
  final List<int>? _arraystocks;
  final int? _totalstock;
  final List<String>? _picture;
  final List<String>? _favorites;
  final List<String>? _waitlist;
  final String? _uniqueid;
  final String? _categor;
  final bool? _offer;
  final bool? _first;
  final int? _totalbuyed;
  final String? _firstadded;
  final int? _intss;
  final double? _weight;
  final String? _dimension;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProductModelModelIdentifier get modelIdentifier {
      return ProductModelModelIdentifier(
        id: id
      );
  }
  
  String? get email {
    return _email;
  }
  
  String? get brandname {
    return _brandname;
  }
  
  String? get name {
    return _name;
  }
  
  int? get buyed {
    return _buyed;
  }
  
  int? get mrp {
    return _mrp;
  }
  
  int? get sellingvlue {
    return _sellingvlue;
  }
  
  double? get lat {
    return _lat;
  }
  
  double? get lon {
    return _lon;
  }
  
  String? get company_name {
    return _company_name;
  }
  
  String? get shipername {
    return _shipername;
  }
  
  String? get boxcontent {
    return _boxcontent;
  }
  
  String? get description {
    return _description;
  }
  
  String? get fulldescription {
    return _fulldescription;
  }
  
  bool? get isdiffrentiable {
    return _isdiffrentiable;
  }
  
  List<String>? get arrayname {
    return _arrayname;
  }
  
  List<int>? get arrayamount {
    return _arrayamount;
  }
  
  List<int>? get arraymrp {
    return _arraymrp;
  }
  
  List<int>? get arraystocks {
    return _arraystocks;
  }
  
  int? get totalstock {
    return _totalstock;
  }
  
  List<String>? get picture {
    return _picture;
  }
  
  List<String>? get favorites {
    return _favorites;
  }
  
  List<String>? get waitlist {
    return _waitlist;
  }
  
  String? get uniqueid {
    return _uniqueid;
  }
  
  String? get categor {
    return _categor;
  }
  
  bool? get offer {
    return _offer;
  }
  
  bool? get first {
    return _first;
  }
  
  int? get totalbuyed {
    return _totalbuyed;
  }
  
  String? get firstadded {
    return _firstadded;
  }
  
  int? get intss {
    return _intss;
  }
  
  double? get weight {
    return _weight;
  }
  
  String? get dimension {
    return _dimension;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ProductModel._internal({required this.id, email, brandname, name, buyed, mrp, sellingvlue, lat, lon, company_name, shipername, boxcontent, description, fulldescription, isdiffrentiable, arrayname, arrayamount, arraymrp, arraystocks, totalstock, picture, favorites, waitlist, uniqueid, categor, offer, first, totalbuyed, firstadded, intss, weight, dimension, createdAt, updatedAt}): _email = email, _brandname = brandname, _name = name, _buyed = buyed, _mrp = mrp, _sellingvlue = sellingvlue, _lat = lat, _lon = lon, _company_name = company_name, _shipername = shipername, _boxcontent = boxcontent, _description = description, _fulldescription = fulldescription, _isdiffrentiable = isdiffrentiable, _arrayname = arrayname, _arrayamount = arrayamount, _arraymrp = arraymrp, _arraystocks = arraystocks, _totalstock = totalstock, _picture = picture, _favorites = favorites, _waitlist = waitlist, _uniqueid = uniqueid, _categor = categor, _offer = offer, _first = first, _totalbuyed = totalbuyed, _firstadded = firstadded, _intss = intss, _weight = weight, _dimension = dimension, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProductModel({String? id, String? email, String? brandname, String? name, int? buyed, int? mrp, int? sellingvlue, double? lat, double? lon, String? company_name, String? shipername, String? boxcontent, String? description, String? fulldescription, bool? isdiffrentiable, List<String>? arrayname, List<int>? arrayamount, List<int>? arraymrp, List<int>? arraystocks, int? totalstock, List<String>? picture, List<String>? favorites, List<String>? waitlist, String? uniqueid, String? categor, bool? offer, bool? first, int? totalbuyed, String? firstadded, int? intss, double? weight, String? dimension}) {
    return ProductModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      email: email,
      brandname: brandname,
      name: name,
      buyed: buyed,
      mrp: mrp,
      sellingvlue: sellingvlue,
      lat: lat,
      lon: lon,
      company_name: company_name,
      shipername: shipername,
      boxcontent: boxcontent,
      description: description,
      fulldescription: fulldescription,
      isdiffrentiable: isdiffrentiable,
      arrayname: arrayname != null ? List<String>.unmodifiable(arrayname) : arrayname,
      arrayamount: arrayamount != null ? List<int>.unmodifiable(arrayamount) : arrayamount,
      arraymrp: arraymrp != null ? List<int>.unmodifiable(arraymrp) : arraymrp,
      arraystocks: arraystocks != null ? List<int>.unmodifiable(arraystocks) : arraystocks,
      totalstock: totalstock,
      picture: picture != null ? List<String>.unmodifiable(picture) : picture,
      favorites: favorites != null ? List<String>.unmodifiable(favorites) : favorites,
      waitlist: waitlist != null ? List<String>.unmodifiable(waitlist) : waitlist,
      uniqueid: uniqueid,
      categor: categor,
      offer: offer,
      first: first,
      totalbuyed: totalbuyed,
      firstadded: firstadded,
      intss: intss,
      weight: weight,
      dimension: dimension);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductModel &&
      id == other.id &&
      _email == other._email &&
      _brandname == other._brandname &&
      _name == other._name &&
      _buyed == other._buyed &&
      _mrp == other._mrp &&
      _sellingvlue == other._sellingvlue &&
      _lat == other._lat &&
      _lon == other._lon &&
      _company_name == other._company_name &&
      _shipername == other._shipername &&
      _boxcontent == other._boxcontent &&
      _description == other._description &&
      _fulldescription == other._fulldescription &&
      _isdiffrentiable == other._isdiffrentiable &&
      DeepCollectionEquality().equals(_arrayname, other._arrayname) &&
      DeepCollectionEquality().equals(_arrayamount, other._arrayamount) &&
      DeepCollectionEquality().equals(_arraymrp, other._arraymrp) &&
      DeepCollectionEquality().equals(_arraystocks, other._arraystocks) &&
      _totalstock == other._totalstock &&
      DeepCollectionEquality().equals(_picture, other._picture) &&
      DeepCollectionEquality().equals(_favorites, other._favorites) &&
      DeepCollectionEquality().equals(_waitlist, other._waitlist) &&
      _uniqueid == other._uniqueid &&
      _categor == other._categor &&
      _offer == other._offer &&
      _first == other._first &&
      _totalbuyed == other._totalbuyed &&
      _firstadded == other._firstadded &&
      _intss == other._intss &&
      _weight == other._weight &&
      _dimension == other._dimension;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProductModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("brandname=" + "$_brandname" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("buyed=" + (_buyed != null ? _buyed!.toString() : "null") + ", ");
    buffer.write("mrp=" + (_mrp != null ? _mrp!.toString() : "null") + ", ");
    buffer.write("sellingvlue=" + (_sellingvlue != null ? _sellingvlue!.toString() : "null") + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lon=" + (_lon != null ? _lon!.toString() : "null") + ", ");
    buffer.write("company_name=" + "$_company_name" + ", ");
    buffer.write("shipername=" + "$_shipername" + ", ");
    buffer.write("boxcontent=" + "$_boxcontent" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("fulldescription=" + "$_fulldescription" + ", ");
    buffer.write("isdiffrentiable=" + (_isdiffrentiable != null ? _isdiffrentiable!.toString() : "null") + ", ");
    buffer.write("arrayname=" + (_arrayname != null ? _arrayname!.toString() : "null") + ", ");
    buffer.write("arrayamount=" + (_arrayamount != null ? _arrayamount!.toString() : "null") + ", ");
    buffer.write("arraymrp=" + (_arraymrp != null ? _arraymrp!.toString() : "null") + ", ");
    buffer.write("arraystocks=" + (_arraystocks != null ? _arraystocks!.toString() : "null") + ", ");
    buffer.write("totalstock=" + (_totalstock != null ? _totalstock!.toString() : "null") + ", ");
    buffer.write("picture=" + (_picture != null ? _picture!.toString() : "null") + ", ");
    buffer.write("favorites=" + (_favorites != null ? _favorites!.toString() : "null") + ", ");
    buffer.write("waitlist=" + (_waitlist != null ? _waitlist!.toString() : "null") + ", ");
    buffer.write("uniqueid=" + "$_uniqueid" + ", ");
    buffer.write("categor=" + "$_categor" + ", ");
    buffer.write("offer=" + (_offer != null ? _offer!.toString() : "null") + ", ");
    buffer.write("first=" + (_first != null ? _first!.toString() : "null") + ", ");
    buffer.write("totalbuyed=" + (_totalbuyed != null ? _totalbuyed!.toString() : "null") + ", ");
    buffer.write("firstadded=" + "$_firstadded" + ", ");
    buffer.write("intss=" + (_intss != null ? _intss!.toString() : "null") + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("dimension=" + "$_dimension" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProductModel copyWith({String? email, String? brandname, String? name, int? buyed, int? mrp, int? sellingvlue, double? lat, double? lon, String? company_name, String? shipername, String? boxcontent, String? description, String? fulldescription, bool? isdiffrentiable, List<String>? arrayname, List<int>? arrayamount, List<int>? arraymrp, List<int>? arraystocks, int? totalstock, List<String>? picture, List<String>? favorites, List<String>? waitlist, String? uniqueid, String? categor, bool? offer, bool? first, int? totalbuyed, String? firstadded, int? intss, double? weight, String? dimension}) {
    return ProductModel._internal(
      id: id,
      email: email ?? this.email,
      brandname: brandname ?? this.brandname,
      name: name ?? this.name,
      buyed: buyed ?? this.buyed,
      mrp: mrp ?? this.mrp,
      sellingvlue: sellingvlue ?? this.sellingvlue,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      company_name: company_name ?? this.company_name,
      shipername: shipername ?? this.shipername,
      boxcontent: boxcontent ?? this.boxcontent,
      description: description ?? this.description,
      fulldescription: fulldescription ?? this.fulldescription,
      isdiffrentiable: isdiffrentiable ?? this.isdiffrentiable,
      arrayname: arrayname ?? this.arrayname,
      arrayamount: arrayamount ?? this.arrayamount,
      arraymrp: arraymrp ?? this.arraymrp,
      arraystocks: arraystocks ?? this.arraystocks,
      totalstock: totalstock ?? this.totalstock,
      picture: picture ?? this.picture,
      favorites: favorites ?? this.favorites,
      waitlist: waitlist ?? this.waitlist,
      uniqueid: uniqueid ?? this.uniqueid,
      categor: categor ?? this.categor,
      offer: offer ?? this.offer,
      first: first ?? this.first,
      totalbuyed: totalbuyed ?? this.totalbuyed,
      firstadded: firstadded ?? this.firstadded,
      intss: intss ?? this.intss,
      weight: weight ?? this.weight,
      dimension: dimension ?? this.dimension);
  }
  
  ProductModel copyWithModelFieldValues({
    ModelFieldValue<String?>? email,
    ModelFieldValue<String?>? brandname,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? buyed,
    ModelFieldValue<int?>? mrp,
    ModelFieldValue<int?>? sellingvlue,
    ModelFieldValue<double?>? lat,
    ModelFieldValue<double?>? lon,
    ModelFieldValue<String?>? company_name,
    ModelFieldValue<String?>? shipername,
    ModelFieldValue<String?>? boxcontent,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? fulldescription,
    ModelFieldValue<bool?>? isdiffrentiable,
    ModelFieldValue<List<String>?>? arrayname,
    ModelFieldValue<List<int>?>? arrayamount,
    ModelFieldValue<List<int>?>? arraymrp,
    ModelFieldValue<List<int>?>? arraystocks,
    ModelFieldValue<int?>? totalstock,
    ModelFieldValue<List<String>?>? picture,
    ModelFieldValue<List<String>?>? favorites,
    ModelFieldValue<List<String>?>? waitlist,
    ModelFieldValue<String?>? uniqueid,
    ModelFieldValue<String?>? categor,
    ModelFieldValue<bool?>? offer,
    ModelFieldValue<bool?>? first,
    ModelFieldValue<int?>? totalbuyed,
    ModelFieldValue<String?>? firstadded,
    ModelFieldValue<int?>? intss,
    ModelFieldValue<double?>? weight,
    ModelFieldValue<String?>? dimension
  }) {
    return ProductModel._internal(
      id: id,
      email: email == null ? this.email : email.value,
      brandname: brandname == null ? this.brandname : brandname.value,
      name: name == null ? this.name : name.value,
      buyed: buyed == null ? this.buyed : buyed.value,
      mrp: mrp == null ? this.mrp : mrp.value,
      sellingvlue: sellingvlue == null ? this.sellingvlue : sellingvlue.value,
      lat: lat == null ? this.lat : lat.value,
      lon: lon == null ? this.lon : lon.value,
      company_name: company_name == null ? this.company_name : company_name.value,
      shipername: shipername == null ? this.shipername : shipername.value,
      boxcontent: boxcontent == null ? this.boxcontent : boxcontent.value,
      description: description == null ? this.description : description.value,
      fulldescription: fulldescription == null ? this.fulldescription : fulldescription.value,
      isdiffrentiable: isdiffrentiable == null ? this.isdiffrentiable : isdiffrentiable.value,
      arrayname: arrayname == null ? this.arrayname : arrayname.value,
      arrayamount: arrayamount == null ? this.arrayamount : arrayamount.value,
      arraymrp: arraymrp == null ? this.arraymrp : arraymrp.value,
      arraystocks: arraystocks == null ? this.arraystocks : arraystocks.value,
      totalstock: totalstock == null ? this.totalstock : totalstock.value,
      picture: picture == null ? this.picture : picture.value,
      favorites: favorites == null ? this.favorites : favorites.value,
      waitlist: waitlist == null ? this.waitlist : waitlist.value,
      uniqueid: uniqueid == null ? this.uniqueid : uniqueid.value,
      categor: categor == null ? this.categor : categor.value,
      offer: offer == null ? this.offer : offer.value,
      first: first == null ? this.first : first.value,
      totalbuyed: totalbuyed == null ? this.totalbuyed : totalbuyed.value,
      firstadded: firstadded == null ? this.firstadded : firstadded.value,
      intss: intss == null ? this.intss : intss.value,
      weight: weight == null ? this.weight : weight.value,
      dimension: dimension == null ? this.dimension : dimension.value
    );
  }
  
  ProductModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _brandname = json['brandname'],
      _name = json['name'],
      _buyed = (json['buyed'] as num?)?.toInt(),
      _mrp = (json['mrp'] as num?)?.toInt(),
      _sellingvlue = (json['sellingvlue'] as num?)?.toInt(),
      _lat = (json['lat'] as num?)?.toDouble(),
      _lon = (json['lon'] as num?)?.toDouble(),
      _company_name = json['company_name'],
      _shipername = json['shipername'],
      _boxcontent = json['boxcontent'],
      _description = json['description'],
      _fulldescription = json['fulldescription'],
      _isdiffrentiable = json['isdiffrentiable'],
      _arrayname = json['arrayname']?.cast<String>(),
      _arrayamount = (json['arrayamount'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _arraymrp = (json['arraymrp'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _arraystocks = (json['arraystocks'] as List?)?.map((e) => (e as num).toInt()).toList(),
      _totalstock = (json['totalstock'] as num?)?.toInt(),
      _picture = json['picture']?.cast<String>(),
      _favorites = json['favorites']?.cast<String>(),
      _waitlist = json['waitlist']?.cast<String>(),
      _uniqueid = json['uniqueid'],
      _categor = json['categor'],
      _offer = json['offer'],
      _first = json['first'],
      _totalbuyed = (json['totalbuyed'] as num?)?.toInt(),
      _firstadded = json['firstadded'],
      _intss = (json['intss'] as num?)?.toInt(),
      _weight = (json['weight'] as num?)?.toDouble(),
      _dimension = json['dimension'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'brandname': _brandname, 'name': _name, 'buyed': _buyed, 'mrp': _mrp, 'sellingvlue': _sellingvlue, 'lat': _lat, 'lon': _lon, 'company_name': _company_name, 'shipername': _shipername, 'boxcontent': _boxcontent, 'description': _description, 'fulldescription': _fulldescription, 'isdiffrentiable': _isdiffrentiable, 'arrayname': _arrayname, 'arrayamount': _arrayamount, 'arraymrp': _arraymrp, 'arraystocks': _arraystocks, 'totalstock': _totalstock, 'picture': _picture, 'favorites': _favorites, 'waitlist': _waitlist, 'uniqueid': _uniqueid, 'categor': _categor, 'offer': _offer, 'first': _first, 'totalbuyed': _totalbuyed, 'firstadded': _firstadded, 'intss': _intss, 'weight': _weight, 'dimension': _dimension, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'email': _email,
    'brandname': _brandname,
    'name': _name,
    'buyed': _buyed,
    'mrp': _mrp,
    'sellingvlue': _sellingvlue,
    'lat': _lat,
    'lon': _lon,
    'company_name': _company_name,
    'shipername': _shipername,
    'boxcontent': _boxcontent,
    'description': _description,
    'fulldescription': _fulldescription,
    'isdiffrentiable': _isdiffrentiable,
    'arrayname': _arrayname,
    'arrayamount': _arrayamount,
    'arraymrp': _arraymrp,
    'arraystocks': _arraystocks,
    'totalstock': _totalstock,
    'picture': _picture,
    'favorites': _favorites,
    'waitlist': _waitlist,
    'uniqueid': _uniqueid,
    'categor': _categor,
    'offer': _offer,
    'first': _first,
    'totalbuyed': _totalbuyed,
    'firstadded': _firstadded,
    'intss': _intss,
    'weight': _weight,
    'dimension': _dimension,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ProductModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ProductModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final BRANDNAME = amplify_core.QueryField(fieldName: "brandname");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final BUYED = amplify_core.QueryField(fieldName: "buyed");
  static final MRP = amplify_core.QueryField(fieldName: "mrp");
  static final SELLINGVLUE = amplify_core.QueryField(fieldName: "sellingvlue");
  static final LAT = amplify_core.QueryField(fieldName: "lat");
  static final LON = amplify_core.QueryField(fieldName: "lon");
  static final COMPANY_NAME = amplify_core.QueryField(fieldName: "company_name");
  static final SHIPERNAME = amplify_core.QueryField(fieldName: "shipername");
  static final BOXCONTENT = amplify_core.QueryField(fieldName: "boxcontent");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final FULLDESCRIPTION = amplify_core.QueryField(fieldName: "fulldescription");
  static final ISDIFFRENTIABLE = amplify_core.QueryField(fieldName: "isdiffrentiable");
  static final ARRAYNAME = amplify_core.QueryField(fieldName: "arrayname");
  static final ARRAYAMOUNT = amplify_core.QueryField(fieldName: "arrayamount");
  static final ARRAYMRP = amplify_core.QueryField(fieldName: "arraymrp");
  static final ARRAYSTOCKS = amplify_core.QueryField(fieldName: "arraystocks");
  static final TOTALSTOCK = amplify_core.QueryField(fieldName: "totalstock");
  static final PICTURE = amplify_core.QueryField(fieldName: "picture");
  static final FAVORITES = amplify_core.QueryField(fieldName: "favorites");
  static final WAITLIST = amplify_core.QueryField(fieldName: "waitlist");
  static final UNIQUEID = amplify_core.QueryField(fieldName: "uniqueid");
  static final CATEGOR = amplify_core.QueryField(fieldName: "categor");
  static final OFFER = amplify_core.QueryField(fieldName: "offer");
  static final FIRST = amplify_core.QueryField(fieldName: "first");
  static final TOTALBUYED = amplify_core.QueryField(fieldName: "totalbuyed");
  static final FIRSTADDED = amplify_core.QueryField(fieldName: "firstadded");
  static final INTSS = amplify_core.QueryField(fieldName: "intss");
  static final WEIGHT = amplify_core.QueryField(fieldName: "weight");
  static final DIMENSION = amplify_core.QueryField(fieldName: "dimension");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProductModel";
    modelSchemaDefinition.pluralName = "ProductModels";
    
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
      key: ProductModel.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.BRANDNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.BUYED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.MRP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.SELLINGVLUE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.LAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.LON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.COMPANY_NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.SHIPERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.BOXCONTENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.FULLDESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.ISDIFFRENTIABLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.ARRAYNAME,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.ARRAYAMOUNT,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.int.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.ARRAYMRP,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.int.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.ARRAYSTOCKS,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.int.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.TOTALSTOCK,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.PICTURE,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.FAVORITES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.WAITLIST,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.UNIQUEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.CATEGOR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.OFFER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.FIRST,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.TOTALBUYED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.FIRSTADDED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.INTSS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.WEIGHT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ProductModel.DIMENSION,
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

class _ProductModelModelType extends amplify_core.ModelType<ProductModel> {
  const _ProductModelModelType();
  
  @override
  ProductModel fromJson(Map<String, dynamic> jsonData) {
    return ProductModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProductModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ProductModel] in your schema.
 */
class ProductModelModelIdentifier implements amplify_core.ModelIdentifier<ProductModel> {
  final String id;

  /** Create an instance of ProductModelModelIdentifier using [id] the primary key. */
  const ProductModelModelIdentifier({
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
  String toString() => 'ProductModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProductModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}