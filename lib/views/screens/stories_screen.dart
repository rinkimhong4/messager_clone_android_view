import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messager_clone_android_view/views/widgets/custom_switch_widget.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final List<String> profileImages = List.generate(
    20,
    (index) => "https://i.pravatar.cc/150?img=${index + 1}",
  );
  final List<String> userNames = [
    "Emma Watson",
    "Liam Nguyen",
    "Sophia Chen",
    "Noah Kim",
    "Olivia Smith",
    "James Lee",
    "Ava Johnson",
    "William Park",
    "Isabella Brown",
    "Lucas Tran",
    "Mia Davis",
    "Alexander Vu",
    "Charlotte Wilson",
    "Henry Le",
    "Amelia Taylor",
    "Michael Do",
    "Harper Martinez",
    "Ethan Hoang",
    "Evelyn Clark",
    "Daniel Pham",
    "Aria Lewis",
    "David Ngo",
    "Chloe Walker",
    "Joseph Huynh",
    "Emily Adams",
    "Benjamin Vo",
    "Lily Scott",
    "Mason Duong",
    "Grace Hall",
    "Logan Nguyen",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(backgroundColor: Colors.white, body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [_buildSliverAppBar(), ..._buildGridSlivers()],
    );
  }

  // SliverAppBar
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Stories',
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: CustomAdvanceSwitch(),
        ),
      ],
    );
  }

  List<Widget> _buildGridSlivers() {
    return [
      SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            final mainImage = 'https://picsum.photos/id/${index + 20}/400/600';
            final profileImage = profileImages[index % profileImages.length];
            final name = index == 0 ? "Add to story" : userNames[index];
            final isUnread = index % 3 == 0; // true = unviewed

            return ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: mainImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[300]),
                      errorWidget: (context, url, error) =>
                          Container(color: Colors.grey),
                    ),
                  ),
                  // Profile picture with viewed/unviewed border
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.all(3), // border thickness
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isUnread
                              ? Colors.blue
                              : Colors.grey, // border color
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: CachedNetworkImageProvider(
                          profileImage,
                        ),
                      ),
                    ),
                  ),
                  // Optional small unread indicator
                  if (isUnread)
                    Positioned(
                      top: 6,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  // Name text
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }, childCount: 20),
        ),
      ),
    ];
  }
}
