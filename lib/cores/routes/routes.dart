import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/main_screen.dart';
import 'package:furniture_yt/views/auth/login_page.dart';
import 'package:furniture_yt/views/auth/signup_page.dart';
import 'package:furniture_yt/views/auth/verification/change_password_page.dart';
import 'package:furniture_yt/views/auth/verification/forgot_password_page.dart';
import 'package:furniture_yt/views/auth/verification/otp_verification_page.dart';
import 'package:furniture_yt/views/categories/categories_page.dart';
import 'package:furniture_yt/views/categories/categories_product_page.dart';
import 'package:furniture_yt/views/home/best_selling/best_selling_page.dart';
import 'package:furniture_yt/views/home/home_page.dart';
import 'package:furniture_yt/views/home/recommended/recommended_page.dart';
import 'package:furniture_yt/views/product/cart_page/cart_page.dart';
import 'package:furniture_yt/views/product/checkout_page/checkout_page.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';
import 'package:furniture_yt/views/product/product_detail_page.dart';
import 'package:furniture_yt/views/product/track_order/track_order_page.dart';
import 'package:furniture_yt/views/profile/pages/edit_profile.dart';
import 'package:furniture_yt/views/profile/pages/my_address_page.dart';
import 'package:furniture_yt/views/profile/pages/my_orders_page.dart';
import 'package:furniture_yt/views/profile/pages/payment_method.dart';
import 'package:furniture_yt/views/profile/pages/settings_page.dart';
import 'package:furniture_yt/views/profile/profile_page.dart';
import 'package:furniture_yt/views/saved/saved_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // auth routes
      case RouteName.rLogin:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case RouteName.rSignup:
        return MaterialPageRoute(builder: (context) => SignupPage());
      case RouteName.rForgotPassword:
        return MaterialPageRoute(builder: (context) => ForgotPasswordPage());
      case RouteName.rOtpVerification:
        return MaterialPageRoute(builder: (context) => OtpVerificationPage());
      case RouteName.rChangePassword:
        return MaterialPageRoute(builder: (context) => ChangePasswordPage());

      case RouteName.rMain:
        return MaterialPageRoute(builder: (context) => MainScreen());

// bottom navigation bar routes

      case RouteName.rHome:
        return MaterialPageRoute(builder: (context) => HomePage());

      case RouteName.rCategory:
        return MaterialPageRoute(builder: (context) => CategoriesPage());
      case RouteName.rSaved:
        return MaterialPageRoute(builder: (context) => SavedPage());
      case RouteName.rProfile:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      // best selling and recommended
      case RouteName.rBestSelling:
        return MaterialPageRoute(builder: (context) => BestSellingPage());
      case RouteName.rRecommended:
        return MaterialPageRoute(builder: (context) => RecommendedPage());

// Profile Pages Utils
      case RouteName.rEdit:
        return MaterialPageRoute(builder: (context) => EditProfile());
      case RouteName.rSettings:
        return MaterialPageRoute(builder: (context) => SettingsPage());
      case RouteName.rPayment:
        return MaterialPageRoute(builder: (context) => PaymentMethod());
      case RouteName.rMyOrders:
        return MaterialPageRoute(builder: (context) => MyOrdersPage());
      case RouteName.rMyAddress:
        return MaterialPageRoute(builder: (context) => MyAddressPage());

      // product details
      case RouteName.rProductDetail:
        final data = settings.arguments as ProductModel;
        return MaterialPageRoute(
            builder: (context) => ProductDetailPage(
                  product: data,
                ));

      // category details
      case RouteName.rCategoriesProduct:
        final data = settings.arguments as ProductCategory;
        return MaterialPageRoute(
            builder: (context) => CategoriesProductPage(
                  productCategory: data,
                ));

      // cart
      case RouteName.rCart:
        return MaterialPageRoute(builder: (context) => CartPage());
      // checkout
      case RouteName.rCheckout:
        final args = settings.arguments as Map<dynamic, dynamic>;
        return MaterialPageRoute(
            builder: (context) => CheckoutPage(
                  cartItems: args['cartItems'],
                  cartQuantity: args['cartQuantity'],
                  totalItems: args['totalItems'],
                  subTotal: args['subTotal'],
                  deliveryCharge: args['deliveryCharge'],
                  total: args['total'],
                ));
      // track order
      case RouteName.rTrackOrder:
        final args = settings.arguments as Map<dynamic, dynamic>;

        return MaterialPageRoute(
            builder: (context) => TrackOrderPage(
                  cartItems: args['cartItems'],
                  cartQuantity: args['cartQuantity'],
                  subTotal: args['subTotal'],
                  deliveryCharge: args['deliveryCharge'],
                ));
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              body: Center(child: Text('Error')),
            ));
  }
}
