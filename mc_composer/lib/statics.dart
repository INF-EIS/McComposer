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

  //CHECK VEGETABLE
  result = getVegetableImage(food);
  if (result != mcdo) {
    return result;
  }

  //CHECK SAUCE
  result = getSauceImage(food);
  if (result != mcdo) {
    return result;
  }

  //CHECK EXTRA
  result = getExtraImage(food);
  if (result != mcdo) {
    return result;
  }

  //DEFAULT
  return mcdo;
}

String getImageI(int food) {
  String mcdo = 'McDoLogo.png';

  //CHECK MEAT
  String result = getMeatImageI(food);
  if (result != mcdo) {
    return result;
  }
  int meatSize = 6;

  //CHECK VEGETABLE
  result = getVegetableImageI(food - meatSize);
  if (result != mcdo) {
    return result;
  }
  int vegetableSize = 3;

  //CHECK SAUCE
  result = getSauceImageI(food - meatSize - vegetableSize);
  if (result != mcdo) {
    return result;
  }
  int sauceSize = 3;

  //CHECK EXTRA
  result = getExtraImageI(food - meatSize - vegetableSize - sauceSize);
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

String getVegetableImage(String vegetable) {
  switch (vegetable) {
    case ("Lettuce"):
      return 'Lettuce.png';
    case ("Tomato"):
      return 'Tomato.jpeg';
    case ("Pickles"):
      return 'Pickles.jpeg';
    default:
      return 'McDoLogo.png';
  }
}

String getVegetableImageI(int vegetable) {
  switch (vegetable) {
    case (0):
      return 'Lettuce.png';
    case (1):
      return 'Tomato.jpeg';
    case (2):
      return 'Pickles.jpeg';
    default:
      return 'McDoLogo.png';
  }
}

String getSauceImage(String sauce) {
  switch (sauce) {
    case ("Ketchup"):
      return 'Ketchup.png';
    case ("Mayonaise"):
      return 'Mayonaise.png';
    case ("BBQ"):
      return 'BBQ.png';
    default:
      return 'McDoLogo.png';
  }
}

String getSauceImageI(int sauce) {
  switch (sauce) {
    case (0):
      return 'Ketchup.png';
    case (1):
      return 'Mayonaise.png';
    case (2):
      return 'BBQ.png';
    default:
      return 'McDoLogo.png';
  }
}

String getExtraImage(String extra) {
  switch (extra) {
    case ("Cheddar"):
      return 'Cheddar.jpeg';
    case ("Bicky Onions"):
      return 'BickyOnions.jpeg';
    default:
      return 'McDoLogo.png';
  }
}

String getExtraImageI(int extra) {
  switch (extra) {
    case (0):
      return 'Cheddar.jpeg';
    case (1):
      return 'BickyOnions.jpeg';
    default:
      return 'McDoLogo.png';
  }
}

