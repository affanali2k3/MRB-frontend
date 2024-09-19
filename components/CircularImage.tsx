import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { Image } from "expo-image";
import { url } from "@/constants/Server";

interface props {
  userId: number;
  size?: number;
}
const CircularImage: React.FC<props> = (props) => {
  const { userId, size = 20 } = props;
  return (
    <View>
      <Image
        style={{ width: props.size, height: props.size, borderRadius: props.size }}
        source={`${url}/users/avatar?userId=${props.userId}&avatarName=avatar`}
        placeholder={require("@/assets/images/default_profile_photo.jpeg")}
      />
    </View>
  );
};

export default CircularImage;

const styles = StyleSheet.create({});
