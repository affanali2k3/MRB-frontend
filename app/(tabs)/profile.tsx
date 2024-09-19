import { View, Text, SafeAreaView } from "react-native";
import React, { useEffect, useState } from "react";
import ProfileNameStats from "@/components/ProfileNameStats";
import axios from "axios";
import { url } from "@/constants/Server";
import { useUser } from "@/hooks/useUser";
import ProfileTabs from "@/components/ProfileTabs";
import ProfilePagePostsList from "@/components/ProfilePagePostsList";
import ProfileNetworkList from "@/components/ProfileNetworkList";
import UserReviewSummary from "@/components/UserReviewSummary";
import ProfileReviewList from "@/components/ProfileReviewList";
import ProfileAbout from "@/components/ProfileAbout";

const Profile = () => {
  const { user } = useUser();
  const [activeIndex, setActiveIndex] = useState<number>(0);

  const renderContent = () => {
    switch (activeIndex) {
      case 0:
        return <ProfileNetworkList userId={user!.id} />;
      case 1:
        return <ProfilePagePostsList />;
      case 2:
        return (
          <>
            <UserReviewSummary userId={user!.id} />
            <ProfileReviewList />
          </>
        );
      case 3:
        return <ProfileAbout user={user!} />;
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
