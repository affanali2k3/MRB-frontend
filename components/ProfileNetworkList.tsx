import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";
import { User } from "@/entities/User";
import UserFollowCard from "./UserFollowCard";

interface props {
  userId: number;
}

const ProfileNetworkList: React.FC<props> = (props) => {
  const [associates, setAssociates] = useState<User[]>([]);
  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get(`${url}/user-associates/get-all?userId=${props.userId}`);
        setAssociates(response.data.data);
      } catch (err) {
        alert(err);
      }
    };
    getData();
  }, []);
  return <FlatList data={associates} renderItem={({ item }) => <UserFollowCard user={item} userId={props.userId} />} />;
};

export default ProfileNetworkList;

const styles = StyleSheet.create({});
