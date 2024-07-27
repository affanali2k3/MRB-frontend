// app/(tabs)/feed.tsx
import React from "react";
import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import { DrawerActions, useNavigation } from "@react-navigation/native";
import { Ionicons } from "@expo/vector-icons";

const Feed = () => {
  const navigation = useNavigation();

  return (
    <View style={styles.container}>
      <TouchableOpacity onPress={() => navigation.dispatch(DrawerActions.openDrawer())}>
        <Ionicons name="menu-outline" size={38} color="black" />
      </TouchableOpacity>
      <Text>Feed Page</Text>
    </View>
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
