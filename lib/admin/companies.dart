import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zook/cards/seller.dart';

import '../Global/list.dart';
import '../Global/send.dart';
import '../Global/widgets.dart' show GW;
import '../models/SellerModel.dart';

class All_Companies extends StatefulWidget {
  const All_Companies({super.key});

  @override
  State<All_Companies> createState() => _All_CompaniesState();
}

class _All_CompaniesState extends State<All_Companies> {

   List<SellerModel?> sellers=[];

  int currentPage = 0;
  final int itemsPerPage = 10;

  List<SellerModel?> get pagedSellers {
    final start = currentPage * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, sellers.length);
    return sellers.sublist(start, end);
  }

  void initState(){
    getall();
  }
  Future<void> getall() async {
    try {
      final request = ModelQueries.list(SellerModel.classType);
      final response = await Amplify.API
          .query(request: request)
          .response;

      if (response.data == null) {
        safePrint('Query failed: ${response.errors}');
        Send.message(context, "Error: ${response.errors}", false);
        return;
      }

      sellers = response.data!.items;

      for (final seller in sellers) {
        if (seller != null) {
          safePrint("Seller Name: ${seller.name}");
          safePrint("Description: ${seller.description}");
          safePrint("Categories Applied: ${seller.categories_applied}");
          safePrint("Documents: ${seller.documnets}");
          safePrint("-------------------------");
          setState(() {

          });
        }
      }
    }catch(e){
      sellers=[];
    }
  }
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.black,
        title: Text("All Companies ",style: TextStyle(color: Colors.white),),
      ),
      body: sellers.isEmpty
          ? Column(
        children: [
          Container(
            width: w,
            height: w/4+50,
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.white,
                child:ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: w/2-10,
                        height: w/4+50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    );
                  },
                )
            ),
          ),
          Container(
            width: w,
            height: w/4+50,
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.white,
                child:ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: w/2-10,
                        height: w/4+50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    );
                  },

                )
            ),
          ),
        ],
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: pagedSellers.length,
              itemBuilder: (context, index) {
                final seller = pagedSellers[index]!;
                return SellerCard(seller: seller);
              },
            ),
          ),
          // Pagination buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: currentPage > 0
                    ? () => setState(() => currentPage--)
                    : null,
                child: const Text("Previous"),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: ((currentPage + 1) * itemsPerPage) < sellers.length
                    ? () => setState(() => currentPage++)
                    : null,
                child: const Text("Next"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SellerCard extends StatelessWidget {
  final SellerModel seller;
  const SellerCard({super.key,required this.seller});

  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerProfile(seller: seller)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: w,
          height: 300,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: w,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(seller.banner!))
                ),
              ),
              Container(
                width: w,
                height: 60,
                child: Row(
                  children: [
                    Container(
                      width: 60,height: 60,
                      decoration: BoxDecoration(image: DecorationImage(image:NetworkImage(seller.logo!),fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(seller.name!,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19),),
                        Container(
                            width: w-20-90,
                            child: Text(maxLines: 2,seller.description!,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),))
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GW.space(10, 0),
                  GW.buildStarRating(4,size: 20),
                  Text("  ${(seller.total_positive!/seller.total_rated!)*100}% Positive ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Total Products : 0/100",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Categories Sell : ${seller.categories_applied.toString()}",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,),),
              ),
              GW.space(0, 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      updateSeller(seller, false,!seller.review!);
                    },
                    child: Container(
                      width: w/2-15,
                      height: 45,
                      decoration: BoxDecoration(
                        color: seller.review!?Colors.grey.shade300:Colors.greenAccent,
                      ),
                      child: Center(child: Text("Profile : ${seller.review!?"INACTIVE":"ACTIVE"}",style: TextStyle(fontWeight: FontWeight.w900),)),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      updateSeller(seller, false,!seller.review!);
                    },
                    child: Container(
                      width: w/2-15,
                      height: 45,
                      decoration: BoxDecoration(
                        color: !seller.block!?Colors.greenAccent:Colors.red,
                      ),
                      child: Center(child: Text("Block : ${seller.block!?"YES":"NO"}",style: TextStyle(fontWeight: FontWeight.w900),)),
                    ),
                  ),
                  ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  Future<void> updateSeller(SellerModel oldModel,bool verified,bool given) async {
    try {
      final updatedSeller = verified?oldModel.copyWith(
        block:given,
      ):oldModel.copyWith(
        review:given,
      );

      final request = ModelMutations.update(updatedSeller);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint("Update failed: ${response.errors}");
        return;
      }

      safePrint("Updated Seller ID: ${response.data!.id}");
    } catch (e) {
      safePrint("Update error: $e");
    }
  }

}
