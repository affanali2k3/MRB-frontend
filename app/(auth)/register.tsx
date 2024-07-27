import React, { useState } from "react";
import { View, Text, TextInput, TouchableOpacity, Image, StyleSheet, ScrollView } from "react-native";
import { StackNavigationProp } from "@react-navigation/stack";
import { useNavigation } from "@react-navigation/native";
import { router } from "expo-router";

const RegisterPage: React.FC = () => {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [confirmPassword, setConfirmPassword] = useState<string>("");
  const [obscurePassword, setObscurePassword] = useState<boolean>(true);
  const [obscureConfirmPassword, setObscureConfirmPassword] = useState<boolean>(true);
  const [confirmPasswordError, setConfirmPasswordError] = useState<string | null>(null);

  const handleSignUp = () => {
    if (password !== confirmPassword) {
      setConfirmPasswordError("Passwords do not match");
      return;
    }
    setConfirmPasswordError(null);
    // Handle Sign Up Logic Here
  };

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Image source={require("@/assets/images/logo.png")} style={styles.logo} />
      <Text style={styles.title}>Welcome to MRB</Text>
      <TextInput
        style={styles.input}
        placeholder="Enter email address"
        value={email}
        onChangeText={setEmail}
        keyboardType="email-address"
        autoCapitalize="none"
      />
      <TextInput
        style={styles.input}
        placeholder="Create Password"
        value={password}
        onChangeText={setPassword}
        secureTextEntry={obscurePassword}
        autoCapitalize="none"
      />
      <TextInput
        style={styles.input}
        placeholder="Confirm Password"
        value={confirmPassword}
        onChangeText={setConfirmPassword}
        secureTextEntry={obscureConfirmPassword}
        autoCapitalize="none"
      />
      {confirmPasswordError && <Text style={styles.error}>{confirmPasswordError}</Text>}
      <TouchableOpacity style={styles.button} onPress={handleSignUp}>
        <View style={styles.buttonContent}>
          <Text style={styles.buttonText}>Sign Up with Email</Text>
        </View>
      </TouchableOpacity>
      <TouchableOpacity
        style={styles.socialButton}
        onPress={() => {
          /* Google Sign In Logic Here */
        }}
      >
        <View style={styles.socialButtonContent}>
          <Image source={require("@/assets/images/google.png")} style={styles.socialIcon} />
          <Text style={styles.socialButtonText}>Sign in with Google</Text>
        </View>
      </TouchableOpacity>
      <TouchableOpacity
        style={[styles.socialButton, styles.facebookButton]}
        onPress={() => {
          /* Facebook Sign In Logic Here */
        }}
      >
        <View style={styles.socialButtonContent}>
          <Image source={require("@/assets/images/facebook.png")} style={styles.socialIcon} />
          <Text style={styles.facebookButtonText}>Sign in with Facebook</Text>
        </View>
      </TouchableOpacity>
      <View style={styles.loginTextContainer}>
        <Text>Already have an account?</Text>
        <TouchableOpacity onPress={() => router.push("login")}>
          <Text style={styles.loginText}>Login</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    padding: 20,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: "white",
  },
  logo: {
    width: 100,
    height: 100,
    marginBottom: 20,
  },
  title: {
    fontSize: 26,
    fontWeight: "bold",
    marginBottom: 50,
  },
  input: {
    width: "100%",
    padding: 10,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: "#ccc",
    marginBottom: 20,
  },
  button: {
    backgroundColor: "#1868fd",
    borderRadius: 20,
    paddingVertical: 15,
    paddingHorizontal: 20,
    marginBottom: 40,
    width: "100%",
  },
  buttonContent: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
  },
  buttonText: {
    color: "#fff",
    fontSize: 16,
  },
  error: {
    color: "red",
    marginBottom: 20,
  },
  socialButton: {
    backgroundColor: "#fff",
    borderRadius: 20,
    paddingVertical: 10,
    paddingHorizontal: 15,
    marginBottom: 10,
    borderWidth: 1,
    borderColor: "#ccc",
    width: "100%",
  },
  facebookButtonText: {
    color: "white",
  },
  socialButtonContent: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
  },
  socialIcon: {
    width: 30,
    height: 30,
    marginRight: 10,
  },
  socialButtonText: {
    color: "#000",
    fontSize: 16,
  },
  facebookButton: {
    backgroundColor: "#1c5799",
    borderColor: "#1c5799",
  },
  loginTextContainer: {
    flexDirection: "row",
    alignItems: "center",
    marginTop: 20,
  },
  loginText: {
    color: "#1868fd",
    marginLeft: 5,
  },
});

export default RegisterPage;
