enum Gender{
  male,
  female;
  @override
  String toString(){
    return switch(this){
      Gender.male => 'Male',
      Gender.female => 'Female'
    };
  }
}

enum DangerLevel{
  none,
  low,
  moderate,
  high;
  @override
  String toString(){
    return switch(this){
      DangerLevel.low => 'Low',
      DangerLevel.moderate => 'Moderate',
      DangerLevel.high => 'High',
      DangerLevel.none => ''
    };
  }
}