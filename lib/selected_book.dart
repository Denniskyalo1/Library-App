import 'package:flutter/material.dart';
import 'package:library_app/books.dart'; 
import 'package:library_app/home_page.dart';

class SelectedBook extends StatefulWidget {
  final Books book;
  const SelectedBook({super.key, required this.book});

  @override
  State<SelectedBook> createState() => _SelectedBookState();
}

class _SelectedBookState extends State<SelectedBook> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(height * 0.05),
      child: AppBar(
        backgroundColor: Color(0xFF0A8159),
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
          },
          child: Icon(
            Icons.chevron_left,
            size: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){},
            child: Padding(
             padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.bookmark,
                  size: 30,
                  color: Colors.black,
                ),
            
            ),
          )
        ],
        flexibleSpace: SafeArea(
            child: Container(
              margin: EdgeInsets.only(bottom: height * 0.03), 
            ),
          ),
      )
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: height * 0.3, 
                    color:  Color(0xFF0A8159), 
                  ),
                  Container(
                    height: height * 0.7,
                    decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )
                    ),
                  ),
                ],
              ),
            ),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: height * 0.03, left: 15),
                  height: height * 0.4,
                  width: width * 0.55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.book.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 15),
                  height: height * 0.07,
                  width: width * 0.8,
                  child: Column(
                    children: [
                      Text(
                        widget.book.title,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.book.author,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: MaterialButton(
                    height: height * 0.06,
                    minWidth: width * 0.9,
                    color: Color(0xFF0A8159),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Borrow this book',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.01),
                  padding: EdgeInsets.all(10),
                  height: height * 0.4,
                  width: width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        widget.book.overview, 
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}