import { url } from "@/constants/Server";
import axios from "axios";
import { getReactNativePersistence, signInWithEmailAndPassword, initializeAuth } from "firebase/auth";
import ReactNativeAsyncStorage from "@react-native-async-storage/async-storage";
import React, { useState } from "react";
import { View, Text, TextInput, TouchableOpacity, Image, StyleSheet, ScrollView, GestureResponderEvent } from "react-native";
import { router } from "expo-router";
import { auth } from "@/configs/firebaseConfig";

const LoginPage = () => {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [obscurePassword, setObscurePassword] = useState<boolean>(true);
  const [errorMessage, setErrorMessage] = useState<string>("");

  const handleLogin = async (e: GestureResponderEvent) => {
    try {
      const response = await signInWithEmailAndPassword(auth, email, password);
      alert(response);
    } catch (err: any) {
      console.error(err);
      alert(err.response.data.message);
    }
  };

  return (
    <ScrollView style={styles.container}>
      <View style={styles.innerContainer}>
        <Image source={require("@/assets/images/logo.png")} style={styles.logo} />

        <Text style={styles.welcomeText}>Welcome to MRB</Text>

        <Text style={styles.label}>Choose an email</Text>

        <TextInput
          style={styles.input}
          placeholder="youremail@gmail.com"
          keyboardType="email-address"
          value={email}
          onChangeText={setEmail}
          placeholderTextColor="#999"
        />
        {errorMessage ? <Text style={styles.errorText}>{errorMessage}</Text> : null}

        <Text style={styles.label}>Choose a password</Text>
        <TextInput
          style={styles.input}
          placeholder="********"
          secureTextEntry={obscurePassword}
          value={password}
          onChangeText={setPassword}
          placeholderTextColor="#999"
        />

        {errorMessage ? <Text style={styles.errorText}>{errorMessage}</Text> : null}

        <TouchableOpacity style={styles.forgotPasswordContainer}>
          <Text style={styles.forgotPasswordText}>Forgot Password?</Text>
        </TouchableOpacity>

        <TouchableOpacity onPress={handleLogin} style={styles.loginButton}>
          <Text style={styles.loginButtonText}>Login</Text>
        </TouchableOpacity>

        <View style={styles.registerContainer}>
          <Text>Don't have an account?</Text>
          <TouchableOpacity onPress={() => router.push("(drawer)")}>
            <Text style={styles.registerText}>Register</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.separatorContainer}>
          <View style={styles.separatorLine} />
          <Text style={styles.separatorText}>Sign In with</Text>
          <View style={styles.separatorLine} />
        </View>

        <View style={styles.socialButtonsContainer}>
          <TouchableOpacity>
            <Image source={require("@/assets/images/apple.png")} style={styles.socialButton} />
          </TouchableOpacity>
          <TouchableOpacity>
            <Image source={require("@/assets/images/facebook2.png")} style={styles.socialButton} />
          </TouchableOpacity>
          <TouchableOpacity>
            <Image source={require("@/assets/images/linkedin.png")} style={styles.socialButton} />
          </TouchableOpacity>
          <TouchableOpacity>
            <Image source={require("@/assets/images/google.png")} style={styles.socialButton} />
          </TouchableOpacity>
        </View>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    // flex: 1,
    backgroundColor: "white",
    // pa: 20,
    marginTop: 30,
  },
  innerContainer: {
    margin: 20,
  },
  logo: {
    width: 100,
    height: 100,
    alignSelf: "center",
    marginBottom: 40,
  },
  welcomeText: {
    fontSize: 22,
    fontWeight: "bold",
    marginBottom: 40,
    color: "black",
  },
  input: {
    height: 50,
    borderColor: "#ddd",
    borderWidth: 1,
    borderRadius: 10,
    paddingLeft: 15,
    marginBottom: 10,
    backgroundColor: "#FEFEFE",
  },
  errorText: {
    color: "red",
  },
  label: {
    width: "100%",
    marginBottom: 5,
    color: "black",
  },
  passwordContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  eyeIcon: {
    width: 24,
    height: 24,
    marginLeft: -40,
  },
  forgotPasswordContainer: {
    alignItems: "flex-end",
    marginBottom: 20,
  },
  forgotPasswordText: {
    color: "#007AFF",
  },
  loginButton: {
    backgroundColor: "#007AFF",
    paddingVertical: 15,
    borderRadius: 10,
    alignItems: "center",
    marginBottom: 20,
  },
  loginButtonText: {
    color: "#FFF",
    fontSize: 16,
    fontWeight: "bold",
  },
  registerContainer: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    marginBottom: 60,
  },
  registerText: {
    color: "#007AFF",
    marginLeft: 5,
  },
  separatorContainer: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 20,
  },
  separatorLine: {
    flex: 1,
    height: 0.5,
    backgroundColor: "#CCC",
  },
  separatorText: {
    marginHorizontal: 10,
    color: "#CCC",
  },
  socialButtonsContainer: {
    flexDirection: "row",
    justifyContent: "center",
  },
  socialButton: {
    width: 50,
    height: 50,
    marginHorizontal: 5,
  },
});

export default LoginPage;
