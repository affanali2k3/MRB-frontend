import { Image } from "expo-image";
import React from "react";
import { View, Text, StyleSheet, Dimensions, TouchableOpacity } from "react-native";
import Modal from "react-native-modal";
import HorizontalLine from "./HorizontalLine";
import BoxedReferralInfo from "./BoxedReferralInfo";
import { ReferralCard } from "@/entities/ReferralCard";

interface Props {
  isVisible: boolean;
  onClose: () => void;
}

const PostReferralModal: React.FC<Props> = (props) => {
  return (
    <Modal
      isVisible={props.isVisible}
      onBackdropPress={props.onClose}
      swipeDirection="down"
      onSwipeComplete={props.onClose}
      style={styles.modal}
    >
      <View style={styles.container}>
        <View style={styles.applyClose}>
          <Text>Apply for Lead</Text>
          <TouchableOpacity onPress={props.onClose}>
            <Image style={styles.icon} source={require("@/assets/icons/referral_centre/close.png")} />
          </TouchableOpacity>
        </View>
        <HorizontalLine />
        {/* <BoxedReferralInfo /> */}
      </View>
    </Modal>
  );
};

const styles = StyleSheet.create({
  modal: {
    justifyContent: "flex-end",
    margin: 0,
  },
  applyClose: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  icon: {
    width: 30,
    height: 30,
  },
  container: {
    height: Dimensions.get("window").height * 0.7, // 70% of screen height
    backgroundColor: "white",
    borderTopLeftRadius: 10,
    borderTopRightRadius: 10,
    padding: 20,
  },
});

export default PostReferralModal;
