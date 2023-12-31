import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject/screens/cartpage/view/cartpage.dart';
import 'package:myproject/widget/dropdown.dart';

class ItemSelection extends StatefulWidget {
   ItemSelection({required this.title,super.key});
  String title;
  
  

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  
  int _counter=1;
  void quantityAdd() {
    setState(() {
      _counter++;
    });
  }
  void quantityLess(){
    setState(() {
      _counter--;
    });
  }
  double gst=3.50;
  
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body:
       Stack(
        
        children: [
            
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                
                Expanded(
                 
                  
                  child: Container(
                    color: Colors.white54,
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(  
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
          
                          SizedBox(height: 150,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                              Text('${widget.title}',style: TextStyle(color: Colors.black87,fontSize: 20),),
                              Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(onPressed: () {
                                      quantityLess();
                                    }, icon: Icon(Icons.remove)),
                                    Text('$_counter'),
                                    IconButton(onPressed: () {
                                      quantityAdd();
                                    }, icon: Icon(Icons.add)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                         
                          SizedBox(height: 20,),
                         
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('GST Amount'),
                              Text('$gst'),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Amount'),
                              Text('${_counter*100+gst}')
                            ],
                          ),
                          SizedBox(height: 20),
                           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Add a coupon'),
                              TextButton(onPressed: () {
                                showDialog(context: context,
                                 builder: (BuildContext context){
                                  return AlertDialog(
                                   
                                    
                                    title: Center(child: Text('Add Coupon')),
                                    content: Container(
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Coupon Code',
            
                                            ),
                                          ),
                                          ElevatedButton(onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ItemSelection(title: widget.title),));
                                          }, child: Text('Apply')),
                                        ],
                                      ),
                                    ),
                                  );
                                 }
                                );
                              }, child: Text('Coupon'),),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('No.of persons'),
                             DropdownWidget(),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),   
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade800),
                          textStyle:MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 20,color: Colors.black),
                ), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                          ),
                      onPressed: () {
                        num totalAmount = _counter * 100 + gst;
                        Get.to(CartPage(totalamount: totalAmount));

                        Get.snackbar('Added', 'Items added to cart',icon:Icon( Icons.shopping_cart_outlined),snackPosition: SnackPosition.BOTTOM);
                      
                    }, child: Text('Add to Cart')),
                  ],
                )
              
              ],
            ),
          ),
        ],
      ),
      
     
    );

  }
}