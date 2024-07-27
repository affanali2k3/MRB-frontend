import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { useState } from "react";
import PageTab from "./PageTab";

const DashboardTabs = () => {
  const [activeIndex, setActiveIndex] = useState<number>(0);
  const tabs = ["Proposals Received", "Referrals Received", "Referrals Sent"];
  return (
    <FlatList
      showsHorizontalScrollIndicator={false}
      horizontal={true}
      data={tabs}
      renderItem={({ item, index }) => (
        <PageTab
          onPress={(i) => {
            setActiveIndex(i);
          }}
          index={index}
          active={index === activeIndex}
          title={item}
        />
      )}
    ></FlatList>
  );
};

export default DashboardTabs;

const styles = StyleSheet.create({});
