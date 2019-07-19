var menueDataJson = {
  "config": {"color": "#555666", "pic_url": ""},
  "items": [
    {
      "jump_url": "",
      "pic_url": "https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp",
      "title": "标题"
    },
    {
      "jump_url": "",
      "pic_url": "https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp",
      "title": "标题"
    },
    {
      "jump_url": "",
      "pic_url": "https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp",
      "title": "标题"
    },
    {
      "jump_url": "",
      "pic_url": "https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp",
      "title": "标题"
    },
    {
      "jump_url": "",
      "pic_url": "https://gw.alicdn.com/tps/TB1eXc7PFXXXXb4XpXXXXXXXXXX-183-144.png?getAvatar=1_.webp",
      "title": "标题"
    },
  ]
};

class HomeBtnItem {
  String jump_url;
  String picUrl;
  String title;
  HomeBtnItem({this.jump_url, this.picUrl,this.title});
  HomeBtnItem.fromJson(Map<String, dynamic> json)
      : jump_url = json['jump_url'],
        title=json['title'],
        picUrl = json['pic_url'];
}

class HomeBtnList {
  List<HomeBtnItem> items;
  HomeBtnList({this.items});
  factory HomeBtnList.fromJson( dynamic json) {
    List list = (json as List).map((i) {
      return HomeBtnItem.fromJson(i);
    }).toList();
    return HomeBtnList(items: list);
  }
}