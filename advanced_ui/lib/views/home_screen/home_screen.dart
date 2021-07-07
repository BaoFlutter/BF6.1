import 'package:advanced_ui/resources/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // image cover widget
            coverImageWidget(
                assetPath: "assets/images/image_lake.jpeg",
                context: context),
            // title + star widget
            titleAndAdjustmentWidget(),
            // buttons + widget
            buttonsWidget(),
            // description Widget
            descriptionWidget(
                text: "Oeschinen Lake or Oeschinensee or Lago di Oeschinen,"
                    " with pristine nature and turquoise blue waters, "
                    "is literally heaven on earth. High mountains rise on all sides of the lake. "
                    "And Oeschinensee is like a sparkling gem in the centre."
                    " The lake is at the foot of Mountains – Blüemlisalp, Oeschinenhorn, Fründenhorn and Doldenhorn. "
                    "Osechinen Lake is fed by underwater streams as well as glacial waterfalls falling from the top of these mountains. "
                    "Make sure to check the webcam for weather conditions before you go here. And by the way, Oeschinen Lake is part of the UNESCO World Heritage Sites list."
            ),
          ],
        ),
      ),
    );
  }

  Widget coverImageWidget({@required String? assetPath, @required BuildContext? context}){
    return Image.asset(
      assetPath!,
      fit: BoxFit.cover,
      height: MediaQuery.of(context!).size.height / 2.5,
      width: MediaQuery.of(context!).size.width,
    );

  }

  Widget titleAndAdjustmentWidget(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // title
          Expanded(
               flex: 4,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Oeschin Lake Campground", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("KanderStarg, Switzerland", style: TextStyle(color: Colors.black26),)
                  ],
                ),
              )),
          // star
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.deepOrange,),
                    Text("41")
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget buttonsWidget()
  {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: buttonItemWidget(
                  icon: Icons.call,
                  color: Colors.blue,
                  text: CALL,
                  function: (){
                    print("Calling..");
                  })),
          Expanded(
            flex: 1,
              child: buttonItemWidget(
                  color: Colors.blue,
                  icon: Icons.navigation,
                  text: ROUTE,
                  function: (){
                    print("Routing..");
                  })),
          Expanded(
            flex: 1,
              child: buttonItemWidget(
                  color: Colors.blue,
                  icon: Icons.share,
                  text: SHARE,
                  function: (){
                    print("Sharing..");
                  }))
        ],
      ),

    );
  }

  Widget buttonItemWidget({ @required Color? color,  @required icon , @required String? text, @required function}){
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(icon, color: color,),
            SizedBox(height: 5,),
            Text(text!.toUpperCase(), style: TextStyle(color: color),)
          ],
        ),
      ),
      onTap: function,

    );

  }

  Widget descriptionWidget({ @required String? text}){
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
          text!,softWrap: true,
      ),
    );


  }


}
