import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import React from "react";
import { Ionicons } from "@expo/vector-icons";
import { Image } from "expo-image";
import { LinearGradient } from "expo-linear-gradient";
import { useNavigation, DrawerActions } from "@react-navigation/native";
const ReferralCentreHeader = () => {
  const navigation = useNavigation();
  return (
    <LinearGradient colors={["#307FD6", "#2B8FF2"]} start={[0, 0]} end={[1, 1]} style={styles.container}>
      <View style={styles.row}>
        <View style={styles.left}>
          <TouchableOpacity onPress={() => navigation.dispatch(DrawerActions.toggleDrawer())}>
            <Ionicons name="menu-outline" size={38} color="white" />
          </TouchableOpacity>
          <Text style={styles.text}>Referral Center</Text>
        </View>
        <View style={styles.right}>
          <TouchableOpacity style={styles.iconContainer}>
            <Image contentFit="contain" style={styles.icon} source={require("@/assets/icons/referral_centre/filters.png")} />
          </TouchableOpacity>
          <TouchableOpacity style={styles.iconContainer}>
            <Image contentFit="contain" style={styles.icon} source={require("@/assets/icons/referral_centre/notification.png")} />
          </TouchableOpacity>
          <TouchableOpacity style={styles.iconContainer}>
            <Image contentFit="contain" style={styles.icon} source={require("@/assets/icons/referral_centre/chat.png")} />
          </TouchableOpacity>
        </View>
      </View>
    </LinearGradient>
  );
};

const styles = StyleSheet.create({
  container: {
    padding: 10,
    paddingBottom: 40,
    paddingTop: 40,
    backgroundColor: "linear-gradient(65.44deg, #307FD6 7.87%, #2B8FF2 85.45%)",
  },
  row: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  left: {
    flexDirection: "row",
    alignItems: "center",
  },
  right: {
    flexDirection: "row",
    gap: 5,
  },
  iconContainer: { padding: 5, backgroundColor: "white", borderRadius: 100 },
  text: {
    color: "white",
    fontSize: 25,
  },
  icon: {
    width: 20,
    height: 20,
    tintColor: "black",
  },
});
export default ReferralCentreHeader;
