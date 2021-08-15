import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_people/Utils/style.dart';
import 'package:learning_people/bloc/screen/loginBloc.dart';

class AppBarComponent extends StatelessWidget {
  final String photoUrl, name;
  final double height, bottomPadding, imageWidth;
  const AppBarComponent(this.name, this.photoUrl,
      {this.height = 140,
      this.bottomPadding = 30,
      this.imageWidth = 120,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Stack(
        children: [
          Container(
            height: height - bottomPadding,
            color: titleColor,
            child: Row(
              children: [
                Image.asset(
                  'assets/image/logo-white.png',
                  width: imageWidth,
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: iconColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mark_chat_unread_outlined,
                            color: iconColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () => LoginBloc.instance.logout(),
                          icon: Icon(
                            Icons.logout,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      name ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: photoUrl,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: (height - 20) / 2,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
