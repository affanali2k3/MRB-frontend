import { StyleSheet, Text, View } from "react-native";
import React from "react";
import NameReviews from "./NameReviews";

interface props {
  name: string;
  reviewCount: number;
  reviewScore: number;
  yearsOfExperience: number;
  listingsSold: number;
  housesSold: number;
  proposal: string;
}

const ProposalReceivedCard: React.FC<props> = (props) => {
  return (
    <View style={styles.container}>
      <View style={styles.nameExperience}>
        <NameReviews name={props.name} reviewCount={props.reviewCount} reviewScore={props.reviewScore} />
        <Text>{props.yearsOfExperience} Active Years</Text>
      </View>
      <View style={styles.proposalTextContainer}>
        <Text>{props.proposal}</Text>
      </View>
      <View style={styles.stats}>
        <View style={styles.stat}>
          <Text style={styles.statHeading}>{props.yearsOfExperience}</Text>
          <Text>Years of Exp</Text>
        </View>
        <View style={styles.stat}>
          <Text style={styles.statHeading}>{props.listingsSold}</Text>
          <Text>Listings sold</Text>
        </View>
        <View style={styles.stat}>
          <Text style={styles.statHeading}>{props.housesSold}</Text>
          <Text>Houses sold</Text>
        </View>
      </View>
    </View>
  );
};

export default ProposalReceivedCard;

const styles = StyleSheet.create({
  container: {
    padding: 20,
    margin: 10,
    backgroundColor: "white",
    borderRadius: 20,
  },
  nameExperience: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    marginBottom: 20,
  },
  proposalTextContainer: {
    padding: 10,
    borderRadius: 20,
    marginBottom: 20,
  },
  stats: {
    flexDirection: "row",
    justifyContent: "space-between",
  },
  stat: {
    // justifyContent: "center",
    alignItems: "center",
  },
  statHeading: {
    fontSize: 18,
    fontWeight: "bold",
  },
});
