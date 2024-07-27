import { View, Text, SafeAreaView } from "react-native";
import React from "react";
import { Link } from "expo-router";
import ProposalsReceived from "@/components/ProposalsReceived";
import DashboardTabs from "@/components/DashboardTabs";

const Dashboard = () => {
  return (
    <SafeAreaView>
      <DashboardTabs />
      <ProposalsReceived />
    </SafeAreaView>
  );
};

export default Dashboard;
