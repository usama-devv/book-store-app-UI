import 'package:book_store_app_ui/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
          ),
          actions: [
            const Icon(
              Icons.file_upload,
              color: Colors.black,
              size: 25,
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
