import 'package:flutter/material.dart';
import 'package:library_app/books.dart';
import 'package:library_app/selected_book.dart';
import 'package:library_app/store_user_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
 }



 class _HomePageState extends State<HomePage> {
  final TextEditingController searchbarcontroller = TextEditingController();
  String selectedCategory = 'Self Help';
  
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
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final List<String> categories = Books.bookList.map((book) => book.category).toSet().toList();
    final List<Books> filteredBooks = Books.bookList.where((book) => book.category == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFF5F5F5), 
          Color(0xFFE0F7FA), 
        ],
      ),
    ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                width: width,
                height: height * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/homePage' );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, top: 20),
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage('Assets/logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, top: 20),
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage('Assets/defaultPfp.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: height * 0.25,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text(
                      'Welcome back, $name',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    const Text(
                      'What do you want to read today?',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 30,
                        color: Colors.black,
                        height: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    SizedBox(
                      height: height * 0.05,
                      width: width,
                      child: TextField(
                        controller: searchbarcontroller,
                        cursorColor: Colors.black,
                        autocorrect: false,
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 17,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            fontFamily: 'Lato',
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 20,
                            color: Color(0xFF0A8159),
                          ),
                          suffixIcon: const Icon(
                            Icons.mic,
                            size: 20,
                            color: Color(0xFF0A8159),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: categories.map((x) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = x;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              x,
                              style: TextStyle(
                                color: x == selectedCategory ? Colors.black : Colors.grey,
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (x == selectedCategory) ...[
                              const SizedBox(height: 4),
                              Container(
                                height: 2,
                                width: (x.length * 8.0),
                                color: Color(0xFF0A8159),
                              ),
                            ],
                          ],
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.3, 
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filteredBooks.map((book) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>SelectedBook(book: book))
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150, 
                              height: 200, 
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2
                                ),
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(book.image),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) {
                                    print('Failed to load image: ${book.image}');
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 150,
                              child: Text(
                                book.title,
                                style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              book.author,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ),
              Container(
                //padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                height: height * 0.4,
                decoration: BoxDecoration(
                  //color: Colors.yellow
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: height * 0.05,
                      width: width,
                      decoration: BoxDecoration(
                       // color: Colors.blue
                      ),
                      child: Text(
                        'Recently Added',
                        style: TextStyle(
                          fontFamily:'Lato',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                     SizedBox(
                height: height * 0.3, 
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filteredBooks.map((book) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>SelectedBook(book:book)));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150, 
                              height: 200, 
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2
                                ),
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(book.image),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) {
                                    print('Failed to load image: ${book.image}');
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 150,
                              child: Text(
                                book.title,
                                style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              book.author,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}