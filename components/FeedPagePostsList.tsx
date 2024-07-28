import { FlatList, StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";
import PostCard from "./PostCard";

const FeedPagePostsList = () => {
  const [posts, setPosts] = useState();
  const { user } = useUser();
  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get(`${url}/feed/get?userId=${user?.id}&page=1`);
        setPosts(response.data.data);
      } catch (err) {
        alert(err);
      }
    };
    getData();
  }, []);
  return <FlatList data={posts} renderItem={({ item }) => <PostCard post={item} />}></FlatList>;
};

export default FeedPagePostsList;

const styles = StyleSheet.create({});
