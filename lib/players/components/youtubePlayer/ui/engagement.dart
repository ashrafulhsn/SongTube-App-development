import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:songtube/internal/languages.dart';

class VideoEngagement extends StatelessWidget {
  final int likeCount;
  final int dislikeCount;
  final int viewCount;
  final Function onSaveToPlaylist;
  final Function onDownload;
  final Function onShare;
  VideoEngagement({
    @required this.likeCount,
    @required this.dislikeCount,
    @required this.viewCount,
    @required this.onSaveToPlaylist,
    @required this.onDownload,
    @required this.onShare,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Likes Counter
        _engagementTile(
          icon: Icon(MdiIcons.thumbUpOutline, color: Theme.of(context).iconTheme.color),
          text: Text(
            NumberFormat.compact().format(likeCount),
            style: TextStyle(
              fontSize: 10
            ),
            ),
        ),
        // Dislikes Counter
        _engagementTile(
          icon: Icon(MdiIcons.thumbDownOutline, color: Theme.of(context).iconTheme.color),
          text: Text(
            NumberFormat.compact().format(dislikeCount),
            style: TextStyle(
              fontSize: 10
            ),
            ),
        ),
        //
        _engagementTile(
          icon: Icon(MdiIcons.shareOutline, color: Theme.of(context).iconTheme.color),
          text: Text(
            Languages.of(context).labelShare,
            style: TextStyle(
              fontSize: 10
            ),
          ),
          onPressed: onShare
        ),
        // Add to Playlist Button
        _engagementTile(
          icon: Icon(MdiIcons.playlistPlus, color: Theme.of(context).iconTheme.color),
          text: Text(
            Languages.of(context).labelPlaylist,
            style: TextStyle(
              fontSize: 10
            ),
          ),
          onPressed: onSaveToPlaylist
        ),
        // Open Comments Button
        _engagementTile(
          icon: Icon(MdiIcons.downloadOutline, color: Theme.of(context).iconTheme.color),
          text: Text(
            Languages.of(context).labelDownload,
            style: TextStyle(
              fontSize: 10
            ),
          ),
          onPressed: onDownload
        ),
      ],
    );
  }

  Widget _engagementTile({
    final Widget icon,
    final Widget text,
    final Function onPressed
  }) {
    return Container(
      width: 65,
      height: 65,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(height: 2),
            text
          ],
        ),
      ),
    );
  }

}