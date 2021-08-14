import 'package:flutter/material.dart';
import 'package:flutter_mtap/book/Book.dart';
import 'package:flutter_mtap/book/BookDao.dart';
import 'package:flutter_mtap/book/InsertBookScreen.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {

  initState() {
    _setBookList();
  }

  TextStyle headingStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold
  );

  List<Book> booksList = <Book>[];
  List<Book> bookListToShow = <Book>[];
  Widget customSearchBar = Text("Books List");
  Widget customSearchIcon = Icon(Icons.search);
  bool isSearching = false;

  void _setBookList() async {
    _getBookList().then((value) => setState((){
      this.booksList = value;
      this.bookListToShow = value;
    }));
  }

  Future<List<Book>> _getBookList() async{
    final _bookDao = new BookDao();
    return _bookDao.getBooks();
  }

  void _deleteBook(String bookId) async{
    final _bookDao = new BookDao();
    _bookDao.deleteBook(bookId);
  }

  void searchBookList(String bookName){
    _getBookStartingWith(bookName).then((value) => setState((){
      print(value);
      this.bookListToShow = value;
    }));
  }

  Future<List<Book>> _getBookStartingWith(String bookName) async{
    final _bookDao = new BookDao();
    return _bookDao.getBook(bookName);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(onPressed: () {
              setState(() {
                if(isSearching) {
                  customSearchIcon = Icon(Icons.cancel);
                  customSearchBar = TextField(
                    onChanged: (text) {
                      searchBookList(text);
                    },
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search book",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                     ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  bookListToShow = booksList;
                  customSearchIcon = Icon(Icons.search);
                  customSearchBar = Text("Books List");
                }
                isSearching = !isSearching;
              });
            },
            icon: customSearchIcon,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: bookListToShow.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Column(
                children: [
                  // _showHeader(),
                  _rowContent(bookListToShow[index]),
                ],
              );
            } else {
              return _rowContent(bookListToShow[index]);
            }
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertBookScreen())
            );
          },
          child: Icon(Icons.add)
      ),
    );
  }

  Widget _rowContent(Book book) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Book Name:   "+book.name),
              Text("Author Name: "+book.author),
              Text("Price:       "+book.price.toString()),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: (){
                  _deleteBook(book.id);
                },
                child: Icon(Icons.delete),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[300],
                  onPrimary: Colors.red
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InsertBookScreen(), settings: RouteSettings(arguments: book) )
                  );
                },
                child: Text("Update"), style: TextButton.styleFrom(
                  primary: Colors.green
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget _showHeader() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Name", style: headingStyle,),
          Text("Author", style: headingStyle,),
          Text("Price", style: headingStyle,),
        ],
      ),
    );
  }

}