import { StyleSheet, Text, View } from "react-native";
import React from "react";
import CircularImage from "./CircularImage";
import { User } from "@/entities/User";
import ReviewInfo from "./ReviewInfo";
import PrimaryButton from "./PrimaryButton";

interface props {
  userId: number;
  user: User;
}
const UserFollowCard: React.FC<props> = (props) => {
  return (
    <View style={styles.container}>
      <View style={styles.containerInner}>
        <CircularImage size={80} userId={props.userId} />
        <Text>{props.user.name}</Text>
        <ReviewInfo count={props.user.agentAnalytic.agentToAgentRatingNumber} score={props.user.agentAnalytic.agentToAgentRatingScore} />
      </View>
      <PrimaryButton text="Follow" onPress={() => {}} />
    </View>
  );
};

export default UserFollowCard;

const styles = StyleSheet.create({
  container: {
    margin: 10,
    padding: 20,
    backgroundColor: "white",
    borderRadius: 10,
    borderWidth: 1,
    borderColor: "#0000001A",
  },
  containerInner: {
    alignItems: "center",
    gap: 10,
    marginBottom: 10,
  },
});
