

import 'package:flutter/material.dart';
import 'package:food_delivery_app_main/users/fragments/my_order_view.dart';

import '../../common/color_extension.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  List inboxArr = [
  {
  "title": "Order #1234:",
  "detail":
  "Spaghetti Carbonara - Qty: 1 - ₹350",
},
{
"title": "Order #1235:",
"detail":
"Margherita Pizza - Qty: 2 - ₹1400",
},
{
"title": "Order #1236:",
"detail":
"Salad - Qty: 1 - ₹350",
},
{
"title": "Order #1237:",
"detail":
"Chocolate Brownie - Qty: 1 - ₹350",
},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "Inbox",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: inboxArr.length,
                separatorBuilder: ((context, index) => Divider(
                  indent: 25,
                  endIndent: 25,
                  color: TColor.secondaryText.withOpacity(0.4),
                  height: 1,
                )),
                itemBuilder: ((context, index) {
                  var cObj = inboxArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(
                        color:
                        index % 4 != 1 ? TColor.white : TColor.textfield),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cObj["title"].toString(),
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["detail"].toString(),
                                maxLines: 2,
                                style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

