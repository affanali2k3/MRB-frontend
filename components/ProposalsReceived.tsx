import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";
import ProposalReceivedCard from "./ProposalReceivedCard";
import { ProposalOpenForm } from "@/entities/ProposalOpenForm";
import { ProposalDirectForm } from "@/entities/ProposalDirectForm";

const ProposalsReceived = () => {
  const { user } = useUser();

  const [openProposals, setOpenProposals] = useState<ProposalOpenForm[]>([]);
  const [directProposals, setDirectProposals] = useState<ProposalDirectForm[]>([]);

  useEffect(() => {
    const getOpenProposals = async () => {
      try {
        const response = await axios.get(`${url}/proposals/open-forms-proposal-received?userId=${user?.id}`);
        setOpenProposals(response.data.openProposals);
      } catch (err) {
        alert(err);
      }
    };

    getOpenProposals();
  }, []);

  useEffect(() => {
    const getDirectProposals = async () => {
      try {
        const response = await axios.get(`${url}/proposals/direct-forms-proposal-received?userId=${user?.id}`);
        setDirectProposals(response.data.directProposals);
      } catch (err) {
        alert(err);
      }
    };

    getDirectProposals();
  }, []);

  return (
    <View>
      <FlatList
        data={openProposals}
        renderItem={({ item, index }) => (
          <ProposalReceivedCard
            name={item.referralForm.user.name}
            reviewCount={item.referralForm.user.agentAnalytic.agentToAgentRatingNumber}
            reviewScore={item.referralForm.user.agentAnalytic.agentToAgentRatingScore}
            yearsOfExperience={item.referralForm.user.agentAnalytic.yearsOfExperience}
            housesSold={item.referralForm.user.agentAnalytic.housesSold}
            listingsSold={item.referralForm.user.agentAnalytic.housesBought}
            proposal={item.proposal}
          ></ProposalReceivedCard>
        )}
      ></FlatList>
      <FlatList
        data={directProposals}
        renderItem={({ item, index }) => (
          <ProposalReceivedCard
            name={item.referralForm.senderAgent.name}
            reviewCount={item.referralForm.senderAgent.agentAnalytic.agentToAgentRatingNumber}
            reviewScore={item.referralForm.senderAgent.agentAnalytic.agentToAgentRatingScore}
            yearsOfExperience={item.referralForm.senderAgent.agentAnalytic.yearsOfExperience}
            housesSold={item.referralForm.senderAgent.agentAnalytic.housesSold}
            listingsSold={item.referralForm.senderAgent.agentAnalytic.housesBought}
            proposal={item.proposal}
          ></ProposalReceivedCard>
        )}
      ></FlatList>
    </View>
  );
};

export default ProposalsReceived;

const styles = StyleSheet.create({});
