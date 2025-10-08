import 'package:amplify_api/amplify_api.dart' show ModelMutations, ModelQueries;
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/main.dart';
import 'package:zook/Global/others.dart';
import 'package:zook/Global/send.dart';
import 'package:zook/models/UserModel.dart';
import 'package:zook/navigation/home.dart';
import 'package:zook/navigation/naviagtion.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:zook/main.dart' as np;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool signup=false;
  bool progress=false;
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Global.white,
      body: SingleChildScrollView(
        child: Container(
          width: w,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Image.asset("assets/logo_full.jpg",width: w/4,),
              Center(child: Text(signup?"SignUp Now":"Login Now",style: TextStyle(color: Global.blue,fontSize: 27,fontWeight: FontWeight.w800),)),
              SizedBox(height: 4,),
              Text(signup?"Welcome to Zook":"Welcome Back !",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
              Text(signup?"Your Only Shopping Solution":"You have been Missed",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width : MediaQuery.of(context).size.width  , height : 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Background color of the container
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only( left :10, right : 18.0),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          isDense: true,
                          border: InputBorder.none, // No border
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width : MediaQuery.of(context).size.width  , height : 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Background color of the container
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only( left :10, right : 18.0),
                      child: TextFormField(
                        controller:pass,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          isDense: true,
                          border: InputBorder.none, // No border
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              code?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width : MediaQuery.of(context).size.width  , height : 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Background color of the container
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only( left :10, right : 18.0),
                      child: TextFormField(
                        controller:codes,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: InputDecoration(
                          labelText: 'OTP Code from Email',
                          isDense: true,
                          border: InputBorder.none, // No border
                        ),
                      )
                  ),
                ),
              ):SizedBox(),
              code?SizedBox(height: 15,):SizedBox(),
              progress?CircularProgressIndicator(
                backgroundColor: Global.blue,
              ):InkWell(
                onTap: (){
                  setState(() {
                    progress=true;
                  });
                  save();
                  if(code){
                    confirmUser(username: email.text, confirmationCode: codes.text);
                    return ;
                  }
                  create(email.text, pass.text);
                  return;
                },
                child: Container(
                  width: w-15,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Global.blue,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(child: Text(code?"Confirm OTP":(signup?"Create Account":"Sign In"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 8),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                    InkWell(
                        onTap:(){
                          setState(() {
                            signup=!signup;
                          });
                        },
                        onLongPress: (){
                          fetchUsers();
                        },
                        child: Text("New? SignUp Now",style: TextStyle(fontSize: 16,color: Global.blue,fontWeight: FontWeight.w500),)),
                    Text("Forgot Password",style: TextStyle(fontSize: 16,color: Global.blue,fontWeight: FontWeight.w500),),
                  ]
                ),
              ),
              Spacer(),
              Text("or continue with",style: TextStyle(fontSize: 15,color: Global.blue,fontWeight: FontWeight.w500),),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  con(w, "assets/apple.png"),
                  con(w, "assets/facebook.png"),
                  con(w, "assets/google.webp"),
                ],
              ),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }

  void save()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email.text);
  }
  TextEditingController codes=TextEditingController();

  Future<void> create(String username, String password) async {
    if(signup){
      try {
        final userAttributes = {
          AuthUserAttributeKey.email: username,
        };
        final result = await Amplify.Auth.signUp(
          username: username,
          password: password,
          options: SignUpOptions(
            userAttributes: userAttributes,
          ),
        );
        await _handleSignUpResult(result);

      } on AuthException catch (e) {
        setState(() {
          progress=false;
        });
        safePrint('Error signing up user: ${e.message}');
        Send.message(context, 'Error signup in: ${e.message}', false);
      }
    }else{
      try {
        final result = await Amplify.Auth.signIn(
          username: username,
          password: password,
        );
        await _handleSignInResult(result,username);
      } on AuthException catch (e) {
        setState(() {
          progress=false;
        });
        safePrint('Error signing in: ${e.message}');
        Send.message(context, 'Error signing in: ${e.message}', false);
      }
    }
  }
  Future<void> _handleSignInResult(SignInResult result,String username) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.confirmSignInWithSmsMfaCode:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignInStep.confirmSignInWithNewPassword:
        safePrint('Enter a new password to continue signing in');
        Send.message(context, 'Enter a New Password to Signup', false);
        break;
      case AuthSignInStep.confirmSignInWithCustomChallenge:
        final parameters = result.nextStep.additionalInfo;
        final prompt = parameters['prompt']!;
        safePrint(prompt);
        break;
      case AuthSignInStep.confirmSignUp:
      // Resend the sign up code to the registered device.
        final resendResult = await Amplify.Auth.resendSignUpCode(
          username: username,
        );
        _handleCodeDelivery(resendResult.codeDeliveryDetails);
        break;
      case AuthSignInStep.done:
        safePrint('Sign in is complete');
        Send.message(context, 'Complete SignUp', true);
        next();
        break;
      case AuthSignInStep.continueSignInWithMfaSelection:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthSignInStep.continueSignInWithMfaSetupSelection:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthSignInStep.continueSignInWithTotpSetup:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthSignInStep.continueSignInWithEmailMfaSetup:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthSignInStep.confirmSignInWithTotpMfaCode:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthSignInStep.confirmSignInWithOtpCode:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AuthSignInStep.resetPassword:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
    setState(() {
      progress=false;
    });
  }

  bool code=false;

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    setState(() {
      code=true;
      progress=false;
    });
    Send.message(context, 'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
        'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.', false);
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
          'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }
  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthSignUpStep.done:
        setState(() {
          progress=false;
        });
        safePrint('Sign up is complete');
        Send.message(context, "Signup Complete", true);
        next();
        break;
    }
  }

  Future<void> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: codes.text,
      );
      await _handleSignUpResult(result);
    } on AuthException catch (e) {
      setState(() {
        progress=false;
      });
      safePrint('Error confirming user: ${e.message}');
    }
  }

  void next(){
    setState(() {
      progress=false;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>np.MyHomePage(title: "")));
  }


  TextEditingController email = TextEditingController();
  TextEditingController pass=TextEditingController();

  Widget con(double w,String assetlink)=>Container(
    width: w/5,
    height: w/10,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Colors.grey.shade200,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Color of the shadow
          offset: Offset(0, 5), // x, y offset of the shadow
          blurRadius: 10, // How blurry the shadow edges are
          spreadRadius: 1, // How much the shadow expands
        ),
      ]
    ),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(assetlink),fit: BoxFit.contain),
        ),
      ),
    ),
  );
  Future<void> createUserModel() async {
    try {
      final model = UserModel(
          Name: "Ayush",
          Email: "hariswar@gmail.com",
          Phone: "+918",
          orders: 1020,
          purchased: 1020,
          token: "Lorem ipsum dolor sit amet",
          date: "14-10-2203");
      final request = ModelMutations.create(model);
      final response = await Amplify.API.mutate(request: request).response;

      final createdUserModel = response.data;
      if (createdUserModel == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result: ${createdUserModel.date}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }
  Future<void> fetchUsers() async {
    print("ujijk");
    try {
      final request = ModelQueries.list(UserModel.classType);
      final response = await Amplify.API.query(request: request).response;

      final users = response.data?.items;
      if (users == null) {
        safePrint('errors: ${response.errors}');
        return;
      }

      for (var user in users) {
        if (user != null) {
          safePrint("User: ${user}");
        }
      }
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }
}

