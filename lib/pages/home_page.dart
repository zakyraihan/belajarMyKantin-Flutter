import 'package:belajar_mykantin/data/api/api_service.dart';
import 'package:belajar_mykantin/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kategori',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FutureBuilder(
              future: ApiService().getKategori(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<KategoriList> data = snapshot.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 20,
                      children: List.generate(
                        data.length,
                        (index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(data[index].img),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              data[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return buildShimmerKategori();
                }
              },
            ),
            const Text(
              'Popular',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FutureBuilder(
              future: ApiService().getPopular(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<PopularList> data = snapshot.data;
                  return Center(
                    child: Wrap(
                      spacing: 50,
                      runSpacing: 10,
                      children: List.generate(
                        data.length,
                        (index) {
                          return Container(
                            decoration: const BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 120,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(data[index].image),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow.shade600),
                                      Text(
                                        data[index].rating,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(data[index].name),
                                Text('Rp ${data[index].harga}'),
                                Text(data[index].waktu),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return buildShimmerKategori();
                }
              },
            )
          ],
        ),
      ),
    ));
  }

  Widget buildShimmerKategori() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 20,
          children: [
            ...List.generate(
              3,
              (index) => Container(
                width: 100,
                height: 50,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
