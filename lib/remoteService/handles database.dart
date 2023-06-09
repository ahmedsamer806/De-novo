import 'package:fashion_app/model/mesuares.dart';
import 'package:fashion_app/model/recommended.dart';
import 'package:fashion_app/model/shop.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class RemoteServices {
  static final  databaseReference = FirebaseDatabase.instance.reference();
  static late List<Shop> Shops_list;
  static late List<Recommended> Recommended_list;
  static late List<Measure> measure_list;

  static  readShopsData()async {
     List<Shop>s_list=[];
    late Shop temp;
    databaseReference.child('shop').once().then((snap) {
      snap.snapshot.children.forEach((element) { 
      temp=new Shop(
          id:element.child('ID').value.toString() ,
          name: element.child('Name').value.toString(),
          price:element.child('Price').value.toString(),
          gender: element.child('Gender').value.toString());
      print(temp.id);
      s_list.add(temp);
      });
      print(s_list.length);
      Shops_list=s_list ;
    });

   // return s_list;
  }

  static readRecommendedData() {
    print("ana hana");
    List<Recommended>s_list=[];
    late Recommended temp;
    databaseReference.child('recommended').once().then((snap) {
      print(snap.snapshot.children);
      snap.snapshot.children.forEach((element) {
        temp=new Recommended(
            id: element.child('ID').value.toString(),
            name: element.child('Name').value.toString(),
            gender: element.child('Gender').value.toString(),
            category: element.child('Category').value.toString(),
            recommendedBrand: element.child('Recommended Brand').value.toString());
        print(temp.name);
        s_list.add(temp);
      });
      print(s_list.length);
      Recommended_list=s_list;
    });

    return s_list;
  }


  static List<Measure> readMeasureData() {
    List<Measure>s_list=[];
    late Measure temp;
    databaseReference.child('mesuament').once().then((snap) {
      print(snap.snapshot.children);
      snap.snapshot.children.forEach((element) {
        temp=new Measure(
            id: element.child('ID').value,
            name: element.child('Name').value,
            weight: element.child('Weight').value,
            gender: element.child('Gender').value);
        s_list.add(temp);
      });
      print(s_list);
      measure_list=s_list;
    });

    return s_list;
  }

}


/* List<Course_data>courses=[];
        databaseReference.child('courses').once().then((snap) {
         // print(snap.snapshot.value.runtimeType);
          Course_data temp;
          snap.snapshot.children.forEach((element) {
            print(element.child("Course Name").value.toString() );
            temp=new Course_data(
                course_name: element.child("Course Name").value.toString(),
                //desc:element.child("Course Name").value.toString()+ Course_data.desc  ,//element.child("Description").value.toString(),
                duration: element.child("Duration").value.toString(),
                id: element.child("ID").value.toString(),
                price: element.child("Price").value.toString(),
                type: element.child("Type").value.toString()
            );
            courses.add(temp);
            print("=======================================================");
          });
          print(courses.length);

          */