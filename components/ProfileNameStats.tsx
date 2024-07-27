import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React from "react";
import { Image } from "expo-image";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";
import { User } from "@/entities/User";
import ReviewInfo from "./ReviewInfo";
import { Colors } from "@/constants/Colors";

const ProfileNameStats: React.FC<User> = (user) => {
  return (
    <View style={styles.container}>
      <Image
        style={styles.image}
        source={`${url}/users/avatar?userId=${user.id}&avatarName=avatar`}
        placeholder={require("@/assets/images/default_profile_photo.jpeg")}
      />
      <Text style={styles.name}>{user.name}</Text>
      <View style={styles.emailRating}>
        <Text style={styles.email}>{user.email}</Text>
        <ReviewInfo count={user.agentAnalytic.agentToAgentRatingNumber} score={user.agentAnalytic.agentToAgentRatingScore} />
      </View>
      <View style={styles.buttons}>
        <TouchableOpacity style={[styles.button, styles.activeButton]}>
          <Text style={styles.activeButtonText}>Connect</Text>
        </TouchableOpacity>
        <TouchableOpacity style={[styles.button, styles.inactiveButton]}>
          <Image style={styles.messageIcon} source={require("@/assets/profile/email.png")} />
          <Text style={styles.inactiveButtonText}>Message</Text>
        </TouchableOpacity>
      </View>
      <View style={styles.stats}>
        <View style={styles.stat}>
          <Text style={styles.statHeading}>59</Text>
          <Text>Posts</Text>
        </View>
        <View style={styles.stat}>
          <Text style={styles.statHeading}>250</Text>
          <Text>Ref Sent</Text>
        </View>
        <View style={styles.stat}>
          <Text style={styles.statHeading}>259</Text>
          <Text>Ref Received</Text>
        </View>
      </View>
    </View>
  );
};

export default ProfileNameStats;

const styles = StyleSheet.create({
  container: {
    margin: 30,
    padding: 10,
  },
  messageIcon: {
    width: 20,
    height: 15,
    tintColor: Colors.primaryColor,
  },
  statHeading: {
    fontSize: 18,
    color: Colors.primaryColor,
    fontWeight: "500",
  },
  image: {
    width: 100,
    height: 100,
    borderRadius: 100,
    alignSelf: "center",
    marginBottom: 20,
  },
  name: {
    fontSize: 22,
    fontWeight: "600",
    color: Colors.primaryColor,
    textAlign: "center",
    marginBottom: 10,
  },
  emailRating: {
    flexDirection: "row",

    gap: 10,
    justifyContent: "center",
    marginBottom: 20,
  },
  email: {
    fontWeight: "600",
  },
  inactiveButtonText: {
    color: "#307FD6",
    fontWeight: "bold",
  },
  activeButtonText: {
    color: "white",
  },
  buttons: {
    flexDirection: "row",
    gap: 10,
    justifyContent: "center",
    marginBottom: 20,
  },
  activeButton: { backgroundColor: Colors.primaryColor },
  inactiveButton: {
    borderColor: Colors.primaryColor,
    borderWidth: 2,
  },
  button: {
    flexDirection: "row",
    alignItems: "center",
    gap: 5,
    paddingHorizontal: 40,
    paddingVertical: 10,
    borderRadius: 20,
  },
  stats: {
    flexDirection: "row",
    justifyContent: "space-between",
  },
  stat: {
    alignItems: "center",
  },
});
