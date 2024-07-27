import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { Dispatch, SetStateAction, useState } from "react";
import PageTab from "./PageTab";

interface props {
  activeIndex: number;
  setActiveIndex: Dispatch<SetStateAction<number>>;
}

const DashboardTabs: React.FC<props> = (props) => {
  const tabs = ["Proposals Received", "Referrals Received", "Referrals Sent"];
  return (
    <FlatList
      showsHorizontalScrollIndicator={false}
      horizontal={true}
      data={tabs}
      renderItem={({ item, index }) => (
        <PageTab
          onPress={(i) => {
            props.setActiveIndex(i);
          }}
          index={index}
          active={index === props.activeIndex}
          title={item}
        />
      )}
    ></FlatList>
  );
};

export default DashboardTabs;

const styles = StyleSheet.create({});
