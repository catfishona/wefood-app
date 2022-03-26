import 'package:wefood_app/utils/book_data.dart';
import 'package:wefood_app/model/book.dart';
import 'package:wefood_app/widget/search_widget.dart';
import 'package:flutter/material.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Book> books;
  String query = '';

  @override
  void initState() {
    super.initState();

    books = allBooks;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Poo"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 50),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];

                    return buildBook(book);
                  },
                ),
              ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Widget buildBook(Book book) => ListTile(
    
        title: Text(book.title),
        subtitle: Text(book.author),
        onTap: (){},
      );

  void searchBook(String query) {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}