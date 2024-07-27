import { View, Text, SafeAreaView } from "react-native";
import React, { useState } from "react";
import { Link } from "expo-router";
import ProposalsReceived from "@/components/ProposalsReceived";
import DashboardTabs from "@/components/DashboardTabs";
import { UserProvider } from "@/hooks/useUser";
import ReferralsReceived from "@/components/ReferralsReceived";

const Dashboard = () => {
  const [activeIndex, setActiveIndex] = useState<number>(0);

  const renderContent = () => {
    switch (activeIndex) {
      case 0:
        return <ProposalsReceived />;
      case 1:
        return <ReferralsReceived />;
    }
  };

  return (
    <SafeAreaView>
      <DashboardTabs activeIndex={activeIndex} setActiveIndex={setActiveIndex} />
      {renderContent()}
    </SafeAreaView>
  );
};

export default Dashboard;
