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


/** This is an auto generated class representing the UserModel type in your schema. */
class UserModel extends amplify_core.Model {
  static const classType = const _UserModelModelType();
  final String id;
  final String? _Name;
  final String? _Email;
  final String? _Phone;
  final int? _orders;
  final int? _purchased;
  final String? _token;
  final String? _date;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelModelIdentifier get modelIdentifier {
      return UserModelModelIdentifier(
        id: id
      );
  }
  
  String? get Name {
    return _Name;
  }
  
  String? get Email {
    return _Email;
  }
  
  String? get Phone {
    return _Phone;
  }
  
  int? get orders {
    return _orders;
  }
  
  int? get purchased {
    return _purchased;
  }
  
  String? get token {
    return _token;
  }
  
  String? get date {
    return _date;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UserModel._internal({required this.id, Name, Email, Phone, orders, purchased, token, date, createdAt, updatedAt}): _Name = Name, _Email = Email, _Phone = Phone, _orders = orders, _purchased = purchased, _token = token, _date = date, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserModel({String? id, String? Name, String? Email, String? Phone, int? orders, int? purchased, String? token, String? date}) {
    return UserModel._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Name: Name,
      Email: Email,
      Phone: Phone,
      orders: orders,
      purchased: purchased,
      token: token,
      date: date);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
      id == other.id &&
      _Name == other._Name &&
      _Email == other._Email &&
      _Phone == other._Phone &&
      _orders == other._orders &&
      _purchased == other._purchased &&
      _token == other._token &&
      _date == other._date;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Name=" + "$_Name" + ", ");
    buffer.write("Email=" + "$_Email" + ", ");
    buffer.write("Phone=" + "$_Phone" + ", ");
    buffer.write("orders=" + (_orders != null ? _orders!.toString() : "null") + ", ");
    buffer.write("purchased=" + (_purchased != null ? _purchased!.toString() : "null") + ", ");
    buffer.write("token=" + "$_token" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserModel copyWith({String? Name, String? Email, String? Phone, int? orders, int? purchased, String? token, String? date}) {
    return UserModel._internal(
      id: id,
      Name: Name ?? this.Name,
      Email: Email ?? this.Email,
      Phone: Phone ?? this.Phone,
      orders: orders ?? this.orders,
      purchased: purchased ?? this.purchased,
      token: token ?? this.token,
      date: date ?? this.date);
  }
  
  UserModel copyWithModelFieldValues({
    ModelFieldValue<String?>? Name,
    ModelFieldValue<String?>? Email,
    ModelFieldValue<String?>? Phone,
    ModelFieldValue<int?>? orders,
    ModelFieldValue<int?>? purchased,
    ModelFieldValue<String?>? token,
    ModelFieldValue<String?>? date
  }) {
    return UserModel._internal(
      id: id,
      Name: Name == null ? this.Name : Name.value,
      Email: Email == null ? this.Email : Email.value,
      Phone: Phone == null ? this.Phone : Phone.value,
      orders: orders == null ? this.orders : orders.value,
      purchased: purchased == null ? this.purchased : purchased.value,
      token: token == null ? this.token : token.value,
      date: date == null ? this.date : date.value
    );
  }
  
  UserModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Name = json['Name'],
      _Email = json['Email'],
      _Phone = json['Phone'],
      _orders = (json['orders'] as num?)?.toInt(),
      _purchased = (json['purchased'] as num?)?.toInt(),
      _token = json['token'],
      _date = json['date'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Name': _Name, 'Email': _Email, 'Phone': _Phone, 'orders': _orders, 'purchased': _purchased, 'token': _token, 'date': _date, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Name': _Name,
    'Email': _Email,
    'Phone': _Phone,
    'orders': _orders,
    'purchased': _purchased,
    'token': _token,
    'date': _date,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserModelModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "Name");
  static final EMAIL = amplify_core.QueryField(fieldName: "Email");
  static final PHONE = amplify_core.QueryField(fieldName: "Phone");
  static final ORDERS = amplify_core.QueryField(fieldName: "orders");
  static final PURCHASED = amplify_core.QueryField(fieldName: "purchased");
  static final TOKEN = amplify_core.QueryField(fieldName: "token");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserModel";
    modelSchemaDefinition.pluralName = "UserModels";
    
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
      key: UserModel.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.PHONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.ORDERS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.PURCHASED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.TOKEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: UserModel.DATE,
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

class _UserModelModelType extends amplify_core.ModelType<UserModel> {
  const _UserModelModelType();
  
  @override
  UserModel fromJson(Map<String, dynamic> jsonData) {
    return UserModel.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserModel] in your schema.
 */
class UserModelModelIdentifier implements amplify_core.ModelIdentifier<UserModel> {
  final String id;

  /** Create an instance of UserModelModelIdentifier using [id] the primary key. */
  const UserModelModelIdentifier({
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
  String toString() => 'UserModelModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}