import 'dart:developer';

import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class CollapsibleItemWidget extends StatefulWidget {
  CollapsibleItemWidget({
    required this.onHoverPointer,
    required this.leading,
    required this.title,
    required this.textStyle,
    required this.padding,
    required this.offsetX,
    required this.scale,
    this.onTap,
    this.entry,
  });

  final MouseCursor onHoverPointer;
  final Widget leading;
  final String title;
  final TextStyle textStyle;
  final double offsetX, scale, padding;
  final VoidCallback? onTap;
  OverlayEntry? entry;

  @override
  _CollapsibleItemWidgetState createState() => _CollapsibleItemWidgetState();
}

class _CollapsibleItemWidgetState extends State<CollapsibleItemWidget> {
  bool _underline = false;
  final LayerLink layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _underline = true && widget.onTap != null;
        });
      },
      onExit: (event) {
        setState(() {
          _underline = false;

        });
      },
      onHover: (_) {

        // showPopover(
        //   context: context,
        //   transitionDuration: const Duration(milliseconds: 150),
        //   bodyBuilder: (context) =>Text('abc'),
        //   onPop: () => print('Popover was popped!'),
        //   direction: PopoverDirection.right,
        //   barrierColor: Colors.transparent,
        //   width: 200,
        //   height: 400,
        //   arrowHeight: 15,
        //   arrowWidth: 30,
        //   isParentAlive: (){
        //     return true;
        //   },
        // );
      },
      cursor: widget.onHoverPointer,
      child: CompositedTransformTarget(
        link: layerLink,
        child: TextButton(
          style: ,
          onPressed:  widget.onTap,
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(widget.padding),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                widget.leading,
                _title,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _title {
    return Opacity(
      opacity: widget.scale,
      child: Transform.translate(
        offset: Offset(widget.offsetX, 0),
        child: Transform.scale(
          scale: widget.scale,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              widget.title,
              style: _underline
                  ? widget.textStyle
                      .merge(TextStyle(decoration: TextDecoration.underline))
                  : widget.textStyle,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
