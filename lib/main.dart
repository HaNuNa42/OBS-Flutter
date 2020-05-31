import 'package:flutter/material.dart';
import 'package:flutterdersi/screens/students_add.dart';
import 'package:flutterdersi/models/student.dart';

void main() => runApp(MyApp());

//final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cupertino
    return MaterialApp(
        // theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.widhtId(1, "hatice", "nur", 98),
    Student.widhtId(2, "kadriye", "nur", 30),
    Student.widhtId(2, "esra", "nur", 40)
  ];

  Student selectedStudent = Student.widhtId(0, "hiç kimse", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
          backgroundColor: Colors.cyan,
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length, //listenin kaç kere döneceğini sorar
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    students[index].firstName + " " + students[index].lastName,
                    style: TextStyle(color: Colors.cyan),
                  ),
                  subtitle: Text("Sınavdan Aldığı Not: " +
                      students[index].grade.toString() +
                      " [" +
                      students[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                      // print(students[index].firstName + " seçildi");
                    });
                  },
                  onLongPress: () {
                    print("uzun basıldı");
                  },
                );
              }),
        ),

        const Divider(
          color: Colors.grey,
          height: 20,
        ),
        
        Text("seçili öğrenci " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.lightGreen,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("Yeni Öğrenci")
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.pink[400],
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle")
                  ],
                ),
                onPressed: () {
                  print("Güncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.yellow,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text("Sil")
                  ],
                ),
                onPressed: () {
                  print("Sil");
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
