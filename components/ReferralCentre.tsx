import { View, Text, ScrollView, FlatList, SafeAreaView, StyleSheet } from "react-native";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";
import ReferralCentreCard from "./ReferralCentreCard";
import PostReferralModal from "./PostReferralModal";
import ApplyForReferralModal from "./ApplyForReferralModal";
import { useUser } from "@/hooks/useUser";
import { ReferralOpenForm } from "@/entities/ReferralOpenForm";

export default function ReferralCentre() {
  const [referrals, setReferrals] = useState<ReferralOpenForm[]>([]);
  const [applyReferralIndex, setApplyReferralIndex] = useState<number | null>(null);
  const [applyReferralModalIsVisible, setApplyReferralModalIsVisible] = useState<boolean>(false);

  useEffect(() => {
    getData();
  }, []);

  const getData = async () => {
    try {
      const response = await axios.get(`${url}/referral-center/search`);
      setReferrals(response.data.data);
    } catch (err) {
      alert(err);
    }
  };

  const renderItem = ({ item, index }: { item: ReferralOpenForm; index: number }) => (
    <ReferralCentreCard
      index={index}
      onApplyReferralModalPress={(index: number) => {
        setApplyReferralIndex(index);
        setApplyReferralModalIsVisible(true);
      }}
      card={item}
    />
  );

  return (
    <SafeAreaView style={style.container}>
      <FlatList data={referrals} renderItem={renderItem} keyExtractor={(item, index) => index.toString()} />
      {applyReferralIndex !== null && (
        <ApplyForReferralModal
          applyReferralDetails={referrals[applyReferralIndex]}
          isVisible={applyReferralModalIsVisible}
          onClose={() => {
            setApplyReferralModalIsVisible(false);
            setApplyReferralIndex(null); // Reset the details when modal is closed
          }}
        />
      )}
    </SafeAreaView>
  );
}

const style = StyleSheet.create({
  container: {
    padding: 5,
  },
});
