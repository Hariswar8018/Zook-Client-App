


import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:zook/api.dart';

class GeminiScreen extends StatefulWidget {
  String names;bool istype;String desc ;
  GeminiScreen({super.key,required this.names,this.istype=false, this.desc=""});

  @override
  State<GeminiScreen> createState() => _GeminiScreenState();
}

class _GeminiScreenState extends State<GeminiScreen> {
  String response = ""; // To store Gemini's last response
  bool showSaveButton = false; // To show/hide save button

  @override
  void initState() {
    super.initState();
    gu();
  }

  void gu() {
    if(widget.istype){

      return ;
    }
    progress=true;
    getGeminiResponse(widget.names);
  }

  Widget te(double w,TextEditingController controller, String hint,{ bool no = false,bool desc=false
  })=>Padding(
    padding: const EdgeInsets.only(top: 5.0,bottom: 16),
    child: Container(
      width : w  , height : desc?180:50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Background color of the container
        borderRadius: BorderRadius.circular(5.0), // Rounded corners
      ),
      child: Padding(
          padding: desc?EdgeInsets.all(15): EdgeInsets.only( left :10, right : 18.0),
          child: Center(
            child: TextFormField(
              keyboardType: no?TextInputType.number:TextInputType.name,
              controller: controller,
              minLines: desc?9:1,
              maxLines: desc?100:1,
              readOnly: progress,
              decoration: InputDecoration(
                hintText: hint,
                isDense: true,
                border: InputBorder.none, // No border
              ),
            ),
          )
      ),
    ),
  );

  TextEditingController controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        // Show an exit confirmation dialog
        bool exitApp = await _showExitConfirmationDialog(context);
        return exitApp; // true = exit, false = stay
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: widget.istype?Column(
          children: [
            Container(
              width: w,
              height: 90,
              decoration: BoxDecoration(gradient:
              LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.yellow,
                  Colors.orangeAccent.shade100, // light orange
                ],
              ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("Using Zook AI to write",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22),),
                  ),SizedBox(height: 14,)
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(widget.desc,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: te(w, controller, "Start Writing.........Everything you known about your Product",desc: true),
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Confirm ?"),
                    content: Text("Are you sure you wriiten Everything needed to generrate Response"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(), // Stay on screen
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          progress=true;
                          widget.istype=false;
                          getGeminiResponse(widget.names+ " ${controller.text} "+" \nRemeber to Return only the Body and no heading");
                          setState(() {

                          });
                        },
                        child: Text("Yes, Generate"),
                      ),
                    ],
                  ),
                  );
                },
                child: Container(
                  height:50,width:MediaQuery.of(context).size.width-20,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(7),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.yellow,
                        Colors.orangeAccent.shade100, // light orange
                      ],
                    ),
                  ),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.rocket_launch,color: Colors.black,),
                      SizedBox(width: 6,),
                      Text("Generate Now",style: TextStyle(
                          color: Colors.black,
                          fontFamily: "RobotoS",fontWeight: FontWeight.w800
                      ),),
                    ],
                  )),
                ),
              ),
            ),
          ],
        ):SingleChildScrollView(
          child:Column(
          children: [
            Container(
              width: w,
              height: 90,
              decoration: BoxDecoration(gradient:
              LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.yellow,
                  Colors.orangeAccent.shade100, // light orange
                ],
              ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("Using Zook AI to write",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22),),
                  ),SizedBox(height: 14,)
                ],
              ),
            ),
            progress?LinearProgressIndicator():SizedBox(),
            response.isEmpty? SizedBox(height: 35):SizedBox(),
            response.isEmpty?Center(
              child: Image.network(
                "https://1000logos.net/wp-content/uploads/2024/02/Gemini-Logo.png",
                width: MediaQuery.of(context).size.width / 2,
              ),
            ):SizedBox(),
            SizedBox(height: 16,),
            response.isEmpty?Center(
              child: Text(
                '✍ Fetching Your Description',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
              ),
            ):SizedBox(),
            SizedBox(height: 10),
            if (response.isNotEmpty) // Show response only when available
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  response,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),),persistentFooterButtons: [
        response.isEmpty?SizedBox(): Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    bool exitApp = await _showExitConfirmationDialog(context);
                    exitApp?Navigator.pop(context):SizedBox();
                  },
                  child: Container(
                    height:45,width:MediaQuery.of(context).size.width/2-10,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(7),
                      color:Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 5, // The extent to which the shadow spreads
                          blurRadius: 7, // The blur radius of the shadow
                          offset: Offset(0, 3), // The position of the shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close,color: Colors.white,),
                        Center(child: Text(" Close",style: TextStyle(
                            color: Colors.white,
                            fontFamily: "RobotoS",fontWeight: FontWeight.w800
                        ),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 3,),
                InkWell(
                  onTap: (){
                    if(progress){
                      return ;
                    }
                    setState(() {
                      progress=true;
                    });
                    gu();
                  },
                  child: Container(
                    height:45,width:MediaQuery.of(context).size.width/2-10,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(7),
                      color:Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Shadow color with transparency
                          spreadRadius: 5, // The extent to which the shadow spreads
                          blurRadius: 7, // The blur radius of the shadow
                          offset: Offset(0, 3), // The position of the shadow
                        ),
                      ],
                    ),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.recycling,color: Colors.white,),
                        Text("Regenerate",style: TextStyle(
                            color: Colors.white,
                            fontFamily: "RobotoS",fontWeight: FontWeight.w800
                        ),),
                      ],
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4,),
            InkWell(
              onTap: () async {
                Navigator.pop(context, response);
              },
              child: Container(
                height:45,width:MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(7),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.yellow,
                      Colors.orangeAccent.shade100, // light orange
                    ],
                  ),
                ),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save,color: Colors.black,),
                    SizedBox(width: 6,),
                    Text("Yes I want this Description",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "RobotoS",fontWeight: FontWeight.w800
                    ),),
                  ],
                )),
              ),
            ),
          ],
        ),
      ],
      ),
    );
  }
  final String geminiresponse=DateTime.now().microsecondsSinceEpoch.toString();

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Exit AI Description Creation"),
        content: Text("Are you sure you want to CLose ! This will not be Saved"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Stay on screen
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Exit app
            child: Text("Exit"),
          ),
        ],
      ),
    ) ??
        false; // Default to false if dismissed
  }

  Future<void> getGeminiResponse(String prompt) async {

    final model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: Api.apikey,
    );

    try {
      final responseContent =
      await model.generateContent([Content.text(prompt)]);
      String geminiResponseText = responseContent.text ?? "No response";

      setState(() {
        response = geminiResponseText; // Store Gemini's response
        showSaveButton = true; // Show the "Save Response" button
        progress=false;
      });
    } catch (e) {
      print("Error fetching response from Gemini: $e");
    }
  }
  bool progress=false;
}