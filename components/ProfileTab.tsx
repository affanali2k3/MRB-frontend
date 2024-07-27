import { StyleSheet, Text, TouchableWithoutFeedback, View } from "react-native";
import React, { Dispatch, SetStateAction } from "react";
import { Colors } from "@/constants/Colors";

interface props {
  active: boolean;
  title: string;
  index: number;
  setActiveIndex: Dispatch<SetStateAction<number>>;
}

const ProfileTab: React.FC<props> = (props) => {
  return (
    <TouchableWithoutFeedback
      onPress={() => {
        props.setActiveIndex(props.index);
      }}
    >
      <View style={[styles.container, props.active ? styles.activeContainer : null]}>
        <Text style={[styles.text, props.active ? styles.activeText : null]}>{props.title}</Text>
      </View>
    </TouchableWithoutFeedback>
  );
};

export default ProfileTab;

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 40,
    paddingVertical: 10,
    borderBottomWidth: 2,
    borderBottomColor: "#D6E9FC",
  },
  activeContainer: {
    borderBottomColor: Colors.primaryColor,
  },
  text: {},
  activeText: {
    color: Colors.primaryColor,
  },
});
