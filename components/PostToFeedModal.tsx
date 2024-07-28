import { Image } from "expo-image";
import React, { useState } from "react";
import { View, Text, StyleSheet, Dimensions, TouchableOpacity, TextInput, Button, ScrollView } from "react-native";
import Modal from "react-native-modal";
import HorizontalLine from "./HorizontalLine";
import { useUser } from "@/hooks/useUser";
import { Colors } from "@/constants/Colors";
import * as ImagePicker from "expo-image-picker";
import axios from "axios";
import { url } from "@/constants/Server";
import mime from "mime";
import PrimaryButton from "./PrimaryButton";

interface Props {
  isVisible: boolean;
  onClose: () => void;
}

const PostToFeedModal: React.FC<Props> = (props) => {
  const [postText, setPostText] = useState("");
  const [imageUri, setImageUri] = useState<string | null>(null);
  const { user } = useUser();

  const pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.All,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    });

    if (!result.canceled) {
      setImageUri(result.assets[0].uri);
    }
  };

  const post = async () => {
    try {
      const formData = new FormData();
      formData.append("postText", postText);
      formData.append("userId", user!.id.toString());

      if (imageUri) {
        formData.append("images", {
          uri: imageUri,
          type: mime.getType(imageUri)!,
          name: "image.jpg",
        } as any);
      }

      const response = await axios.post(`${url}/posts/create`, formData, {
        headers: {
          "content-type": "multipart/form-data",
        },
      });
      console.log(response.data);
    } catch (err) {
      alert(err);
    }
  };

  return (
    <Modal
      isVisible={props.isVisible}
      onBackdropPress={props.onClose}
      swipeDirection="down"
      onSwipeComplete={props.onClose}
      style={styles.modal}
    >
      <View style={styles.container}>
        <ScrollView showsVerticalScrollIndicator={false}>
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
          <TouchableOpacity onPress={pickImage}>
            <View style={styles.addPhoto}>
              <Image style={styles.iconPhoto} source={require("@/assets/icons/feed_page/photo.png")} />
              <Text>Add Photo</Text>
            </View>
          </TouchableOpacity>
          {imageUri && <Image source={{ uri: imageUri }} style={styles.selectedImage} />}
        </ScrollView>
        <View style={styles.buttonContainer}>
          <PrimaryButton text="Post" onPress={post} />
        </View>
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
  buttonContainer: {
    justifyContent: "flex-end",
  },
  selectedImage: {
    width: "100%",
    height: 300,
    marginTop: 20,
    marginBottom: 20,
    borderRadius: 20,
  },
  addPhoto: {
    backgroundColor: Colors.neutralColor,
    padding: 10,
    flexDirection: "row",
    justifyContent: "center",
    gap: 10,
    marginTop: 20,
    borderRadius: 20,
  },
  iconPhoto: {
    height: 20,
    width: 20,
    tintColor: "black",
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
