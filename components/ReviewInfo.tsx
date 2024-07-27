import { View, Text, StyleSheet } from "react-native";
import React from "react";
import { FontAwesome } from "@expo/vector-icons";
interface props {
  score: number;
  count: number;
  iconSize?: number;
}
const ReviewInfo: React.FC<props> = (props) => {
  const { iconSize = 24 } = props;
  return (
    <View style={styles.reviews}>
      <FontAwesome name="star" size={iconSize} color="orange" />
      <Text>
        {props.score} ({props.count} reviews)
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  reviews: {
    flexDirection: "row",
    gap: 10,
    alignItems: "center",
  },
});
export default ReviewInfo;
