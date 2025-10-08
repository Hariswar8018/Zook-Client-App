import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/main.dart';
import 'package:step_progress/step_progress.dart';
import 'package:zook/Global/others.dart';
import 'package:zook/Global/send.dart';
import 'package:zook/Global/widgets.dart';
import 'dart:typed_data';
import '../models/SellerModel.dart';

class CreateSeller extends StatefulWidget {
  const CreateSeller({super.key});

  @override
  State<CreateSeller> createState() => _CreateSellerState();
}

class _CreateSellerState extends State<CreateSeller> {

  late StepProgressController stepProgressController;

  Uint8List? banner, logo, gstfront,gstback ;


  @override
  void initState() {
    super.initState();
    stepProgressController = StepProgressController(totalSteps: 5);
  }

  void onUpdate(){
    stepProgressController = StepProgressController(totalSteps: 5);
  }
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('No Image Selected');
  }
  @override
  void dispose() {
    stepProgressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: 120,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff86DEDF),
                  Color(0xffA4E5CF)
                ])
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Create Zook Seller Account",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22),),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.support_agent),SizedBox(width: 5,),
                    Text(" Support at : +91-7978097489"),SizedBox(width: 5,),
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
                SizedBox(height: 14,)
              ],
            ),
          ),
          progress?LinearProgressIndicator():SizedBox(),
          Container(
            width: w,
            height: 80,
            child: StepProgress(
              totalSteps: 5,
              padding: const EdgeInsets.all(10),
              controller: stepProgressController,
              lineSubTitles: const [
                'Info',
                'Profile',
                "Upload",
                'Other',
              ],currentStep: i,
              theme: const StepProgressThemeData(
                stepLineSpacing: 28,
                stepLineStyle: StepLineStyle(
                  lineThickness: 10,
                  isBreadcrumb: true,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: w,
            height: h-230-48,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: colum(w),
              ),
            )
          ),
        ],
      ),
      persistentFooterButtons: [
        progress?Center(child: CircularProgressIndicator()):i==0?InkWell(
            onTap: (){
              if(!isChecked){
                Send.message(context, "Please give Consent", false);
                return ;
              }
              next();
            },
            child: GW.button("Continue to Fill Application", w)):
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: previous,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Global.blue,
                child: Icon(Icons.arrow_back,color: Colors.white,),
              ),
            ),
            InkWell(
                onTap:next,
                child: GW.button(i==4?"Complete Form & Submit":"Continue to Fill Application", w-80)),
          ],
        )
      ],
      backgroundColor: Colors.white,
    );
  }
  Widget colum(double w){
    if(i==0){
      return r1(w);
    }else if(i==1){
      return r2(w);
    }else if(i==2){
      return r3(w);
    }else if(i==3){
      return r4(w);
    }
    return r5(w);
  }
  TextEditingController phone=TextEditingController();
  TextEditingController fax=TextEditingController();
  TextEditingController email=TextEditingController();

  TextEditingController myname=TextEditingController();
  Widget r5(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        t("Which Company Type you are in MSME ?"),
        SizedBox(height: 5,),
        Center(
          child: Container(
            width: w - 20,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(5), // Optional rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: DropdownButtonHideUnderline( // Removes underline
                child: DropdownButton<String>(
                  isExpanded: true, // Makes dropdown fill the width
                  hint: Text("Select a Time"),
                  value: selectedValue,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        t("Your Phone Number"),
        t1("Please Write Your Phone Number to reach you"),
        te(w, phone,"7978097489"),
        t("Your Fax Number ( Optional ) "),
        t1("Please Write your FAX number to send Receipts"),
        te(w, fax,"91-555-123-4567"),
        t("Your Email Address"),
        t1("Please write your Company Email "),
        te(w, email,"contact@ctai.in"),
      ],
    );
  }
  String selectedValue = "Micro";

  List<String> items=[
    "Micro","Small","Middle","Not Under MSME ( Large Company )"
  ];

  Widget r2(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        t("Company/LLP Name"),
        t1("Please Type Exact Name appearing in GST"),
        te(w, name,"TechNova Pvt. Ltd. "),
        t("Your Name"),
        t1("Please Type your Exact Name appearing in Adhaar/Pan and Power of Attroney"),
        te(w, name,"Ayusman Samasi"),
        t("Description"),
        t1("Write a Small Description for your Business"),
        te(w, desc,"TechNova Solutions is a leading software development company specializing in innovative digital solutions"),
        t("Long Description"),
        t1("You could write as Long Description you want"),
        te(w, full_desc,"TechNova Solutions is a premier software development company committed to delivering cutting-edge technology solutions to businesses worldwide. With a team of skilled developers, designers, and strategists, the company focuses on creating custom software, mobile applications, and web platforms tailored to meet each client’s unique needs",desc: true),
      ],
    );
  }
  Widget r3(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        t("GST Number"),
        t1("Please Type Exact GST Number"),
        te(w, gst,"SJSJJW91"),
        t("Your Web/Social Link "),
        t1("Give any Social or your Own Website Link"),
        te(w, web1,"https://ayusdev.in"),
        t("Your Web/Social Link2"),
        t1("( Optional ) Give any more relevant Social/Website Link"),
        te(w, web2,"https://facebook.com/pune-street-food"),
      ],
    );
  }
  Widget r4(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            !isSwitched?Icon(Icons.camera_alt):Icon(Icons.image_search_rounded),
            SizedBox(width: 5,),
            t("Use Camera to Click Pictures ?"),
            Switch(
              value: !isSwitched,
              activeColor: Colors.green,
              
              onChanged: (bool value) {
                setState(() {
                  isSwitched = !value; // Update the boolean
                });
              },
            ),
          ],
        ),
        t("Upload Banner Image"),
        t1("Please Upload a Banner Image for your Seller Account ( 1080 x 720 )"),
        InkWell(
          onTap: () async {
            banner=await pickImage(isSwitched?ImageSource.gallery:ImageSource.camera);
            setState(() {

            });
          },
          child: banner==null?im(w):_buildImageContainer(banner,w),
        ),
        t("Upload Logo"),
        t1("Upload 512x512 px logo of your Business"),
        InkWell(
          onTap: () async {
            logo =await pickImage(isSwitched?ImageSource.gallery:ImageSource.camera);
            setState(() {

            });
          },
          child: logo==null?im(w,square: true):_buildImageContainer(logo,w,square: true),
        ),
        t("Upload GST ID CARD pic"),
        t1("It must be official ID Card with Same Name and GST no"),
        Row(
          children: [
            InkWell(
              onTap: () async {
                gstfront=await pickImage(isSwitched?ImageSource.gallery:ImageSource.camera);
                setState(() {

                });
              },
              child: gstfront==null?im(w,i: 1):_buildImageContainer(gstfront,w),
            ),
            SizedBox(width: 10,),
            InkWell(
              onTap: () async {
                gstback=await pickImage(isSwitched?ImageSource.gallery:ImageSource.camera);
                setState(() {

                });
              },
              child: gstback==null?im(w,i: 2):_buildImageContainer(gstback,w),
            ),
          ],
        )
      ],
    );
  }

  Widget im(double w,{bool square = false,int i= 0})=>Padding(
    padding: const EdgeInsets.only(top: 6.0,bottom: 15),
    child: Container(
      width:square?w/4: w/3,
      height: square?w/4:(w/3)*9/16,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          i==2?Icon(Icons.flip_camera_ios):Icon(Icons.image),
          Text(i==0?"Click to Upload":"Upload ${i==1?"Front":"Back"} Picture",style: TextStyle(fontSize: 7),)
        ],
      ),
    ),
  );
  bool isSwitched = false;
  Widget _buildImageContainer(Uint8List? imageData,double w,{bool square=false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0,bottom: 15),
      child: Container(
        width: square?w/4:w/3,
        height: square?w/4:(w/3)*9/16,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade400
          ),
          image: DecorationImage(image: MemoryImage(imageData!),fit: BoxFit.cover)
        ),
      ),
    );
  }

