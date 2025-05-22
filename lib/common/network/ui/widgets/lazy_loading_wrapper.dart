import 'package:flutter/material.dart';

class LazyLoadingWrapper extends StatefulWidget {
  const LazyLoadingWrapper({
    required this.controller,
    required this.child,
    super.key,
    this.loadMore,
  });

  final ScrollController controller;
  final Widget child;
  final Future<void> Function()? loadMore;

  @override
  State<LazyLoadingWrapper> createState() => _LazyLoadingListState();
}

class _LazyLoadingListState extends State<LazyLoadingWrapper> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.controller.offset >=
            widget.controller.position.maxScrollExtent - 100 &&
        !widget.controller.position.outOfRange) {
      widget.loadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
