import { StyleSheet, Text, View } from "react-native";
import React from "react";
import HorizontalLine from "./HorizontalLine";
import { User } from "@/entities/User";
import { Colors } from "@/constants/Colors";

interface props {
  user: User;
}

const ProfileAbout: React.FC<props> = (props) => {
  return (
    <View style={styles.wrapper}>
      <View style={styles.container}>
        <Text style={styles.headline}>About Me</Text>
        <HorizontalLine />
        <Text style={styles.bio}>{props.user.biography === null ? "No bio added" : props.user.biography}</Text>
      </View>
      <View style={styles.container}>
        <Text style={styles.headline}>Personal Stats</Text>
        <HorizontalLine />
        <View style={styles.innerContainer}>
          <View>
            <Text style={styles.experience}>24 Active Years</Text>
            <View style={styles.stat}>
              <View style={styles.circle} />
              <Text>352 Total Deals</Text>
            </View>
            <View style={styles.stat}>
              <View style={styles.circle} />
              <Text>352 Total Deals</Text>
            </View>
            <View style={styles.stat}>
              <View style={styles.circle} />
              <Text>352 Total Deals</Text>
            </View>
          </View>
          <View style={styles.summary}>
            <Text>88% </Text>
            <Text>Referral Growth</Text>
          </View>
        </View>
      </View>
    </View>
  );
};

export default ProfileAbout;

const styles = StyleSheet.create({
  wrapper: {
    margin: 10,
    gap: 20,
  },
  innerContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
  },
  summary: {
    alignItems: "center",
    justifyContent: "center",
    borderWidth: 6,
    borderColor: Colors.primaryColor,
    width: 100,
    height: 100,
    borderRadius: 100,
  },
  experience: {
    marginVertical: 20,
    paddingVertical: 6,
    paddingHorizontal: 20,
    borderRadius: 20,
    alignSelf: "flex-start",

    backgroundColor: "#378FE929",
    color: Colors.primaryColor,
  },
  circle: {
    height: 10,
    width: 10,
    borderRadius: 10,
    backgroundColor: "red",
  },
  stat: {
    flexDirection: "row",
    alignItems: "center",
    gap: 5,
  },
  bio: {
    marginTop: 10,
  },
  container: {
    padding: 20,
    borderRadius: 10,
    backgroundColor: "white",
  },
  headline: {
    fontSize: 20,
    fontWeight: "bold",
  },
});
