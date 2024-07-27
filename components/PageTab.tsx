import { StyleSheet, Text, Touchable, View } from "react-native";
import React from "react";
import { Colors } from "@/constants/Colors";
import { GestureHandlerRootView, TouchableWithoutFeedback } from "react-native-gesture-handler";

interface props {
  title: string;
  active: boolean;
  index: number;
  onPress: (index: number) => void;
}
const PageTab: React.FC<props> = (props) => {
  return (
    <GestureHandlerRootView>
      <TouchableWithoutFeedback
        onPress={() => {
          props.onPress(props.index);
        }}
      >
        <View style={[styles.container, props.active ? styles.active : null]}>
          <Text style={props.active ? styles.textActive : null}>{props.title}</Text>
        </View>
      </TouchableWithoutFeedback>
    </GestureHandlerRootView>
  );
};

export default PageTab;

const styles = StyleSheet.create({
  container: {
    margin: 5,
    padding: 10,
    borderWidth: 1,
    borderColor: "black",
    borderRadius: 20,
  },
  active: {
    backgroundColor: Colors.primaryColor,
    borderColor: Colors.primaryColor,
  },
  textActive: {
    color: "white",
  },
});