TextEditingController name=TextEditingController();
  TextEditingController desc=TextEditingController();
  TextEditingController full_desc=TextEditingController();
  TextEditingController web1=TextEditingController();
  TextEditingController web2= TextEditingController();
  TextEditingController gst=TextEditingController();

  Widget te(double w,TextEditingController controller, String hint,{ bool no = false,bool desc=false})=>Padding(
    padding: const EdgeInsets.only(top: 5.0,bottom: 16),
    child: Container(
      width : w  , height : desc?140:50,
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
              minLines: desc?5:1,
              maxLines: desc?100:1,
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
  bool progress=false;

  Future<void> createSellerModel() async {
    try {
      setState(() {
        progress=true;
      });
      final user = await Amplify.Auth.getCurrentUser();
      final String username ="hariswarsamasi@gmail.com";
      print(user);
      final model = SellerModel(
          uniqueid: username,
          banner: "Lorem ipsum dolor sit amet",
          logo: "Lorem ipsum dolor sit amet",
          name: name.text,
          description: desc.text,
          full_description: full_desc.text,
          rating_star: 3,
          total_rated: 1,
          total_positive: 1,
          joined: DateTime.now().toString(),
          awsemail: username,
          weblink: web1.text,
          weblink1: web2.text,
          gstnumber: gst.text,
          gstpic: "Lorem ipsum dolor sit amet",
          block: false,
          review: true,
          maxproducts: 1020,
          top: false,
          featuredproductid: "",
        adhaarid: "",adhaarpic: "",address: "",lat: 0,lon: 0,officer: "",address1: "",
        headquaters: "",headlat: 1,headlon: 1,mcaid: "",
        categories_applied: [],note: "",documnets: ""
      );
      final request = ModelMutations.create(model);
      final response = await Amplify.API.mutate(request: request).response;

      final createdSellerModel = response.data;
      if (createdSellerModel == null) {
        safePrint('errors: ${response.errors}');
        Send.message(context, "${response.errors}",false);
        setState(() {
          progress=false;
        });
        return;
      }
      safePrint('Mutation result: ${createdSellerModel.id}');
      Send.message(context, "Success", true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage(title: "nj")));
      setState(() {
        progress=false;
      });
    } on ApiException catch (e) {
      setState(() {
        progress=false;
      });
      safePrint('Mutation failed: $e');
      Send.message(context, "$e",false);
    }
  }
  Future<String> getUserEmail() async {
    try {
      // Get current authenticated user
      final user = await Amplify.Auth.getCurrentUser();
      print('Username: ${user.username}');

      // Get user attributes
      final attributes = await Amplify.Auth.fetchUserAttributes();

      // Find email attribute
      final emailAttr = attributes.firstWhere(
            (attr) => attr.userAttributeKey == 'email',
        orElse: () =>  AuthUserAttribute( value: 'Not found', userAttributeKey: AuthUserAttributeKey.email),
      );

      print('Email: ${emailAttr.value}');
      return emailAttr.value;
    } catch (e) {
      print('Error fetching user email: $e');
      return "error";
    }
  }



  Widget t(String str)=>Text(str
    ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),);
  Widget t1(String str)=> Text(str,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),);

  Widget r1(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text("Let's Complete your Seller Application"
          ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
        Text("Create your seller account and reach thousands of buyers instantly. List your products, manage orders easily, and grow your business—all in one place. Join Zook today and start earning like top online sellers!"
          ,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
        SizedBox(height: 20,),
        Text("Documents to be Handy : "
          ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
        SizedBox(height: 5,),
        col(w, "assets/gst.webp", "GST Details", "GST Details help verify your Seller"),
        col(w, "assets/1747945.webp", "Adhaar Details", "To Verify your Identity"),
        col(w, "assets/details.png", "Personal Details", "Your Basic and Business Details"),
        SizedBox(height: 20,),
        Text("You Verify that "
          ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: isChecked,checkColor: Colors.white,
              activeColor: Global.blue,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Container(
                width: w-90,
                child: Text("I consent that I am a Real Seller under Company/LLP registered with MCA Act of India",
                style: TextStyle(fontSize: 12),)),
          ],
        ),
        SizedBox(height: 5,),

      ],

    );
  }
  bool isChecked = false;

  int i = 0;
  next(){
    if(i==4){
      showDialog(
        context: context,
        barrierDismissible: false, // Prevents closing when tapping outside
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Submit Form'),
            content: const Text('Are you sure you want to Submit ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Perform action and close dialog
                  createSellerModel();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return ;
    }
    setState(() {
      i++;
      stepProgressController.nextStep();
    });
  }
  previous(){
    if(i==0){
      return ;
    }
    setState(() {
      i--;
      stepProgressController.previousStep();
    });
  }

  Widget col(double w,String assetName, String name,String desc){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: w-20,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CircleAvatar(
                radius: w/11,
                backgroundColor: Colors.grey.shade400,
                child: 
                CircleAvatar(
                  radius: w/11-1,
                  backgroundColor: Colors.white,
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Image.asset(assetName,fit: BoxFit.contain,),
                  ),
                )
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                Text(desc)
              ],
            )
          ],
        ),
      ),
    );
  }
}
