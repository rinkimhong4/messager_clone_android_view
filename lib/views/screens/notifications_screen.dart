import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: Colors.white, body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildNotificationList(),
        _buildSuggestionList(),
      ],
    );
  }

  // SliverAppBar
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Notifications',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
      floating: true,
      snap: true,
      centerTitle: false,
    );
  }

  Widget _buildNotificationList() {
    final List<String> profileImages = List.generate(
      5,
      (index) => "https://i.pravatar.cc/150?img=${index + 1}",
    );

    final List<String> titles = [
      "Emma Watson",
      "Liam Nguyen",
      "Sophia Chen",
      "Noah Kim",
      "Olivia Smith",
    ];

    final List<String> subtitles = [
      "liked your post",
      "🎂 Has a birthday today!",
      "started following you",
      "mentioned you in a comment",
      "sent you a gift",
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        bool isUnread = index % 2 == 0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: CachedNetworkImageProvider(
                      profileImages[index % profileImages.length],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index % titles.length],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isUnread
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitles[index % subtitles.length],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  // Timestamp with unread dot on top
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        '2:$index PM',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                      if (isUnread)
                        Positioned(
                          top: -13,
                          right: -4,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }, childCount: profileImages.length),
    );
  }

  Widget _buildSuggestionList() {
    final List<String> profileImages = List.generate(
      10,
      (index) => "https://i.pravatar.cc/150?img=${index + 1}",
    );

    final List<String> titles = [
      "Emma Watson",
      "Liam Nguyen",
      "Sophia Chen",
      "Noah Kim",
      "Olivia Smith",
      "James Lee",
      "Mia Wong",
      "Lucas Kim",
      "Chloe Tran",
      "Ethan Park",
    ];

    final List<List<String>> mutualFriends = [
      [
        "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413",
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d",
      ],
      ["https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa"],
      ["https://images.unsplash.com/photo-1473700216830-7e08d47f858e"],
      [
        "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413",
        "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d",
      ],
      [
        "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa",
        "https://images.unsplash.com/photo-1473700216830-7e08d47f858e",
      ],
      ["https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413"],
      ["https://images.unsplash.com/photo-1518806118471-f28b20a1d79d"],
      ["https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa"],
      ["https://images.unsplash.com/photo-1473700216830-7e08d47f858e"],
      ["https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413"],
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            if (index == 0)
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                  bottom: 8,
                  top: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'People you may know',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.more_horiz, size: 20, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: CachedNetworkImageProvider(
                      profileImages[index],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            ImageStackWidget(images: mutualFriends[index]),
                            Text(
                              "${mutualFriends[index].length} mutual friend${mutualFriends[index].length > 1 ? 's' : ''}",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Add friend",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }, childCount: titles.length),
    );
  }
}

class ImageStackWidget extends StatelessWidget {
  final List<String> images;
  const ImageStackWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      width: 50,
      height: 24,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < images.length && i < 3; i++)
            Positioned(
              left: i * 18.0,
              child: CircleAvatar(
                radius: 10,
                backgroundImage: CachedNetworkImageProvider(images[i]),
              ),
            ),
        ],
      ),
    );
  }
}
