import { Image } from "expo-image";
import React, { useState } from "react";
import { View, Text, StyleSheet, Dimensions, TouchableOpacity } from "react-native";
import Modal from "react-native-modal";
import HorizontalLine from "./HorizontalLine";
import BoxedReferralInfo from "./BoxedReferralInfo";
import { Colors } from "@/constants/Colors";
import { Dropdown } from "react-native-element-dropdown";
import { usStates, usStatesAndCities } from "@/constants/States";
import DatePicker from "react-native-date-picker";

interface Props {
  isVisible: boolean;
  onClose: () => void;
}

const PostReferralModal: React.FC<Props> = (props) => {
  const [state, setState] = useState("Alabama");
  const [city, setCity] = useState("");
  const [date, setDate] = useState(new Date());
  const [open, setOpen] = useState(false);

  const stateData = usStates.slice(1);

  const cityData = usStatesAndCities[state];

  const dropdownData = stateData.map((item) => ({ label: item, value: item }));

  const dropdownCityData = cityData.map((item) => ({ label: item, value: item }));

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
          <Text>Post a Referral</Text>
          <TouchableOpacity onPress={props.onClose}>
            <Image style={styles.icon} source={require("@/assets/icons/referral_centre/close.png")} />
          </TouchableOpacity>
        </View>
        <HorizontalLine />
        <Text style={styles.headline}>Post Type</Text>
        <View style={styles.optionsContainer}>
          <View style={styles.option}>
            <Text style={styles.optionText}>Open</Text>
          </View>
          <View style={styles.option}>
            <Text style={styles.optionText}>Direct</Text>
          </View>
        </View>
        <Text style={styles.headline}>Client Type</Text>
        <View style={styles.optionsContainer}>
          <View style={styles.option}>
            <Text style={styles.optionText}>Buyer</Text>
          </View>
          <View style={styles.option}>
            <Text style={styles.optionText}>Seller</Text>
          </View>
        </View>
        <Text style={styles.headline}>State</Text>
        <Dropdown
          data={dropdownData}
          style={styles.dropdown}
          labelField={"value"}
          valueField={"value"}
          placeholder=""
          value={state}
          onChange={(item) => {
            setState(item.value);
          }}
        />
        <Text style={styles.headline}>City</Text>
        <Dropdown
          data={dropdownCityData}
          style={styles.dropdown}
          labelField={"value"}
          valueField={"value"}
          placeholder=""
          value={city}
          onChange={(item) => {
            setCity(item.value);
          }}
        />
        <Text style={styles.headline}>Date</Text>
        <TouchableOpacity
          onPress={() => {
            setOpen(true);
          }}
        >
          <View style={[styles.dropdown, styles.flexRow]}>
            <Text>Select Date</Text>
            <Image style={{ width: 20, height: 20 }} source={require("@/assets/icons/post_referral/date.png")} />
          </View>
        </TouchableOpacity>
        <DatePicker
          modal
          open={open}
          date={date}
          onConfirm={(date) => {
            setOpen(false);
            setDate(date);
          }}
          onCancel={() => {
            setOpen(false);
          }}
        />
      </View>
    </Modal>
  );
};

const styles = StyleSheet.create({
  modal: {
    justifyContent: "flex-end",
    margin: 0,
  },
  flexRow: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  dropdown: {
    backgroundColor: "#F2F4F5",
    padding: 12,
    marginTop: 10,
    borderRadius: 2,
    borderWidth: 1,
    borderColor: "#DDE2E5",
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
  headline: {
    marginTop: 20,
    fontWeight: "600",
  },
  optionsContainer: {
    flexDirection: "row",
    gap: 10,
    marginTop: 10,
  },
  optionActive: {
    backgroundColor: Colors.primaryColor,
  },
  optionText: {
    color: "#ABAFB1",
  },
  option: {
    paddingVertical: 10,
    paddingHorizontal: 30,
    backgroundColor: "#EFF1F999",
  },
});

export default PostReferralModal;
