import 'package:ecommerce_app/Features/Authentication/Views/Login/login.dart';
import 'package:ecommerce_app/Features/Authentication/Views/OnBoarding/onboarding.dart';
import 'package:ecommerce_app/Features/Authentication/Views/Signup/Signup.dart';
import 'package:ecommerce_app/Features/Authentication/Views/Signup/verify_email.dart';
import 'package:ecommerce_app/Features/Authentication/Views/password_configuration/forgot_password.dart';
import 'package:ecommerce_app/Features/Personalization/View/Address/address.dart';
import 'package:ecommerce_app/Features/Personalization/View/Profile/profile.dart';
import 'package:ecommerce_app/Features/Personalization/View/Settings/settings.dart';
import 'package:ecommerce_app/Features/Store/Views/Cart/cart.dart';
import 'package:ecommerce_app/Features/Store/Views/Checkout/checkout.dart';
import 'package:ecommerce_app/Features/Store/Views/Home/home.dart';
import 'package:ecommerce_app/Features/Store/Views/Order/order.dart';
import 'package:ecommerce_app/Features/Store/Views/ProductReviews/product_reviews.dart';
import 'package:ecommerce_app/Features/Store/Views/Store/store.dart';
import 'package:ecommerce_app/Features/Store/Views/Wishlist/wishlist.dart';
import 'package:ecommerce_app/Routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: ViRoutes.home, page: () => const HomePage()),
    GetPage(name: ViRoutes.store, page: () => const StorePage()),
    GetPage(name: ViRoutes.favourites, page: () => const FavouritePage()),
    GetPage(name: ViRoutes.settings, page: () => const SettingsPage()),
    GetPage(
        name: ViRoutes.productReviews, page: () => const ProductReviewsPage()),
    GetPage(name: ViRoutes.order, page: () => const OrderPage()),
    GetPage(name: ViRoutes.checkout, page: () => const CheckoutPage()),
    GetPage(name: ViRoutes.cart, page: () => const CartPage()),
    GetPage(name: ViRoutes.userProfile, page: () => const ProfilePage()),
    GetPage(name: ViRoutes.userAddress, page: () => const UserAddressPage()),
    GetPage(name: ViRoutes.signup, page: () => const SignupPage()),
    GetPage(name: ViRoutes.verifyEmail, page: () => const VerifyEmailPage()),
    GetPage(name: ViRoutes.signIn, page: () => const LoginPage()),
    GetPage(name: ViRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: ViRoutes.onBoarding, page: () => const OnBoardingPage()),
  ];
}
