import 'dart:ui';

class CategoryModel {
  String id;
  bool? right;
  String image;
  String title;
  Color backgroundColor;
  CategoryModel(
      {
      required this.id,
      required this.image,
      this.right,
      required this.title,
      required this.backgroundColor});
  bool get isRight{

    if(right!=null){
      return right!;
    }
    return true;
  }
  void set  setRight(bool value){
    right=value;
  }
}
