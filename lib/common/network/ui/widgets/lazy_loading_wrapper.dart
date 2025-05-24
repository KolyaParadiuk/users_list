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
    // Trigger loading more data when user has scrolled
    // to within 100 pixels of the end
    //
    // This provides a smoother UX by loading the next batch of data
    // before the user reaches the very end
    //
    // Also checks if scroll position is within valid range
    // to prevent unnecessary API calls

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
