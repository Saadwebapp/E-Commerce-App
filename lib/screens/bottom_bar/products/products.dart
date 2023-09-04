import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/utils/utils.dart';

import '../../../routes/screen_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key,    }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ref = FirebaseDatabase.instance.ref("Products");
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:Column(

          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              auth.signOut().then((value) {
                Navigator.pushNamed(context, RoutesName.loginScreen);
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });

            }, icon: Icon(Icons.logout_outlined)),
            SizedBox(
              width: 10.w, // Space between button and TextFormField
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0.r)),
                ),
              ),
            ),
            ),
          ],
        ),
            // Expanded(
            //   child: FirebaseAnimatedList(
            //     query: ref,
            //     itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            //       // Check if snapshot or snapshot.value is null
            //       if (snapshot == null || snapshot.value == null) {
            //         return CircularProgressIndicator(); // or an error message or an empty view
            //       }
            //       List<dynamic> items = snapshot.value as List<dynamic>;
            //       // Access data from the snapshot and create the GridView.builder here
            //       return GridView.builder(
            //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           childAspectRatio: 0.7, // Adjust this as needed
            //         ),
            //         itemCount: snapshot.value.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           DataSnapshot itemSnapshot = snapshot.value[index];
            //           String name = itemSnapshot.child("Name").value.toString();
            //           String price = itemSnapshot.child("Price").value.toString();
            //           String imageUrl = itemSnapshot.child("ImageUrl").value.toString(); // Replace with your image URL field
            //
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            //             child: Container(
            //               height: 400,
            //               decoration: BoxDecoration(
            //                 color: Color(0xffF3F6F8),
            //                 borderRadius: BorderRadius.circular(40),
            //               ),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.end,
            //                 children: [
            //                   Image.network(
            //                     imageUrl,
            //                     width: 130,
            //                     height: 150,
            //                   ),
            //                   SizedBox(height: 5),
            //                   Text(
            //                     name,
            //                     style: TextStyle(
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 16,
            //                     ),
            //                   ),
            //                   SizedBox(height: 5),
            //                   Text(
            //                     "\$ $price",
            //                     style: TextStyle(
            //                       color: Color(0xff171717),
            //                       fontSize: 12,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
            Expanded(
              child:FirebaseAnimatedList(query: ref, itemBuilder: (context,snapshot, animation,index){

                // return GridView.builder(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2, // Do cards aik row mein rakhna hai.
                //     childAspectRatio: (.35.sh/1.sw),
                //   ),
                //
                //   itemCount: 10, // Total cards
                //   itemBuilder: (BuildContext context, int index) {
                    return
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                      child: Container(
                        height: 400.h,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F6F8),
                          borderRadius: BorderRadius.circular(40.r),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.network(
                              "https://images.pexels.com/photos/9444052/pexels-photo-9444052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                              width: 130.w, // Set the width of the image
                              height: 150.h, // Set the height of the image
                            ),SizedBox(height: 5.h,),
                            Text(snapshot.child("Name").value.toString(),style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp
                            ),),
                            SizedBox(height: 5.h,),
                            Text(
                        "\$ ${snapshot.child("Price").value.toString()}",style: TextStyle(
                                color: Color(0xff171717),
                                fontSize: 12.sp
                            ),),

                          ],
                        ),
                      ),
                    );
                  },
                // );
              // }
              )
            ),

          ],
        )

      ),
    );
  }
}
