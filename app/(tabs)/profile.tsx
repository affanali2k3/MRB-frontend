import { View, Text, SafeAreaView } from "react-native";
import React, { useEffect, useState } from "react";
import ProfileNameStats from "@/components/ProfileNameStats";
import axios from "axios";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";
import ProfileTabs from "@/components/ProfileTabs";
import ProfilePagePostsList from "@/components/ProfilePagePostsList";

const Profile = () => {
  const { user } = useUser();
  const [activeIndex, setActiveIndex] = useState<number>(0);

  const renderContent = () => {
    switch (activeIndex) {
      case 0:
        return null;
      case 1:
        return <ProfilePagePostsList />;
      case 2:
        return null;
      case 3:
        return null;
    }
  };

  return (
    <>
      <ProfileNameStats {...user!} />
      <ProfileTabs activeIndex={activeIndex} setActiveIndex={setActiveIndex} />
      {renderContent()}
    </>
  );
};

export default Profile;
