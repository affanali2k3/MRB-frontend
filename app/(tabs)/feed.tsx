// app/(tabs)/feed.tsx
import React from "react";
import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import { DrawerActions, useNavigation } from "@react-navigation/native";
import { Ionicons } from "@expo/vector-icons";
import FeedPagePostsList from "@/components/FeedPagePostsList";

const Feed = () => {
  const navigation = useNavigation();

  return (
    <>
      <FeedPagePostsList />
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    padding: 20,
  },
});

export default Feed;
