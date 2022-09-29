import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odc/data/data_provider/local/cache_helper.dart';
import 'package:odc/presentation/constants/constants.dart';
import 'package:odc/presentation/screeens/login/login_screen.dart';
import 'package:odc/presentation/screeens/settings/faq_screen.dart';
import 'package:odc/presentation/screeens/settings/partners.dart';
import 'package:odc/presentation/screeens/settings/support.dart';
import 'package:odc/presentation/screeens/settings/terms_screen.dart';
import 'package:odc/presentation/views/custom_list_tile.dart';
import 'package:odc/presentation/views/custom_text.dart';



//This screen use to get setting of app such as: FAQ, Terms & Conditions, partners,logout .. etc
class SettingsScreen extends StatelessWidget
{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Settings",
          fontSize: 28,
          weight: FontWeight.w500,
          textColor: Colors.black,
        ),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            //FAQ
            CustomTile(
                title: "FAQ", onClick: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FAQScreen(),
                  ));
            }),

            //Terms & Conditions
            Divider(),
            CustomTile(
                title: "Terms & Conditions", onClick: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TermsScreen(),
                  ));
            }),

            //Our Partenrs
            Divider(),
            CustomTile(
                title: "Our Partenrs",
                onClick: ()
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PartnersScreen(),
                      ));
                }),

            //Support
            Divider(),
            CustomTile(
                title: "Support",
                onClick: ()
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupportScreen(),
                      ));
                }),

            //Log out
            Divider(),
            CustomTile(
                title: "Log out",
                onClick: ()
                {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure ?"),
                      actions: [

                        //btn cancel + btn sure
                        Row(
                          children: [
                            //btn cancel
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(

                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },

                                  child: Text("Cancel"),
                                ),
                              ),
                            ),

                            //btn sure
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlinedButton(

                                  onPressed: () {
                                    CacheHelper.put(key: tokenKey, value: "")
                                        .then((value) {
                                      token = "";
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                        (Route<dynamic> route) => false,
                                      );
                                    });
                                  },
                                  child: Text('Sure'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
