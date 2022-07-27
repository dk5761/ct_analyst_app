import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/functions.dart';

class CustomListTile extends StatefulWidget {
  final String url;
  final String imageUrl;
  final String title;

  const CustomListTile({
    Key? key,
    required this.url,
    required this.title,
    this.imageUrl = "",
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        launchURL(widget.url);
      },
      child: MouseRegion(
        onHover: ((event) {
          setState(() {
            _isHovered = true;
          });
        }),
        onExit: ((event) {
          setState(() {
            _isHovered = false;
          });
        }),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: _isHovered
                  ? Colors.black38
                  : Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                  color: darkBorderColor, style: BorderStyle.solid, width: 1.6),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: ListTile(
            leading: (widget.imageUrl).isNotEmpty
                ? ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 50, maxWidth: 50),
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  )
                : null,
            title: Text(widget.title),
            trailing: _isHovered
                ? width > 672
                    ? const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: darkTextOverfadeColor,
                        size: 18,
                      )
                    : const Text(
                        "Click to open",
                        style: TextStyle(color: darkTextOverfadeColor),
                      )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
