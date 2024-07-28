import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { Post } from "@/entities/Post";
import { Image } from "expo-image";
import { url } from "@/constants/Server";
import HorizontalLine from "./HorizontalLine";

interface props {
  post: Post;
}

const PostCard: React.FC<props> = (props) => {
  return (
    <View style={styles.container}>
      <View>
        <View style={styles.topRow}>
          <Image style={styles.iconImage} source={require("@/assets/images/default_profile_photo.jpeg")} />
          <View>
            <Text>{props.post.user.name}</Text>
            <View style={styles.timeContainer}>
              <Image style={styles.timeIcon} source={require("@/assets/icons/post/time.png")} />
              <Text style={styles.timeText}>21 mins ago</Text>
            </View>
          </View>
        </View>
      </View>
      <Text style={styles.postText}>{props.post.text}</Text>
      {props.post.postImages?.length !== 0 ? (
        <Image
          style={styles.postImage}
          source={`${url}/posts/post-image?userId=${props.post.userId}&post=${props.post.name}&image=${props.post.postImages[0].image_name}`}
        />
      ) : null}
      <View style={styles.likesComments}>
        <View style={styles.likesContainer}>
          <Image style={styles.likeIcon} source={require("@/assets/icons/post/likes.png")} />
          <Text>{props.post.likes}</Text>
        </View>
        <Text>{props.post.comments} Comments</Text>
      </View>
      <HorizontalLine />
      <View style={styles.buttons}>
        <View style={styles.button}>
          <Image contentFit="contain" style={styles.buttonIcon} source={require("@/assets/icons/post/like.png")} />
          <Text>Like</Text>
        </View>
        <View style={styles.button}>
          <Image contentFit="contain" style={styles.buttonIcon} source={require("@/assets/icons/post/comment.png")} />
          <Text>Comment</Text>
        </View>
        <View style={styles.button}>
          <Image contentFit="contain" style={styles.buttonIcon} source={require("@/assets/icons/post/share.png")} />
          <Text>Share</Text>
        </View>
      </View>
    </View>
  );
};

export default PostCard;

const styles = StyleSheet.create({
  container: {
    margin: 10,
    padding: 10,
    borderRadius: 10,
    backgroundColor: "white",
  },
  timeContainer: {
    marginTop: 2,
    // marginLeft:
    flexDirection: "row",
    alignItems: "center",
    gap: 5,
  },
  timeText: {
    color: "#AAA6B9",
    fontSize: 12,
  },
  timeIcon: {
    height: 15,
    width: 15,
  },
  iconImage: {
    height: 40,
    width: 40,
    borderRadius: 40,
  },
  buttonIcon: {
    height: 20,
    width: 20,
  },
  button: {
    alignItems: "center",
  },
  buttons: {
    flexDirection: "row",
    justifyContent: "space-between",
    marginTop: 15,
    marginHorizontal: 30,
  },
  likesContainer: {
    flexDirection: "row",
    gap: 5,
  },
  topRow: {
    flexDirection: "row",
    alignItems: "center",
    gap: 10,
  },
  likeIcon: {
    height: 20,
    width: 20,
  },
  postText: {
    marginTop: 20,
    marginBottom: 20,
  },
  postImage: {
    width: "100%",
    height: 200,
  },
  likesComments: {
    marginTop: 10,
    flexDirection: "row",
    justifyContent: "space-between",
  },
});
