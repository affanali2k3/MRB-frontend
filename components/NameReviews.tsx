import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { Image } from "expo-image";
import ReviewInfo from "./ReviewInfo";

interface props {
  name: string;
  reviewCount: number;
  reviewScore: number;
}

const NameReviews: React.FC<props> = (props) => {
  return (
    <View style={styles.container}>
      <Image style={styles.image} source={require("@/assets/images/default_profile_photo.jpeg")} />
      <View>
        <Text style={styles.name}>{props.name}</Text>
        <ReviewInfo iconSize={18} count={props.reviewCount} score={props.reviewScore} />
      </View>
    </View>
  );
};

export default NameReviews;

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    alignItems: "center",
    gap: 10,
  },
  name: {
    fontSize: 18,
  },
  image: {
    height: 50,
    width: 50,
    borderRadius: 100,
  },
});
