import { User as FirebaseUser } from "firebase/auth";
import { User } from "@/entities/User";
import { createContext, ReactNode, useContext, useEffect, useState } from "react";
import axios from "axios";
import { url } from "@/constants/Server";

interface UserContextType {
  firebaseUser: FirebaseUser | null;
  user: User | null;
  setFirebaseUser: (user: FirebaseUser | null) => void;
  setUser: (user: User | null) => void;
}

const UserContext = createContext<UserContextType | undefined>(undefined);

export const UserProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [firebaseUser, setFirebaseUser] = useState<FirebaseUser | null>(null);
  const [user, setUser] = useState<User | null>(null);

  useEffect(() => {
    console.log(user?.id);
  }, [user]);

  useEffect(() => {
    const getUser = async () => {
      try {
        const response = await axios.get(`${url}/users/get/email?userEmail=a@gmail.com`);
        setUser(response.data.data);
      } catch (err) {
        alert(err);
      }
    };
    getUser();
  }, []);

  return <UserContext.Provider value={{ user, setUser, firebaseUser, setFirebaseUser }}>{children}</UserContext.Provider>;
};

export const useUser = (): UserContextType => {
  const context = useContext(UserContext);
  if (context === undefined) {
    throw new Error("useUser must be used within a UserProvider");
  }
  return context;
};
