class ContentSidebar {
  String? title;
  String? image;

  ContentSidebar({this.title, this.image});
}

List<ContentSidebar> contentsHomepage = [
  ContentSidebar(
    title: "Flight",
    image: "images/flight_sidebar.png",
  ),
  ContentSidebar(
    title: "Stay Place",
    image: "images/stay_place_sidebar_icon.png",
  ),
  ContentSidebar(
    title: "Bus",
    image: "images/bus_sidebar_icon.png",
  ),
  ContentSidebar(
    title: "Rental",
    image: "images/rental_sidebar_icon.png",
  ),
  ContentSidebar(
    title: "Launch",
    image: "images/launch_sidebar_icon.png",
  ),
  ContentSidebar(
    title: "Tourist Package",
    image: "images/tourist_package_sidebar_icon.png",
  ),
  ContentSidebar(
    title: "Food Delivery",
    image: "images/food_delivery_icon.png",
  ),
];