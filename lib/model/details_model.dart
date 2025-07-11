// class MovieDetailsModel {
//   bool? adult;
//   String? backdropPath;
//   BelongsToCollection? belongsToCollection;
//   int? budget;
//   List<Genres>? genres;
//   String? homepage;
//   int? id;
//   String? imdbId;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   double? popularity;
//   String? posterPath;
//   List<ProductionCompanies>? productionCompanies;
//   List<ProductionCountries>? productionCountries;
//   String? releaseDate;
//   int? revenue;
//   int? runtime;
//   List<SpokenLanguages>? spokenLanguages;
//   String? status;
//   String? tagline;
//   String? title;
//   bool? video;
//   double? voteAverage;
//   int? voteCount;
//
//   MovieDetailsModel(
//       {this.adult,
//         this.backdropPath,
//         this.belongsToCollection,
//         this.budget,
//         this.genres,
//         this.homepage,
//         this.id,
//         this.imdbId,
//         this.originalLanguage,
//         this.originalTitle,
//         this.overview,
//         this.popularity,
//         this.posterPath,
//         this.productionCompanies,
//         this.productionCountries,
//         this.releaseDate,
//         this.revenue,
//         this.runtime,
//         this.spokenLanguages,
//         this.status,
//         this.tagline,
//         this.title,
//         this.video,
//         this.voteAverage,
//         this.voteCount});
//
//   MovieDetailsModel.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     belongsToCollection = json['belongs_to_collection'] != null
//         ?  BelongsToCollection.fromJson(json['belongs_to_collection'])
//         : null;
//     budget = json['budget'];
//     if (json['genres'] != null) {
//       genres = <Genres>[];
//       json['genres'].forEach((v) {
//         genres!.add( Genres.fromJson(v));
//       });
//     }
//     homepage = json['homepage'];
//     id = json['id'];
//     imdbId = json['imdb_id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     if (json['production_companies'] != null) {
//       productionCompanies = <ProductionCompanies>[];
//       json['production_companies'].forEach((v) {
//         productionCompanies!.add( ProductionCompanies.fromJson(v));
//       });
//     }
//     if (json['production_countries'] != null) {
//       productionCountries = <ProductionCountries>[];
//       json['production_countries'].forEach((v) {
//         productionCountries!.add( ProductionCountries.fromJson(v));
//       });
//     }
//     releaseDate = json['release_date'];
//     revenue = json['revenue'];
//     runtime = json['runtime'];
//     if (json['spoken_languages'] != null) {
//       spokenLanguages = <SpokenLanguages>[];
//       json['spoken_languages'].forEach((v) {
//         spokenLanguages!.add( SpokenLanguages.fromJson(v));
//       });
//     }
//     status = json['status'];
//     tagline = json['tagline'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['adult'] = adult;
//     data['backdrop_path'] = backdropPath;
//     if (belongsToCollection != null) {
//       data['belongs_to_collection'] = belongsToCollection!.toJson();
//     }
//     data['budget'] = budget;
//     if (genres != null) {
//       data['genres'] = genres!.map((v) => v.toJson()).toList();
//     }
//     data['homepage'] = homepage;
//     data['id'] = id;
//     data['imdb_id'] = imdbId;
//     data['original_language'] = originalLanguage;
//     data['original_title'] = originalTitle;
//     data['overview'] = overview;
//     data['popularity'] = popularity;
//     data['poster_path'] = posterPath;
//     if (productionCompanies != null) {
//       data['production_companies'] =
//           productionCompanies!.map((v) => v.toJson()).toList();
//     }
//     if (productionCountries != null) {
//       data['production_countries'] =
//           productionCountries!.map((v) => v.toJson()).toList();
//     }
//     data['release_date'] = releaseDate;
//     data['revenue'] = revenue;
//     data['runtime'] = runtime;
//     if (spokenLanguages != null) {
//       data['spoken_languages'] =
//           spokenLanguages!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = status;
//     data['tagline'] = tagline;
//     data['title'] = title;
//     data['video'] = video;
//     data['vote_average'] = voteAverage;
//     data['vote_count'] = voteCount;
//     return data;
//   }
// }
//
// class BelongsToCollection {
//   int? id;
//   String? name;
//   String? posterPath;
//   String? backdropPath;
//
//   BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});
//
//   BelongsToCollection.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     posterPath = json['poster_path'];
//     backdropPath = json['backdrop_path'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     data['poster_path'] = posterPath;
//     data['backdrop_path'] = backdropPath;
//     return data;
//   }
// }
//
// class Genres {
//   int? id;
//   String? name;
//
//   Genres({this.id, this.name});
//
//   Genres.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }
//
// class ProductionCompanies {
//   int? id;
//   String? logoPath;
//   String? name;
//   String? originCountry;
//
//   ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});
//
//   ProductionCompanies.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     logoPath = json['logo_path'];
//     name = json['name'];
//     originCountry = json['origin_country'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['logo_path'] = logoPath;
//     data['name'] = name;
//     data['origin_country'] = originCountry;
//     return data;
//   }
// }
//
// class ProductionCountries {
//   String? iso31661;
//   String? name;
//
//   ProductionCountries({this.iso31661, this.name});
//
//   ProductionCountries.fromJson(Map<String, dynamic> json) {
//     iso31661 = json['iso_3166_1'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['iso_3166_1'] = iso31661;
//     data['name'] = name;
//     return data;
//   }
// }
//
// class SpokenLanguages {
//   String? englishName;
//   String? iso6391;
//   String? name;
//
//   SpokenLanguages({this.englishName, this.iso6391, this.name});
//
//   SpokenLanguages.fromJson(Map<String, dynamic> json) {
//     englishName = json['english_name'];
//     iso6391 = json['iso_639_1'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['english_name'] = englishName;
//     data['iso_639_1'] = iso6391;
//     data['name'] = name;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final movieDetailsModel = movieDetailsModelFromJson(jsonString);

import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) => MovieDetailsModel.fromJson(json.decode(str));

String movieDetailsModelToJson(MovieDetailsModel data) => json.encode(data.toJson());

class MovieDetailsModel {
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  DateTime? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    belongsToCollection: json["belongs_to_collection"],
    budget: json["budget"],
    genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: json["production_companies"] == null ? [] : List<ProductionCompany>.from(json["production_companies"]!.map((x) => ProductionCompany.fromJson(x))),
    productionCountries: json["production_countries"] == null ? [] : List<ProductionCountry>.from(json["production_countries"]!.map((x) => ProductionCountry.fromJson(x))),
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    revenue: json["revenue"],
    runtime: json["runtime"],
    spokenLanguages: json["spoken_languages"] == null ? [] : List<SpokenLanguage>.from(json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "belongs_to_collection": belongsToCollection,
    "budget": budget,
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": productionCompanies == null ? [] : List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
    "production_countries": productionCountries == null ? [] : List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "revenue": revenue,
    "runtime": runtime,
    "spoken_languages": spokenLanguages == null ? [] : List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
    id: json["id"],
    logoPath: json["logo_path"],
    name: json["name"],
    originCountry: json["origin_country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_path": logoPath,
    "name": name,
    "origin_country": originCountry,
  };
}

class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({
    this.iso31661,
    this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
    iso31661: json["iso_3166_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iso_3166_1": iso31661,
    "name": name,
  };
}

class SpokenLanguage {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    englishName: json["english_name"],
    iso6391: json["iso_639_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "english_name": englishName,
    "iso_639_1": iso6391,
    "name": name,
  };
}

