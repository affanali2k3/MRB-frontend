import { Image } from "expo-image";
import React, { useState } from "react";
import { View, Text, StyleSheet, Dimensions, TouchableOpacity, TextInput } from "react-native";
import Modal from "react-native-modal";
import HorizontalLine from "./HorizontalLine";
import BoxedReferralInfo from "./BoxedReferralInfo";
import { useUser } from "@/hooks/useUser";
import { Colors } from "@/constants/Colors";

interface Props {
  isVisible: boolean;
  onClose: () => void;
}

const PostToFeedModal: React.FC<Props> = (props) => {
  const [postText, setPostText] = useState("");
  const { user } = useUser();
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
          <View style={styles.imageName}>
            <Image style={styles.image} source={require("@/assets/images/default_profile_photo.jpeg")} />
            <Text>{user?.name}</Text>
          </View>
          <TouchableOpacity onPress={props.onClose}>
            <Image style={styles.icon} source={require("@/assets/icons/referral_centre/close.png")} />
          </TouchableOpacity>
        </View>
        <HorizontalLine />
        <TextInput placeholder={"Whats on your mind..."} style={styles.postText} multiline={true} onChangeText={setPostText} />
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
  imageName: {
    flexDirection: "row",
    gap: 10,
    alignItems: "center",
  },
  postText: {
    borderRadius: 20,
    backgroundColor: Colors.neutralColor,
    textAlignVertical: "top",
    height: 200,
    padding: 20,
    marginTop: 20,
    alignItems: "flex-start",
  },
  applyClose: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  image: {
    width: 50,
    height: 50,
    borderRadius: 50,
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

export default PostToFeedModal;
