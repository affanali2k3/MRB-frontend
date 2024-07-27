import { StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";

const ProposalsReceived = () => {
  const { user, firebaseUser } = useUser();

  const [openProposals, setOpenProposals] = useState([]);
  const [directProposals, setDirectProposals] = useState([]);
  useEffect(() => {
    const getData = async () => {
      try {
        console.log(firebaseUser?.email);
        const response = await axios.get(`${url}/proposals/forms-proposal-received?userId=${user?.id}`);
        console.log(response.data);
        setOpenProposals(response.data.openProposals);
        setDirectProposals(response.data.directProposals);
      } catch (err) {
        alert(err);
      }
    };

    getData();
  }, [user, firebaseUser]);

  return (
    <View>
      <Text>ProposalsReceived</Text>
    </View>
  );
};

export default ProposalsReceived;

const styles = StyleSheet.create({});
