
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gov_data/src/model/crude.dart';

final crudeOilData=FutureProvider((ref){
  const url="https://api.data.gov.in/resource/8d3b6596-b09e-4077-aebf-425193185a5b?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json";
  return http.get(Uri.parse(url)).then((value) =>refineriesDataFromJson(value.body));
});

// Make more providers and returrn the get request