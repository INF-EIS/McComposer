String getMeatImage(String food) {
  switch (food) {
    case ("Beef Patty"):
      return 'BeefPatty1.png';
    case ("Pork Beef Patty"):
      return 'PorkCowPatty.jpeg';
    case ("Pork Patty"):
      return 'PorkPatty.jpeg';
    case ("Chicken Breasts"):
      return 'ChickenBreasts.jpeg';
    case ("Fried Chicken Breasts"):
      return 'FriedChickenBreasts.png';
    case ("5 Chicken Nuggets"):
      return 'ChickenNuggets.png';
    default:
      return 'McDoLogo.png';
  }
}

String getMeatImageI(int food) {
  switch (food) {
    case (0):
      return 'BeefPatty1.png';
    case (1):
      return 'PorkCowPatty.jpeg';
    case (2):
      return 'PorkPatty.jpeg';
    case (3):
      return 'ChickenBreasts.jpeg';
    case (4):
      return 'FriedChickenBreasts.png';
    case (5):
      return 'ChickenNuggets.png';
    default:
      return 'McDoLogo.png';
  }
}
