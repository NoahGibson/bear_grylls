class DescriptionClassifier {

  getSpecies(Map descriptionMap) {
    if (descriptionMap.containsKey('kingdom')) {
      if (descriptionMap.containsKey('animal')) {
        if (descriptionMap['color'] == 'brown') {
          return ['animals', 'grizzly bear'];
        }
        if (descriptionMap['color'] == 'white') {
          return ['animals', 'polar bear'];
        }
        if (descriptionMap['color'] == 'black') {
          return ['animals', 'black widow spider'];
        }
        if (descriptionMap['color'] == 'green') {
          return ['animals', 'american alligator'];
        }
        if (descriptionMap['color'] == 'grey')  {
          return ['animals', 'domestic cat'];
        }
      }
      else {
        if (descriptionMap['color'] == 'purple') {
          return ['plants', 'wolf\'s bane'];
        }
        if (descriptionMap['color'] == 'white') {
          return ['plants', 'white baneberry'];
        }
      }
    }
  }

}