import React, { useEffect, useRef, useState } from "react";
import LoginPage from "./(auth)/login";
import { onAuthStateChanged, User } from "firebase/auth";
import { auth } from "@/configs/firebaseConfig";
import Home from "./(tabs)";
import { Text } from "react-native";
import { router } from "expo-router";
import { UserProvider, useUser } from "@/hooks/useUser";

const App = () => {
  const { setFirebaseUser } = useUser();
  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (user: User | null) => {
      if (user) {
        setFirebaseUser(user);
        router.replace("(tabs)");
      } else {
        setFirebaseUser(null);
        router.replace("login");
      }
    });

    // Cleanup subscription on unmount
    return () => unsubscribe();
  }, []);

  return <Text>Loading</Text>;
};

const AppWrapper: React.FC = () => {
  return (
    <UserProvider>
      <App />
    </UserProvider>
  );
};

export default AppWrapper;
