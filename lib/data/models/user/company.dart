import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
	final String? name;
	final String? catchPhrase;
	final String? bs;

	const Company({this.name, this.catchPhrase, this.bs});

	@override
	String toString() {
		return 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
	}

	factory Company.fromJson(Map<String, dynamic> json) {
		return _$CompanyFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CompanyToJson(this);

	Company copyWith({
		String? name,
		String? catchPhrase,
		String? bs,
	}) {
		return Company(
			name: name ?? this.name,
			catchPhrase: catchPhrase ?? this.catchPhrase,
			bs: bs ?? this.bs,
		);
	}
}
