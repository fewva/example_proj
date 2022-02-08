import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable()
class Geo {
	final String? lat;
	final String? lng;

	const Geo({this.lat, this.lng});

	@override
	String toString() => 'Geo(lat: $lat, lng: $lng)';

	factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

	Map<String, dynamic> toJson() => _$GeoToJson(this);

	Geo copyWith({
		String? lat,
		String? lng,
	}) {
		return Geo(
			lat: lat ?? this.lat,
			lng: lng ?? this.lng,
		);
	}
}
