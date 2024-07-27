import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import { Image } from "expo-image";
import React from "react";
import { FontAwesome } from "@expo/vector-icons";
import { Entypo } from "@expo/vector-icons";
import { Colors } from "@/constants/Colors";
import { ReferralCard } from "@/entities/ReferralCard";
import ReviewInfo from "./ReviewInfo";
import HorizontalLine from "./HorizontalLine";
import ClientType from "./ClientType";
import { ClientTypes } from "@/entities/ClientType";
import { useUser } from "@/hooks/useUser";
interface props {
  card: ReferralCard;
  index: number;
  onApplyReferralModalPress: (index: number) => void;
}
const ReferralCentreCard: React.FC<props> = (props) => {
  const user = useUser().user;

  console.log(props.index);
  return (
    <View style={styles.container}>
      <View style={styles.upperRow}>
        <Image source={require("@/assets/images/default_profile_photo.jpeg")} style={styles.image} />
        <View style={styles.contentContainer}>
          <View style={styles.contentUpperRow}>
            <Text style={styles.name}>{props.card.user.name}</Text>
            <Text style={styles.postedTime}>Posted 1h ago</Text>
          </View>
          <ReviewInfo
            score={props.card.user.agentAnalytic.agentToAgentRatingScore}
            count={props.card.user.agentAnalytic.agentToAgentRatingNumber}
          />

          <View style={styles.clientTypeLocation}>
            <ClientType clientType={props.card.isBuyer ? ClientTypes.buyer : ClientTypes.seller} />
            <View style={styles.locationContainer}>
              <Entypo name="location-pin" size={19} color="#307FD6" />
              <Text>
                {props.card.city}, {props.card.state}
              </Text>
            </View>
          </View>
          <View style={styles.budgetHouseType}>
            <Text style={styles.budget}>${props.card.price}</Text>
            <Text style={styles.houseType}>{props.card.typeOfHouse}</Text>
          </View>
        </View>
      </View>
      <HorizontalLine />
      {props.card.senderAgent === user?.id ? (
        <Text style={styles.postedByYou}>Posted By You</Text>
      ) : (
        <TouchableOpacity style={styles.applyButton} onPress={() => props.onApplyReferralModalPress(props.index)}>
          <Text style={styles.buttonText}>Apply For Lead</Text>
        </TouchableOpacity>
      )}
    </View>
  );
};

export default ReferralCentreCard;

const styles = StyleSheet.create({
  container: {
    padding: 10,
    backgroundColor: "white",
    marginVertical: 5,
    borderRadius: 10,
  },
  postedTime: {
    color: "#B8B8B8",
  },
  postedByYou: {
    textAlign: "center",
    paddingTop: 10,
    fontSize: 16,
  },
  image: {
    height: "100%",
    width: 120,
    borderRadius: 10,
  },
  applyButton: {
    width: "100%",
    backgroundColor: Colors.primaryColor,
    padding: 10,
    borderRadius: 20,
    marginTop: 10,
  },
  buttonText: {
    textAlign: "center",
    color: "white",
  },

  locationContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  contentContainer: {
    flex: 1,
    padding: 10,
  },
  upperRow: {
    flexDirection: "row",
    // flex: 1,
  },
  contentUpperRow: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    width: "100%",
    // flex: 1,
  },
  budgetHouseType: {
    flexDirection: "row",
    alignItems: "center",
    marginTop: 10,
    gap: 30,
  },
  budget: {
    color: "#307FD6",
    fontSize: 20,
    fontWeight: "bold",
  },
  clientTypeLocation: {
    flexDirection: "row",
    alignItems: "center",
    gap: 30,
    marginTop: 20,
  },

  name: {
    color: "#307FD6",
    fontSize: 25,
    fontWeight: "bold",
  },

  houseType: {
    borderWidth: 1,
    borderColor: "#B8B8B8",
    alignSelf: "flex-start",
    textAlign: "center",
    color: "#B8B8B8",
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderRadius: 21,
  },
});
