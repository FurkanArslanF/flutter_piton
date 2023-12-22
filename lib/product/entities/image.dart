class ImageModel {
  ImageModel({
    required this.actionProductImage,
  });

  final ActionProductImage? actionProductImage;

  ImageModel copyWith({
    ActionProductImage? actionProductImage,
  }) {
    return ImageModel(
      actionProductImage: actionProductImage ?? this.actionProductImage,
    );
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      actionProductImage: json["action_product_image"] == null ? null : ActionProductImage.fromJson(json["action_product_image"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "action_product_image": actionProductImage?.toJson(),
      };
}

class ActionProductImage {
  ActionProductImage({
    required this.url,
  });

  final String? url;

  ActionProductImage copyWith({
    String? url,
  }) {
    return ActionProductImage(
      url: url ?? this.url,
    );
  }

  factory ActionProductImage.fromJson(Map<String, dynamic> json) {
    return ActionProductImage(
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
