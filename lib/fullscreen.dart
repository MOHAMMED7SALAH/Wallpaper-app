import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({Key? key, required this.imageurl}) : super(key: key);
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaperOnHomeScreen() async {
    int location = WallpaperManager.HOME_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  Future<void> setwallpaperOnLockScreen() async {
    int location = WallpaperManager.LOCK_SCREEN;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  Future<void> setwallpaperBothScreens() async {
    int location = WallpaperManager.BOTH_SCREENS;

    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.network(widget.imageurl),
            ),
          ),
          InkWell(
            onTap: () {
              setwallpaperOnHomeScreen();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text('Set Wallpaper On Home Screen',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setwallpaperOnLockScreen();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text('Set Wallpaper On Lock Screen',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setwallpaperBothScreens();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(46),
              ),
              height: 60,
              width: double.infinity,
              child: const Center(
                child: Text('Set Wallpaper On Both Screens',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
