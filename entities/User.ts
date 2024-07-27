import { AgentAnalytic } from "./AgentAnalytic";

export interface User {
  name: string;
  email: string;

  id: number;
  agentAnalytic: AgentAnalytic;
}
