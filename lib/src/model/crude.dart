import 'dart:convert';

RefineriesData refineriesDataFromJson(String str) => RefineriesData.fromJson(json.decode(str));

String refineriesDataToJson(RefineriesData data) => json.encode(data.toJson());

class RefineriesData {
    String indexName;
    String title;
    String desc;
    int created;
    int updated;
    DateTime createdDate;
    DateTime updatedDate;
    String active;
    String visualizable;
    String catalogUuid;
    String source;
    String orgType;
    List<String> org;
    List<String> sector;
    List<Field> field;
    TargetBucket targetBucket;
    String message;
    String version;
    String status;
    int total;
    int count;
    String limit;
    String offset;
    List<Record> records;

    RefineriesData({
        required this.indexName,
        required this.title,
        required this.desc,
        required this.created,
        required this.updated,
        required this.createdDate,
        required this.updatedDate,
        required this.active,
        required this.visualizable,
        required this.catalogUuid,
        required this.source,
        required this.orgType,
        required this.org,
        required this.sector,
        required this.field,
        required this.targetBucket,
        required this.message,
        required this.version,
        required this.status,
        required this.total,
        required this.count,
        required this.limit,
        required this.offset,
        required this.records,
    });

    factory RefineriesData.fromJson(Map<String, dynamic> json) => RefineriesData(
        indexName: json["index_name"],
        title: json["title"],
        desc: json["desc"],
        created: json["created"],
        updated: json["updated"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        active: json["active"],
        visualizable: json["visualizable"],
        catalogUuid: json["catalog_uuid"],
        source: json["source"],
        orgType: json["org_type"],
        org: List<String>.from(json["org"].map((x) => x)),
        sector: List<String>.from(json["sector"].map((x) => x)),
        field: List<Field>.from(json["field"].map((x) => Field.fromJson(x))),
        targetBucket: TargetBucket.fromJson(json["target_bucket"]),
        message: json["message"],
        version: json["version"],
        status: json["status"],
        total: json["total"],
        count: json["count"],
        limit: json["limit"],
        offset: json["offset"],
        records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "index_name": indexName,
        "title": title,
        "desc": desc,
        "created": created,
        "updated": updated,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "active": active,
        "visualizable": visualizable,
        "catalog_uuid": catalogUuid,
        "source": source,
        "org_type": orgType,
        "org": List<dynamic>.from(org.map((x) => x)),
        "sector": List<dynamic>.from(sector.map((x) => x)),
        "field": List<dynamic>.from(field.map((x) => x.toJson())),
        "target_bucket": targetBucket.toJson(),
        "message": message,
        "version": version,
        "status": status,
        "total": total,
        "count": count,
        "limit": limit,
        "offset": offset,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
    };
}

class Field {
    String name;
    String id;
    String type;

    Field({
        required this.name,
        required this.id,
        required this.type,
    });

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "type": type,
    };
}

class Record {
    Month month;
    String year;
    String oilCompanies;
    String quantity000MetricTonnes;

    Record({
        required this.month,
        required this.year,
        required this.oilCompanies,
        required this.quantity000MetricTonnes,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        month: monthValues.map[json["_month_"]]!,
        year: json["year"],
        oilCompanies: json["oil_companies_"],
        quantity000MetricTonnes: json["quantity_000_metric_tonnes_"],
    );

    Map<String, dynamic> toJson() => {
        "_month_": monthValues.reverse[month],
        "year": year,
        "oil_companies_": oilCompanies,
        "quantity_000_metric_tonnes_": quantity000MetricTonnes,
    };
}

enum Month {
    NOVEMBER,
    OCTOBER,
    SEPTEMBER
}

final monthValues = EnumValues({
    "November": Month.NOVEMBER,
    "October": Month.OCTOBER,
    "September": Month.SEPTEMBER
});

class TargetBucket {
    String index;
    String type;
    String field;

    TargetBucket({
        required this.index,
        required this.type,
        required this.field,
    });

    factory TargetBucket.fromJson(Map<String, dynamic> json) => TargetBucket(
        index: json["index"],
        type: json["type"],
        field: json["field"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "type": type,
        "field": field,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
