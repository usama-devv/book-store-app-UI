import 'package:book_store_app_ui/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';

bool isCart = false;
bool isFavorite = false;

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
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
                size: 25,
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.book.cover,
                      fit: BoxFit.fill,
                      height: 260,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            widget.book.title,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            ),
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                widget.book.authorImg,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              widget.book.author,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            StarRating(
                              rating: widget.book.rating,
                              size: 20,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.book.rating.toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 110,
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      moreMovieInfo(
                        "https://img.freepik.com/premium-vector/comedy-icon-vector-image-can-be-used-movie-genres_120816-82986.jpg?w=740",
                        widget.book.genre,
                        "GENRE",
                      ),
                      const SizedBox(width: 10),
                      moreMovieInfo(
                        "https://cdn-icons-png.freepik.com/512/4951/4951447.png",
                        widget.book.language,
                        "LANGUAGE",
                      ),
                      const SizedBox(width: 10),
                      moreMovieInfo(
                        "https://cdn-icons-png.freepik.com/128/5824/5824120.png",
                        widget.book.age,
                        "AGE",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container moreMovieInfo(image, title, value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Row(
        children: [
          Image.network(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 15),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
