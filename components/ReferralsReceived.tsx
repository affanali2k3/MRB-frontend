import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";
import { ReferralDirectForm } from "@/entities/ReferralDirectForm";
import ReferralCentreCard from "./ReferralCentreCard";
import ReferralReceivedCard from "./ReferralReceivedCard";
import ApplyForReferralModal from "./ApplyForReferralModal";
import ApplyForReferralDirectModal from "./ApplyForReferralDirectModal";

const ReferralsReceived = () => {
  const [referrals, setReferrals] = useState<ReferralDirectForm[]>([]);
  const [applyReferralIndex, setApplyReferralIndex] = useState<number | null>(null);
  const [applyReferralModalIsVisible, setApplyReferralModalIsVisible] = useState<boolean>(false);
  const { user } = useUser();
  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get(`${url}/referral-forms/get-forms-received?userId=${user?.id}`);
        setReferrals(response.data.data);
      } catch (err) {
        alert(err);
      }
    };
    getData();
  }, []);

  return (
    <>
      <FlatList
        data={referrals}
        renderItem={({ item, index }) => (
          <ReferralReceivedCard
            onApplyReferralModalPress={(index: number) => {
              setApplyReferralIndex(index);
              setApplyReferralModalIsVisible(true);
            }}
            card={item}
            index={index}
          ></ReferralReceivedCard>
        )}
      ></FlatList>
      {applyReferralIndex !== null && (
        <ApplyForReferralDirectModal
          applyReferralDetails={referrals[applyReferralIndex]}
          isVisible={applyReferralModalIsVisible}
          onClose={() => {
            setApplyReferralModalIsVisible(false);
            setApplyReferralIndex(null); // Reset the details when modal is closed
          }}
        />
      )}
    </>
  );
};

export default ReferralsReceived;

const styles = StyleSheet.create({});
