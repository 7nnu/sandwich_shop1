import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';

// appbar widget used across all screens

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
      title: Text(title, style: heading1),
      actions: [
        Consumer<Cart>(builder: (context, cart, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 4),
                Text('${cart.countOfItems}'),
              ],
            ),
          );
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// removed styledbutton from order_screen.dart and placed here for reuse
class StyledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String label;
  final Color backgroundColor;
  final ButtonStyle? style;
  final EdgeInsetsGeometry? padding;

  const StyledButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.backgroundColor = Colors.blue,
    this.style,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle finalStyle = style ??
        ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          textStyle: AppStyles.normalText,
        );

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label, style: AppStyles.normalText),
        style: finalStyle,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: finalStyle,
      child: Text(label, style: AppStyles.normalText),
    );
  }
}