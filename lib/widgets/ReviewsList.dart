import 'package:flutter/material.dart';
import 'package:prioritysoft/Review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});
  Widget circularImage( String url){
    return  Container(height:40,width:40,
      clipBehavior: Clip.antiAlias,
      decoration:BoxDecoration(
          border: Border.all(color:Colors.black12 ,width: 1.0),
          borderRadius: BorderRadius.circular(100.0) ), child:ClipOval( child:Image.network(url, fit:BoxFit.cover, width: double.infinity,height: double.infinity)
        ));
  }
  Widget ReviewTile(Review review){
    return ListTile(

      trailing: const Text('Today', style: TextStyle(fontWeight: FontWeight.w200,color: Colors.black54)) ,
       contentPadding:EdgeInsets.zero ,
        title: Text(review.name,
          style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),),
        subtitle:   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0,),
            Row(
              children: [
                Icon(Icons.star_outlined, size: 18, color: Colors.yellow),
                Icon(Icons.star_outlined, size: 18, color: Colors.yellow),
                Icon(Icons.star_outlined, size: 18, color: Colors.yellow),
                Icon(Icons.star_outlined, size: 18, color: Colors.yellow),
                Icon(Icons.star_outlined, size: 18, color: Colors.yellow),
              ],
            ),
            SizedBox(height: 8.0,),
            Text(review.review, style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
          ],
        ),
        leading: circularImage(review.image),
        isThreeLine: true);
  }

  List<Widget> reviewList(){
    List<Widget> list=[];
    list.add( const Text(
      "Reviews",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16.0,
      ),
    ));
    list.add( const SizedBox(
      height: 14.0,
    ));
    Review review=Review(image: 'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833554.jpg', name: 'Nolan Carder', averageRating: '5', review: 'Prefct for keepoing your feet dry and warm');
    Widget tile=ReviewTile(review);
    list.add(tile);

    review=Review(image: 'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833554.jpg', name: 'Maria Sris', averageRating: '5', review: 'Prefct for keepoing your feet dry and warm');
    tile=ReviewTile(review);list.add(tile);

    review=Review(image: 'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833554.jpg', name: 'Maria Sris', averageRating: '5', review: 'Prefct for keepoing your feet dry and warm');
    tile=ReviewTile(review);
    list.add(tile);
    return
        list;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children:reviewList());
  }
}
