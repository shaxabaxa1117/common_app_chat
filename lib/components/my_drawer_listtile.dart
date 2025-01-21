import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {

final IconData icon;
final String text;
final void Function() onTap;
   MyListTile({super.key, required this.icon, required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: ListTile(
            
            leading: Icon(icon),
            title: Text(text),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}