import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
        _buildProfileHeader(),
        _buildBottomSettings(),
        _buildBottomSettings1(),
        _buildCommunity(),
        _buildFacebookGroup(),
      ],
    );
  }

  // SliverAppBar
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Menu',
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

  Widget _buildProfileHeader() {
    final items = [
      {"icon": Icons.settings, "title": "Settings"},
    ];

    return SliverToBoxAdapter(
      child: Column(
        children: [
          // Profile tile
          ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5"),
            ),
            title: Text(
              "John Doe",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Switch profile • @rinkimhong",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          // Settings item
          ListTile(
            leading: Icon(items[0]["icon"] as IconData, color: Colors.black),
            title: Text(
              items[0]["title"] as String,
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              // handle tap here
            },
          ),
          Divider(thickness: 1, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildBottomSettings() {
    final items = [
      {"icon": Icons.storefront_rounded, "title": "Marketplace"},
      {"icon": Icons.mark_unread_chat_alt, "title": "Message Requests"},
      {"icon": Icons.archive, "title": "Archive"},
    ];

    return SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = items[index];
          return Column(
            children: [
              ListTile(
                leading: Icon(item["icon"] as IconData),
                title: Text(
                  item["title"] as String,
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () {
                  // handle tap
                },
              ),
            ],
          );
        }, childCount: items.length),
      ),
    );
  }

  Widget _buildBottomSettings1() {
    final items = [
      {"icon": Icons.people_sharp, "title": "Firend requests"},
    ];

    return SliverPadding(
      padding: EdgeInsets.only(left: 18),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = items[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                autofocus: true,
                leading: Icon(item["icon"] as IconData, size: 24),
                title: Text(item["title"] as String),
                onTap: () {
                  // handle tap
                },
              ),
            ],
          );
        }, childCount: items.length),
      ),
    );
  }

  Widget _buildCommunity() {
    final items = [
      {"icon": Icons.add, "title": "Create Community"},
    ];

    return SliverPadding(
      padding: EdgeInsets.only(left: 18),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = items[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Community',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                autofocus: true,
                leading: Icon(item["icon"] as IconData, size: 24),
                title: Text(
                  item["title"] as String,
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () {
                  // handle tap
                },
              ),
            ],
          );
        }, childCount: items.length),
      ),
    );
  }

  Widget _buildFacebookGroup() {
    final List<Map<String, String>> groups = [
      {
        "title": "Flutter Community",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSCZ623va6hzwge90N2wVKmOfkEabtcyMksA&s",
      },
      {
        "title": "ASP.NET C#",
        "image": "https://miro.medium.com/0*whPt9R9BXJ5xotoh.jpg",
      },
      {
        "title": "UX/UI Designers",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUrMibF7R9as_QQe8YcLKh2Y8_XtSBgI1Yg&s",
      },
      {
        "title": "IT Jobs",
        "image":
            "https://admin.wac.co/uploads/Top_10_IT_jobs_in_India_for_2024_1e9ad979de.jpg",
      },
      {
        "title": "Angular",
        "image": "https://acquven.com/blog/02/images/angular.jpg",
      },
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        bool isUnread = index % 2 == 0;
        final group = groups[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Facebook Groups',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 19, 129, 219),
                      ),
                    ),
                  ],
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
                      group["image"]!,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      group["title"]!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  if (isUnread)
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }, childCount: groups.length),
    );
  }
}
