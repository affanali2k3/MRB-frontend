import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React from "react";
import { GestureResponderEvent } from "react-native-modal";
interface props {
  text: string;
  onPress: (e: GestureResponderEvent) => void;
}
const PrimaryButton: React.FC<props> = (props) => {
  return (
    <TouchableOpacity onPress={props.onPress}>
      <View style={styles.button}>
        <Text style={styles.buttonText}>{props.text}</Text>
      </View>
    </TouchableOpacity>
  );
};

export default PrimaryButton;

const styles = StyleSheet.create({
  button: {
    backgroundColor: "#307FD6",
    padding: 10,
    alignItems: "center",
    color: "white",
    borderRadius: 20,
  },
  buttonText: {
    color: "white",
  },
});
