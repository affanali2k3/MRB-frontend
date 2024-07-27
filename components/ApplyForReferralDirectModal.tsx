import { Image } from "expo-image";
import React, { useState } from "react";
import { View, Text, StyleSheet, Dimensions, TouchableOpacity, TextInput, Button } from "react-native";
import Modal from "react-native-modal";
import HorizontalLine from "./HorizontalLine";
import BoxedReferralInfo from "./BoxedReferralInfo";
import { ClientTypes } from "@/entities/ClientType";
import PrimaryButton from "./PrimaryButton";
import { ReferralOpenForm } from "@/entities/ReferralOpenForm";
import { ReferralDirectForm } from "@/entities/ReferralDirectForm";

interface Props {
  isVisible: boolean;
  applyReferralDetails: ReferralDirectForm;
  onClose: () => void;
}

const ApplyForReferralDirectModal: React.FC<Props> = (props) => {
  const [proposal, setProposal] = useState<string>("");
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
        <View style={styles.spacer}></View>
        <BoxedReferralInfo
          name={props.applyReferralDetails.senderAgent.name}
          reviewCount={props.applyReferralDetails.senderAgent.agentAnalytic.agentToAgentRatingNumber}
          clientType={props.applyReferralDetails.isBuyer ? ClientTypes.buyer : ClientTypes.seller}
          timeAmount={props.applyReferralDetails.timeAmount}
          reviewScore={props.applyReferralDetails.senderAgent.agentAnalytic.agentToAgentRatingScore}
        />
        <View style={styles.spacer}></View>

        <HorizontalLine />
        <Text style={styles.aboutHeading}>About Lead</Text>
        <Text>{props.applyReferralDetails.details}</Text>
        <View style={styles.locationPriceType}>
          <View>
            <Text style={styles.detailsHeading}>Lead Location</Text>
            <Text>
              {props.applyReferralDetails.city}, {props.applyReferralDetails.state}
            </Text>
          </View>
          <View>
            <Text style={styles.detailsHeading}>Budget</Text>
            <Text>$ {props.applyReferralDetails.price}</Text>
          </View>
          <View>
            <Text style={styles.detailsHeading}>Property Type</Text>
            <Text>{props.applyReferralDetails.typeOfHouse}</Text>
          </View>
        </View>
        <HorizontalLine />
        <Text style={styles.aboutHeading}> Proposal</Text>
        <TextInput style={styles.input} multiline={true} onChangeText={setProposal} value={proposal} placeholder="Your proposal..." />
        <View style={styles.buttonView}>
          <PrimaryButton onPress={() => {}} text="Send Proposal" />
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
  spacer: {
    height: 10,
  },
  buttonView: {
    flex: 1,
    justifyContent: "flex-end",
  },

  input: {
    height: 150,
    borderColor: "#ddd",
    borderWidth: 1,
    borderRadius: 10,
    padding: 20,
    marginBottom: 10,
    backgroundColor: "#74748014",
    textAlignVertical: "top",
  },
  locationPriceType: {
    flexDirection: "row",
    justifyContent: "space-between",
    marginTop: 20,
  },
  aboutHeading: {
    marginTop: 20,
    marginBottom: 10,
    fontWeight: "bold",
    fontSize: 18,
  },
  detailsHeading: {
    fontWeight: "bold",
    fontSize: 16,
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

export default ApplyForReferralDirectModal;
