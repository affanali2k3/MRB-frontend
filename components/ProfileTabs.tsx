import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { Dispatch, SetStateAction } from "react";
import PageTab from "./PageTab";
import ProfileTab from "./ProfileTab";

interface props {
  activeIndex: number;
  setActiveIndex: Dispatch<SetStateAction<number>>;
}

const ProfileTabs: React.FC<props> = (props) => {
  const tabs = ["Network", "Posts", "Reviews", "About"];
  return (
    <FlatList
      horizontal={true}
      showsHorizontalScrollIndicator={false}
      data={tabs}
      renderItem={({ item, index }) => (
        <ProfileTab active={index === props.activeIndex} title={item} index={index} setActiveIndex={props.setActiveIndex}></ProfileTab>
      )}
    ></FlatList>
  );
};

export default ProfileTabs;

const styles = StyleSheet.create({});
