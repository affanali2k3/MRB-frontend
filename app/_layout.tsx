import { UserProvider } from "@/hooks/useUser";
import { Stack } from "expo-router";

export default function RootLayout() {
  return (
    <UserProvider>
      <Stack
        screenOptions={{
          headerShown: false,
        }}
      >
        <Stack.Screen name="(auth)" />
        <Stack.Screen name="(drawer)" />
      </Stack>
    </UserProvider>
  );
}
