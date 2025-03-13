void main() {
  var states = {
    'Abia': 'Umuahia - 3650000',
    'Adamawa': 'Yola - 4080000',
    'Akwa Ibom': 'Uyo- 5300000',
    'Anambra': 'Awka - 5610000',
  };

  print(states);
  states.addAll({"Kano": "5563665"});
  print('Adding Kano: $states');
}
