import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';

Widget buildAppDrawer(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("Alan Wake"),
          accountEmail: const Text("smartshop@gmail.com"),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage('assets/Smartshop.png'),
          ),
          decoration: BoxDecoration(
            color:Colors.teal,
          ),
        ),
        buildDrawerItem(
          context,
          icon: Icons.home,
          label: "Home",
          routeName: '/home',
        ),
        buildDrawerItem(
          context,
          icon: Icons.favorite,
          label: 'Favorites',
          routeName: '/favorites',
        ),
        buildDrawerItem(
          context,
          icon: Icons.shopping_cart,
          label: 'Cart',
          routeName: '/cart',
        ),
        buildDrawerItem(
          context,
          icon: Icons.person,
          label: 'Profile',
          routeName: '/profile',
        ),
        const Divider(),
        SwitchListTile(
          title: const Text('Dark Mode'),
          secondary: Icon(themeProvider.isDark ? Icons.dark_mode : Icons.light_mode),
          value: themeProvider.isDark,
          onChanged: (_) => themeProvider.toggleTheme(),
        ),
        const Spacer(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () => _confirmLogout(context),
        ),
      ],
    ),
  );
}

Widget buildDrawerItem(BuildContext context,
    {required IconData icon,
      required String label,
      required String routeName}) {
  final isSelected = ModalRoute.of(context)?.settings.name == routeName;

  return ListTile(
    leading: Icon(icon, color: isSelected ?  Colors.teal : null),
    title: Text(
      label,
      style: TextStyle(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ?  Colors.teal : null,
      ),
    ),
    selected: isSelected,
    onTap: () {
      Navigator.pop(context);
      if (!isSelected) {
        Navigator.pushReplacementNamed(context, routeName);
      }
    },
  );
}

void _confirmLogout(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: const Text('Logout'),
          onPressed: () async {
            final authProvider = Provider.of<AuthProvider>(context, listen: false);
            await authProvider.logout();
            Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
          },
        ),
      ],
    ),
  );
}
