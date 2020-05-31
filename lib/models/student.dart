class Student{
  int id;
  String firstName;
  String lastName;
  int grade;
  String status;


  Student(String firstName, String lastName, int grade){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }


//named constructor
  Student.widhtId(int id, String firstName, String lastName, int grade){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus {
    String message = "";
    if(this.grade>=50){
      message = "gecti";
    }else if( this.grade>=40){
      message = "bütünlemeye kaldı";
    }else {
      message = "kaldı";
    }
    this.status = message;
    return this.status;
  }
}