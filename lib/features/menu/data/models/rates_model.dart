class RatesModel {
  int? ratingsCount;
  double? avgRating;
  int? oneStarTotal;
  int? twoStarsTotal;
  int? threeStarsTotal;
  int? fourStarsTotal;
  int? fiveStarsTotal;

  RatesModel(
      {this.ratingsCount,
      this.avgRating,
      this.oneStarTotal,
      this.twoStarsTotal,
      this.threeStarsTotal,
      this.fourStarsTotal,
      this.fiveStarsTotal});

  RatesModel.fromJson(Map<String, dynamic> json) {
    ratingsCount = json['ratings_count'];
    avgRating = json['avg_rating'];
    oneStarTotal = json['one_star_total'];
    twoStarsTotal = json['two_stars_total'];
    threeStarsTotal = json['three_stars_total'];
    fourStarsTotal = json['four_stars_total'];
    fiveStarsTotal = json['five_stars_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ratings_count'] = ratingsCount;
    data['avg_rating'] = avgRating;
    data['one_star_total'] = oneStarTotal;
    data['two_stars_total'] = twoStarsTotal;
    data['three_stars_total'] = threeStarsTotal;
    data['four_stars_total'] = fourStarsTotal;
    data['five_stars_total'] = fiveStarsTotal;
    return data;
  }
}
