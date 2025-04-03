import 'package:flutter/material.dart';
import 'package:library_app/store_user_details.dart';


class ProfilePage extends StatefulWidget{

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{

  String name = '';
  String email = '';
  String token = '';

  Future<Map<String,String>> userDetails() async{
   Map<String, String?> userDetails = await UserDetails.getUserDetails();
   return {
    'Name': userDetails['name']??'',
    'Email': userDetails['email']??'',
    'Token': userDetails['token']??'',
   };
  }

   @override
   void initState() {
    super.initState();
    fetchUserDetails();
    }

  Future<void> fetchUserDetails() async {
    final details = await userDetails();
    setState(() {
      name = details['Name'] ?? '';
      email = details['Email'] ?? '';
      token = details['Token'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context){
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/homePage');
                    },
                    child: SizedBox(
                      width: width * 0.2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: Color(0xFF0A8159),
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                            color: Color(0xFF0A8159),
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                      ],
                    ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                       Navigator.pushNamed(context, '/editProfile');
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      width: width * 0.1,
                      child: Icon(
                        Icons.edit,
                        size: 22,
                        color: Color(0xFF0A8159),
                    
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.3,
              width: height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000),
                image: DecorationImage(
                  image: AssetImage('Assets/defaultPfp.png'),
                  fit: BoxFit.cover,
                  )
              ),
            ),
            
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              width: width,
              height: height * 0.05,
              child: Text(
                name,
                style:TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 30,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: height * 0.6,
              width: width,
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF0A8159),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                    width: width,
                    
                    child: Row(
                      children: [
                        Text(
                          'Favorite Books',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Lato',
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        
                      ],
                    ) ,
                    
                  )
                ],
              ),

              
            )
          ],
        
        ),
      ),
    );
  }
}