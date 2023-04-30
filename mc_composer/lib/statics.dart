String getImage(String food, bool? isTop) {
  String mcdo = 'McDoLogo.png';

  //CHECK BUN
  String result = getBunImage(food, isTop);
  if (result != mcdo) {
    return result;
  }

  //CHECK MEAT
  result = getMeatImage(food);
  if (result != mcdo) {
    return result;
  }

  //DEFAULT
  return mcdo;
}

String getBunImage(String bun, bool? isTop) {
  if (isTop == null) {
    switch (bun) {
      case ("Bun"):
        return 'Bun.jpeg';
      case ("Toasted Bun"):
        return 'ToastedBun.jpeg';
      case ("Brown Bun"):
        return 'BrownBun.jpeg';
      default:
        return 'McDoLogo.png';
    }
  } else {
    if (isTop) {
      switch (bun) {
        case ("Bun"):
          return 'BunTop.jpeg';
        case ("Toasted Bun"):
          return 'ToastedBunTop.jpeg';
        case ("Brown Bun"):
          return 'BrownBunTop.jpeg';
        default:
          return 'McDoLogo.png';
      }
    } else {
      switch (bun) {
        case ("Bun"):
          return 'BunBottom.jpeg';
        case ("Toasted Bun"):
          return 'ToastedBunBottom.jpeg';
        case ("Brown Bun"):
          return 'BrownBunBottom.jpeg';
        default:
          return 'McDoLogo.png';
      }
    }
  }
}

String getBunImageI(int bun, bool? isTop) {
  if (isTop == null) {
    switch (bun) {
      case (0):
        return 'Bun.jpeg';
      case (1):
        return 'ToastedBun.jpeg';
      case (2):
        return 'BrownBun.jpeg';
      default:
        return 'McDoLogo.png';
    }
  } else {
    if (isTop) {
      switch (bun) {
        case (0):
          return 'BunTop.jpeg';
        case (1):
          return 'ToastedBunTop.jpeg';
        case (2):
          return 'BrownBunTop.jpeg';
        default:
          return 'McDoLogo.png';
      }
    } else {
      switch (bun) {
        case (0):
          return 'BunBottom.jpeg';
        case (1):
          return 'ToastedBunBottom.jpeg';
        case (2):
          return 'BrownBunBottom.jpeg';
        default:
          return 'McDoLogo.png';
      }
    }
  }
}

String getMeatImage(String meat) {
  switch (meat) {
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

String getMeatImageI(int meat) {
  switch (meat) {
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
