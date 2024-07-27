import ApplyForReferralModal from "@/components/ApplyForReferralModal";
import ReferralCentreHeader from "@/components/ReferralCentreHeader";
import { AntDesign } from "@expo/vector-icons";
import { Image } from "expo-image";
import { router, Tabs } from "expo-router";
import React, { useEffect, useState } from "react";
import { StyleSheet, TouchableOpacity, View } from "react-native";

export default function TabLayout() {
  const [isModalVisible, setModalVisible] = useState(false);

  const toggleModal = () => {
    setModalVisible(!isModalVisible);
  };

  return (
    <>
      <Tabs
        screenOptions={{
          // headerShown: false,
          headerStyle: {},
          tabBarStyle: {
            padding: 10,
            paddingBottom: 10,
            height: 70,
            borderTopEndRadius: 30,
            borderTopStartRadius: 30,
            elevation: 1, // Optional: shadow for Android
            shadowColor: "#000", // Optional: shadow for iOS
            shadowOpacity: 0.2, // Optional: shadow for iOS
            shadowOffset: { width: 0, height: 10 }, // Optional: shadow for iOS
            shadowRadius: 10, // Optional: shadow for iOS
          },
        }}
      >
        <Tabs.Screen
          name="index"
          options={{
            title: "Home",
            header: () => <ReferralCentreHeader />,
            tabBarIcon: ({ color }) => (
              <Image source={require("@/assets/icons/navbar/home.png")} style={{ width: 28, height: 28, tintColor: color }} />
            ),
          }}
        />

        <Tabs.Screen
          name="dashboard"
          options={{
            title: "Dashboard",
            tabBarIcon: ({ color }) => (
              <Image source={require("@/assets/icons/navbar/dashboard.png")} style={{ width: 28, height: 28, tintColor: color }} />
            ),
          }}
        />
        <Tabs.Screen
          name="button"
          options={{
            title: "",
            tabBarIcon: ({ color }) => (
              <TouchableOpacity onPress={toggleModal}>
                <View style={styles.fabContainer}>
                  <AntDesign name="plus" size={24} color="white" />
                </View>
              </TouchableOpacity>
            ),
          }}
        />

        <Tabs.Screen
          name="feed"
          options={{
            title: "Feed",
            tabBarIcon: ({ color }) => (
              <Image source={require("@/assets/icons/navbar/feed.png")} style={{ width: 28, height: 28, tintColor: color }} />
            ),
          }}
        />
        <Tabs.Screen
          name="account"
          options={{
            title: "Account",
            tabBarIcon: ({ color }) => (
              <Image source={require("@/assets/icons/navbar/profile2.png")} style={{ width: 28, height: 28, tintColor: color }} />
            ),
          }}
        />
      </Tabs>
      {/* <ApplyForReferralModal isVisible={isModalVisible} onClose={toggleModal}></ApplyForReferralModal> */}
    </>
  );
}
const styles = StyleSheet.create({
  fabContainer: {
    backgroundColor: "#007bff",
    borderRadius: 28,
    width: 56,
    height: 56,
    marginBottom: 30,
    justifyContent: "center",
    alignItems: "center",
    elevation: 5,
    shadowColor: "#000",
    shadowOpacity: 0.3,
    shadowOffset: { width: 0, height: 5 },
    shadowRadius: 5,
  },
});
