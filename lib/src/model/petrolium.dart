import 'dart:convert';

PetroliumData petroliumDataFromJson(String str) => PetroliumData.fromJson(json.decode(str));

String petroliumDataToJson(PetroliumData data) => json.encode(data.toJson());

class PetroliumData {
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

    PetroliumData({
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

    factory PetroliumData.fromJson(Map<String, dynamic> json) => PetroliumData(
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
    String format;

    Field({
        required this.name,
        required this.id,
        required this.type,
        required this.format,
    });

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        id: json["id"],
        type: json["type"],
        format: json["format"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "type": type,
        "format": format,
    };
}

class Record {
    Month month;
    String year;
    String products;
    String quantity000MetricTonnes;
    DateTime updatedDate;

    Record({
        required this.month,
        required this.year,
        required this.products,
        required this.quantity000MetricTonnes,
        required this.updatedDate,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        month: monthValues.map[json["month"]]!,
        year: json["year"],
        products: json["products"],
        quantity000MetricTonnes: json["quantity_000_metric_tonnes_"],
        updatedDate: DateTime.parse(json["updated_date"]),
    );

    Map<String, dynamic> toJson() => {
        "month": monthValues.reverse[month],
        "year": year,
        "products": products,
        "quantity_000_metric_tonnes_": quantity000MetricTonnes,
        "updated_date": "${updatedDate.year.toString().padLeft(4, '0')}-${updatedDate.month.toString().padLeft(2, '0')}-${updatedDate.day.toString().padLeft(2, '0')}",
    };
}

enum Month {
    JULY,
    JUNE,
    MAY
}

final monthValues = EnumValues({
    "July": Month.JULY,
    "June": Month.JUNE,
    "May": Month.MAY
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
