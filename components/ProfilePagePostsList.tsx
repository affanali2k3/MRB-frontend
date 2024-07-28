import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import { useUser } from "@/hooks/useUser";
import axios from "axios";
import { url } from "@/constants/Server";
import PostCard from "./PostCard";

const ProfilePagePostsList = () => {
  const [posts, setPosts] = useState();
  const { user } = useUser();
  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get(`${url}/posts/get-all?userId=${user?.id}`);
        setPosts(response.data.data);
      } catch (err) {
        alert(err);
      }
    };
    getData();
  }, []);
  return <FlatList data={posts} renderItem={({ item }) => <PostCard post={item} />}></FlatList>;
};

export default ProfilePagePostsList;

const styles = StyleSheet.create({});
