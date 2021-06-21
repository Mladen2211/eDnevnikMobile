// To parse this JSON data, do
//
//     final EDResponse = EDResponseFromJson(jsonString);

import 'dart:convert';

EDResponse EDResponseFromJson(String str) => EDResponse.fromJson(json.decode(str));

String EDResponseToJson(EDResponse data) => json.encode(data.toJson());

class EDResponse {
    EDResponse({
        this.responseCode,
        this.responseMessage,
        this.errorList,
        this.result,
    });

    int? responseCode;
    String? responseMessage;
    List<ErrorList>? errorList;
    dynamic result;

    factory EDResponse.fromJson(Map<String, dynamic> json) => EDResponse(
        responseCode: json["ResponseCode"],
        responseMessage: json["ResponseMessage"],
        errorList: json["ErrorList"] == null ? null : List<ErrorList>.from(json["ErrorList"].map((x) => ErrorList.fromJson(x))),
        result: json["Result"],
    );

    Map<String, dynamic> toJson() => {
        "EDresponseCode": responseCode == null ? null : responseCode,
        "EDresponseMessage": responseMessage == null ? null : responseMessage,
        "errorList": errorList == null ? null : List<dynamic>.from(errorList!.map((x) => x.toJson())),
        "result": result == null ? null : result.toJson(),
    };
}

class ErrorList {
    ErrorList({
        this.errorDescription,
        this.valueField,
    });

    String? errorDescription;
    String? valueField;

    factory ErrorList.fromJson(Map<String, dynamic> json) => ErrorList(
        errorDescription: json["errorDescription"] == null ? null : json["errorDescription"],
        valueField: json["valueField"] == null ? null : json["valueField"],
    );

    Map<String, dynamic> toJson() => {
        "errorDescription": errorDescription == null ? null : errorDescription,
        "valueField": valueField == null ? null : valueField,
    };
}