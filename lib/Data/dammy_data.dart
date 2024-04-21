import '../Features/Store/Models/category_model.dart';
import '../Util/Constant/image_strings.dart';
import '../Util/Routes/vi_routes.dart';
import 'Model/Banner/banner_model.dart';

class ViDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: ViImages.promoBanner1,
      targetScreen: ViRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.promoBanner1,
      targetScreen: ViRoutes.profile,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.promoBanner1,
      targetScreen: ViRoutes.order,
      active: false,
    ),
    BannerModel(
        imageUrl: ViImages.promoBanner1,
        targetScreen: ViRoutes.profile,
        active: false),
    BannerModel(
      imageUrl: ViImages.promoBanner1,
      targetScreen: ViRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.promoBanner1,
      targetScreen: ViRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.promoBanner1,
      targetScreen: ViRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.promoBanner1,
      targetScreen: ViRoutes.order,
      active: false,
    ),
  ];
  static final List<CategoryModel> category = [
    CategoryModel(
      id: '1',
      name: 'Sports',
      image: ViImages.supports,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Furniture',
      image: ViImages.furnitures,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Electronics',
      image: ViImages.electronic,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Clothes',
      image: ViImages.clothes,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Animals',
      image: ViImages.animals,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      image: ViImages.shoes,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Cosmetics',
      image: ViImages.cosmetics,
      isFeatured: true,
    ),
    CategoryModel(
      id: '14',
      name: 'Jewery',
      image: ViImages.jewelry,
      isFeatured: true,
    ),

    // Sub-Category
    CategoryModel(
        id: '8',
        name: 'Sports',
        image: ViImages.supports,
        isFeatured: true,
        parentId: '1'),
    CategoryModel(
        id: '9',
        name: 'Sports',
        image: ViImages.supports,
        isFeatured: true,
        parentId: '1'),
    CategoryModel(
        id: '10',
        name: 'Sports',
        image: ViImages.supports,
        isFeatured: true,
        parentId: '1'),

    // Furiture
    CategoryModel(
      id: '11',
      name: 'Bedroom furniture',
      image: ViImages.furnitures,
      parentId: '5',
      isFeatured: true,
    ),
    CategoryModel(
      id: '12',
      name: 'Track furniture',
      image: ViImages.furnitures,
      parentId: '5',
      isFeatured: true,
    ),
    CategoryModel(
      id: '13 ',
      name: 'Sport furniture',
      image: ViImages.furnitures,
      parentId: '5',
      isFeatured: true,
    ),

    // electronic
    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: ViImages.electronic,
        isFeatured: true,
        parentId: '2'),
    CategoryModel(
        id: '15',
        name: 'Phone',
        image: ViImages.electronic,
        isFeatured: true,
        parentId: '2'),
  ];
}



/*


  // static --Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: ViImages.banner1,
      targetScreen: targetScreen.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.banner2,
      targetScreen: targetScreen.cart,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.banner3,
      targetScreen: targetScreen.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.banner4,
      targetScreen: targetScreen.favorites,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.banner5,
      targetScreen: targetScreen.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.banner6,
      targetScreen: targetScreen.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.banner7,
      targetScreen: targetScreen.order,
      active: false,
    ),
    BannerModel(
      imageUrl: ViImages.banner8,
      targetScreen: targetScreen.order,
      active: false,
    ),
  ];

  // --user
  static final UserModel user = UserModel(
      firstName: 'Conding',
      lastName: 'with Vi',
      userName: 'theviacoder',
      email: 'kaanoztrrk411@gmail.com',
      phoneNumber: '+905303922283',
      profilePicture: ViImages.user,
      adress: [
        AdressModel(
          id: '1',
          name: 'Coding with Vi',
          phoneNumber: '+905303922283',
          street: 'Pilot Cad.',
          city: 'Merkez',
          state: 'Kütahya',
          postalCode: '43000',
          counrty: 'Türkiye',
        ),
      ]);

  // Cart
  static final CartModel cart = CartModel(cartId: '001', items: [
    CartItemModel(
      productId: '001',
      varidation: '01',
      quantatiy: 1,
      title: product[0].title,
      image: product[0].image,
      price: product[0].productVariation![0].price,
      selectedVariation: product[0].productVariation![0].price,
    ),
    CartItemModel(
      productId: '002',
      varidation: '',
      quantatiy: 1,
      title: product[0].title,
      image: product[0].image,
      price: product[0].productVariation![0].price,
      selectedVariation: product[0].productVariation![0].price,
    ),
  ]);

  // Order
  static final List<OrderModel> order = [
    OrderModel(
      id: 'CWV0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2024, 04, 14),
      deliveryData: DateTime(2024, 04, 14),
    ),
    OrderModel(
      id: 'CWV0025',
      status: OrderStatus.shipped,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2024, 04, 14),
      deliveryData: DateTime(2024, 04, 14),
    ),
  ];
 */

 