import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { ClientTypes } from "@/entities/ClientType";

interface props {
  clientType: ClientTypes;
}

const ClientType: React.FC<props> = (props) => {
  return <Text style={styles.clientType}>{props.clientType}</Text>;
};

export default ClientType;

const styles = StyleSheet.create({
  clientType: {
    color: "#347654",
    backgroundColor: "#EDFDF7",
    paddingHorizontal: 10,
    paddingVertical: 5,
    textAlign: "center",
    borderRadius: 20,
  },
});
