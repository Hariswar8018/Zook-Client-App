import 'dart:io';
import 'dart:typed_data';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress/step_progress.dart';
import 'package:zook/Global/global_model.dart';
import 'package:zook/Global/widgets.dart';
import 'package:zook/models/ProductModel.dart';
import 'package:zook/navigation/check.dart';

import '../Global/list.dart';
import '../Global/others.dart';
import '../Global/send.dart';

class CardData {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
}
class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {

  late StepProgressController stepProgressController;

   List<XFile?> pictures=[null] ;

  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return _file;
    }
    print('No Image Selected');
    return null;
  }


  @override
  void initState() {
    super.initState();
    stepProgressController = StepProgressController(totalSteps: 5);
  }

  void onUpdate(){
    stepProgressController = StepProgressController(totalSteps: 5);
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
                InkWell(
                  onLongPress: (){
                    setState(() {
                      progress=false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("Add a Product",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22),),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.support_agent),SizedBox(width: 5,),
                    Text(" Support at : +91-7978097489"),SizedBox(width: 5,),
                    Icon(Icons.keyboard_arrow_down_outlined),
                    progress?CircularProgressIndicator():SizedBox(),
                    SizedBox(width: 5,),
                    progress?Text("${(uploadProgress*100).toStringAsFixed(1)}% Uploaded"):SizedBox()
                  ],
                ),
                SizedBox(height: 14,)
              ],
            ),
          ),
          LinearProgressIndicator(
            value: uploadProgress, // must be between 0.0 and 1.0
            minHeight: 4,
            backgroundColor: Colors.grey.shade200,
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          Container(
            width: w,
            height: 80,
            child: StepProgress(
              totalSteps: 5,
              padding: const EdgeInsets.all(10),
              controller: stepProgressController,
              lineSubTitles: const [
                'Product',
                'Price',
                'Ship',
                'Confirm',
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
              height: h-230-52,
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
  Widget r5(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        t("Total Stocks"),
        t1("Please Type the Total Stocks you have "),
        te(w, stocks,"1000",no: true),
        SizedBox(height: 10,),
        t("Your Products Pictures"),
        t1("Please Add Products Picture"),
        SizedBox(height: 10,),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            pictures.length,
                (index) => _buildImagePicker(w, index, square: true),
          ),
        )
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
        t("Product Name"),
        t1("Please Type your Product Name ( As long as you want ) "),
        te(w, name,"Realme NARZO 80 | Lite 4G | 6300mAh Segment's Biggest Battery | 7.94mm Slim Design | 300% Ultra Volume"),
        t("Brand Name"),
        t1("Please Type the Company Brand Name"),
        te(w, brand,"Realme"),
        t("Selling Price"),
        t1("Write the Amount customers will buy in Zook App"),
        te(w, no:true,selling,"1000"),
        t("MRP Price"),
        t1("Write the Actual Amount the product was off"),
        te(w, no:true,mrp,"2000"),
      ],
    );
  }
  Widget r3(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        t("Weight of Product"),
        t1("Please Type Weight in Gram"),
        te(w, weight,"50 g",no: true),
        t("Dimension of Product ( Width x Height )"),
        t1("Please Type Package width and height"),
        te(w, dim,"100 x 10"),
        t("Description"),
        t1("Please Type Description for App"),
        te(w, desc,"SJSJJW91",desc: true),
        t("Box Contains"),
        t1("Please Type what you will send with the Products"),
        te(w, box,"Mobile, 1 Charger, 1 Data Cable, 1 Manual"),
        t("Long Description"),
        t1("Please Type a Long Description for your Product"),
        te(w, full_desc,"https://facebook.com/pune-street-food",desc: true),
      ],
    );
  }
  Widget r4(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            !issmall?Icon(Icons.production_quantity_limits):Icon(Icons.production_quantity_limits),
            SizedBox(width: 5,),
            t("Is the Product have Variants ?"),
            Switch(
              value: issmall,
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  issmall = value; // Update the boolean
                });
              },
            ),
          ],
        ),
        t("Add Product Variant"),
        t1("Please Add Product Variants if you have selected the Variants"),
        SizedBox(height: 9,),
        issmall?InkWell(
          onTap: addCard,
          child: Container(
            width: w-10,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade100
            ),
            child: Center(child: Text("+  Add 1 more Variant")),
          ),
        ):SizedBox(),
        !issmall?SizedBox():cards.isEmpty
            ? const Center(child: Text("No cards yet"))
            : Container(
          width: w,height: 360,
              child: ListView.builder(
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
              final card = cards[index];
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Product Variant ${index + 1}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => removeCard(index),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      te(w, card.titleController,"Type ${index==0?"Default ":""}Variant    Example - Size XL"),
                      const SizedBox(height: 8),
                      index==0?Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 8),
                        child: Text("+₹0",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                      ):te(w, no:true,card.descController,"Type the Extra Price : +${index+1}000"),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
              },
              ),
            ),

      ],
    );
  }
  List<CardData> cards = [];

  void addCard() {
    setState(() {
      cards.add(CardData());
    });
  }

  void removeCard(int index) {
    setState(() {
      cards.removeAt(index);
    });
  }

  void saveAll() {
    for (final card in cards) {
      print("Title: ${card.titleController.text}");
      print("Description: ${card.descController.text}");
    }
  }
  bool issmall=false;

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
  Widget _buildImagePicker(double w, int index, {bool square = false}) {
    return InkWell(
      onTap: () async {
        XFile? file = await pickImage(ImageSource.gallery); // or camera
        if (file != null) {
          setState(() {
            pictures[index] = file;

            // If last slot filled, add a new empty slot
            if (index == pictures.length - 1) {
              pictures.add(null);
            }
          });
        }
      },
      child: pictures[index] == null
          ? Container(
        width: square ? w / 4 : w / 3,
        height: square ? w / 4 : (w / 3) * 9 / 16,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: const Icon(Icons.add_a_photo, color: Colors.grey),
      )
          : _buildImageContainer(pictures[index], w, square: square),
    );
  }

  Widget _buildImageContainer(XFile? imageFile, double w, {bool square = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 15),
      child: Container(
        width: square ? w / 4 : w / 3,
        height: square ? w / 4 : (w / 3) * 9 / 16,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade400),
          image: imageFile == null
              ? null : DecorationImage(
            image: FileImage(File(imageFile.path)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  TextEditingController name=TextEditingController();
  TextEditingController desc=TextEditingController();
  TextEditingController full_desc=TextEditingController();
  TextEditingController brand=TextEditingController();
  TextEditingController selling= TextEditingController();
  TextEditingController mrp=TextEditingController();

  TextEditingController weight = TextEditingController();
  TextEditingController dim = TextEditingController();
  TextEditingController box=TextEditingController();
  TextEditingController stocks = TextEditingController();

  Widget te(double w,TextEditingController controller, String hint,{ bool no = false,bool desc=false
  })=>Padding(
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
  bool progress=false;

  Future<void> createSellerModel() async {
    try {
      setState(() {
        progress=true;
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String email = await prefs.getString("email")??"";
      if(pictures.isEmpty){
        Send.message(context, "Atleast Upload 1 Picture !", false);
        setState(() {
          progress=false;
        });
        return ;
      }

      List<String> titles=[]; List<int> amount=[];
      if(issmall){
        amount.add(0);
        for (var item in cards) {
          print("Title: ${item.titleController}");
          titles.add(item.titleController.text);
          print("Description: ${item.descController}");
          amount.add(int.parse(item.descController.text));
        }
      }else{

      }
      int mrpint = int.parse(mrp.text);
      int amountprice = int.parse(selling.text);
      int weights = int.parse(weight.text);
      int stocksint=int.parse(stocks.text);

      if(mrpint<=amountprice){
        Send.message(context, "Selling price should be less than Amount", false);
        setState(() {
          progress=false;
        });
        return ;
      }
      List<String> pic=[];
      for (var pics in pictures){
        try {
          String gh = await uploadpic(pics!);
          pic.add(gh);
        }catch(e){

        }
      }
      final model = ProductModel(
              email: email,
              brandname: brand.text,
              name:name.text,
              buyed: 0,
              mrp: mrpint,
              sellingvlue: amountprice,
              lat: 123.45,
              lon: 123.45,
              company_name: "${Session.seller.name}",
              shipername: "${Session.seller.address1}",
              boxcontent: box.text,
              description: desc.text,
              fulldescription: full_desc.text,
              isdiffrentiable: issmall,
              arrayname: titles,
              arrayamount: amount,
              arraymrp: amount,
              arraystocks: [],
              totalstock: stocksint,
              picture: pic,
              favorites: [],
              waitlist: [],
              uniqueid: "",
              categor: cat,
              offer: true,
              first: true,
              totalbuyed: 0,
              firstadded: DateTime.now().toString(),
              intss: 0,
              weight: weights.toDouble(),
              dimension: dim.text
      );
          final request = ModelMutations.create(model);
          final response = await Amplify.API.mutate(request: request).response;
          final createdProductModel = response.data;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SellerCheckScreen(email: email)));
          print(model.toJson());
          setState(() {
            progress=false;
          });
    }catch(e){
      setState(() {
        progress=false;
      });
      Send.message(context, "$e", false);
      print(e);
    }
  }


  String cat = "Mobiles";

  Widget t(String str)=>Text(str
    ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),);
  Widget t1(String str)=> Text(str,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),);

  Widget r1(double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text("Let's Add Your New Product"
          ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
        Text("Create your seller account and reach thousands of buyers instantly. List your products, manage orders easily, and grow your business—all in one place. Join Zook today and start earning like top online sellers!"
          ,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
        SizedBox(height: 20,),
        Text("Categories of your Product : "
          ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
        Container(
          width: w,height: 100,
          child: ListView.builder(
            itemCount: GL.logo.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  cat=GL.logoname[index];
                  setState(() {

                  });
                },
                child: Container(
                  width: 80,height: 100,
                  child: Column(
                    children: [
                      Container(
                        width: 70,height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: (cat==GL.logoname[index])?Colors.blue:Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage(GL.logo[index],),opacity:(cat==GL.logoname[index])?1:0.3)
                        ),
                      ),
                      Text(GL.logoname[index],style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Session.seller.review!?Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            width: w-5,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.warning,color: Colors.white,),
                  ),
                  Container(
                    width: w-100,
                    child: Text("Your Seller Profile is Still not Approved ! You could wait or try Contacting Us",
                      style: TextStyle(fontWeight:FontWeight.w500,fontSize: 13,color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ):SizedBox(),
        Text("Documents to be Handy : "
          ,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),

        SizedBox(height: 5,),
        col(w, "assets/product.webp", "Product Info", "Your Product Info, Picture, Description"),
        col(w, "assets/warehouse.webp", "WareHouse Details", "To Estimate & Take the Shipping"),
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
                if(!Session.seller.review!){
                  setState(() {
                    isChecked = value!;
                  });
                }else{
                  Send.message(context, "Your Account is Still not Approved", false);
                }
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
  double uploadProgress=0.0;
  Future<String> uploadpic(XFile file)async{
    try {
      final File imageFile = File(file.path);
      final String fileName = 'public/${DateTime.now().millisecondsSinceEpoch}_${file.name}';
      final awsFile = AWSFile.fromPath(file.path);
      final uploadResult = await Amplify.Storage
          .uploadFile(
        localFile: awsFile,
        path: StoragePath.fromString(fileName),
        options: const StorageUploadFileOptions(
          // or authenticated
        ),
        onProgress: (progress) {
          final fractionCompleted =
              progress.transferredBytes / progress.totalBytes;
          setState(() {
            uploadProgress = fractionCompleted;
          });
          print("Progress: ${(fractionCompleted * 100).toStringAsFixed(2)}%");
        },
      )
          .result;
      print('✅ Uploaded file key: ${uploadResult.uploadedItem.path}');
      return uploadResult.uploadedItem.path;
      final urlResult = await Amplify.Storage.getUrl(
        path: StoragePath.fromString(
            uploadResult.uploadedItem.path),
      );
      final getUrlResult1 = await urlResult.result;
      final downloadUrl1 = getUrlResult1.url.toString();
      return downloadUrl1;
    }catch(e){
      return e.toString();
    }
  }

}
