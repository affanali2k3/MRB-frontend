import { View, Text, SafeAreaView } from "react-native";
import React, { useEffect, useState } from "react";
import ProfileNameStats from "@/components/ProfileNameStats";
import axios from "axios";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";
import ProfileTabs from "@/components/ProfileTabs";

const Profile = () => {
  const { user } = useUser();
  const [activeIndex, setActiveIndex] = useState<number>(0);

  return (
    <SafeAreaView>
      <ProfileNameStats {...user!} />
      <ProfileTabs activeIndex={activeIndex} setActiveIndex={setActiveIndex} />
    </SafeAreaView>
  );
};

export default Profile;
