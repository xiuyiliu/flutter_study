import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class PullAndRefreshDemo extends StatefulWidget {
  @override
  _PullAndRefreshDemoState createState() => _PullAndRefreshDemoState();
}

class _PullAndRefreshDemoState extends State<PullAndRefreshDemo> {
  ScrollController _scrollController;
  RefreshController _refreshController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
    _refreshController = RefreshController();
  }

  // 下拉刷新，上拉加载更多
  Future<void> _onRefresh(bool up) async {
    if (up) {

    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            height: 0.0,
            decoration: BoxDecoration(
              color: Colors.green
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: new SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: _onRefresh,
              child: new CustomScrollView(
                controller: _scrollController,
                physics: ScrollPhysics(),
                slivers: <Widget>[
                  new SliverToBoxAdapter(
                    child: new Container(
                      height: 1000.0,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent
                      ),
                    ),
                  ),
                  new SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                          new Container(
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: Colors.yellow
                            ),
                          )
                      )
                  ),
                  new SliverToBoxAdapter(
                    child: new Container(
                      height: 1000.0,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent
                      ),
                    ),
                  ),
                  new SliverToBoxAdapter(
                    child: new Container(
                      height: 1000.0,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent
                      ),
                    ),
                  ),
                ],
              ),
            )
          )

        ],
      )

    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._child);

  final Widget _child;

  @override
  double get minExtent => 60.0;

  @override
  double get maxExtent => 60.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
