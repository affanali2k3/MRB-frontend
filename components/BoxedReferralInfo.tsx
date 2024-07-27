import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { Image } from "expo-image";
import ReviewInfo from "./ReviewInfo";
import ClientType from "./ClientType";
import { ClientTypes } from "@/entities/ClientType";

interface props {
  name: string;
  reviewScore: number;
  reviewCount: number;
  clientType: ClientTypes;
  timeAmount: number;
}

const BoxedReferralInfo: React.FC<props> = (props) => {
  return (
    <View style={styles.container}>
      <View style={styles.left}>
        <Image style={{ width: 40, height: 40 }} source={require("@/assets/images/default_profile_photo.jpeg")} />
        <View style={styles.nameReviews}>
          <Text>{props.name}</Text>
          <ReviewInfo iconSize={16} count={props.reviewCount} score={props.reviewScore} />
        </View>
      </View>
      <View style={styles.right}>
        <ClientType clientType={props.clientType} />
        <View style={styles.timeAmount}>
          <Text>Within {props.timeAmount} days</Text>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    padding: 10,
    flexDirection: "row",
    justifyContent: "space-between",
    borderWidth: 1,
    borderColor: "#88888859",
    borderRadius: 20,
    marginTop: 10,
  },
  left: {
    alignItems: "center",
    gap: 10,
    flexDirection: "row",
  },
  right: {},
  nameReviews: {},
  timeAmount: {},
});

export default BoxedReferralInfo;
