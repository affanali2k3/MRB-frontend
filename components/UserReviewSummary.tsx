import { StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";
import { AgentAnalytic } from "@/entities/AgentAnalytic";
import { FontAwesome } from "@expo/vector-icons";
import { StarRatingDisplay } from "react-native-star-rating-widget";

interface props {
  userId: number;
}

const UserReviewSummary: React.FC<props> = (props) => {
  const [reviewSummary, setReviewSummary] = useState<AgentAnalytic | null>(null);
  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get(`${url}/agent-analytic/get-agent-analytic?userId=${props.userId}`);
        setReviewSummary(response.data.data);
      } catch (err) {
        alert(err);
      }
    };
    getData();
  }, []);
  return (
    <View>
      {reviewSummary && (
        <View style={styles.container}>
          <View>
            <View style={styles.bar}>
              <Text>5</Text>
              <FontAwesome name="star" size={10} color="orange" />
              <View style={styles.ratingBar} />
            </View>
            <View style={styles.bar}>
              <Text>4</Text>
              <FontAwesome name="star" size={10} color="orange" />
              <View style={styles.ratingBar} />
            </View>
            <View style={styles.bar}>
              <Text>3</Text>
              <FontAwesome name="star" size={10} color="orange" />
              <View style={styles.ratingBar} />
            </View>
            <View style={styles.bar}>
              <Text>2</Text>
              <FontAwesome name="star" size={10} color="orange" />
              <View style={styles.ratingBar} />
            </View>
            <View style={styles.bar}>
              <Text>1</Text>
              <FontAwesome name="star" size={10} color="orange" />
              <View style={styles.ratingBar} />
            </View>
          </View>
          <View style={styles.left}>
            <Text style={styles.score}>{reviewSummary?.agentToAgentRatingScore}</Text>
            <StarRatingDisplay rating={4.5} starSize={10} color="orange" />
            <Text>{reviewSummary?.agentToAgentRatingNumber} Reviews</Text>
          </View>
        </View>
      )}
    </View>
  );
};

export default UserReviewSummary;

const styles = StyleSheet.create({
  container: {
    margin: 10,
    padding: 10,
    flexDirection: "row",
    justifyContent: "space-between",
    backgroundColor: "#F4F4F482",
    borderWidth: 1,
    borderColor: "#00000017",
    borderRadius: 5,
  },
  score: {
    fontSize: 20,
    fontWeight: "bold",
  },
  left: {
    alignItems: "flex-end",
    justifyContent: "center",
    gap: 10,
  },
  ratingBar: {
    backgroundColor: "#006D60",
    height: 2,
    width: 50,
  },
  bar: {
    flexDirection: "row",
    alignItems: "center",
    gap: 5,
  },
});
