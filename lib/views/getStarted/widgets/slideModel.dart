class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    this.imageUrl,
    this.title,
    this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/getstarted1.svg',
    title: "Enjoy cooking",
    description: 'Delicious restaurant recipes on your phone',
  ),
  Slide(
      imageUrl: 'assets/images/getstarted2.svg',
      title: 'Chef recipes',
      description:
          "Recipes written and made simple by chefs just with a touch"),
  Slide(
      imageUrl: 'assets/images/getstarted3.svg',
      title: 'Detailled Recipes',
      description:
          "Have all the details ingredients of many recipes, by a simple click"),
];
