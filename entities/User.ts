import { AgentAnalytic } from "./AgentAnalytic";

export interface User {
  name: string;
  email: string;
  biography: string;
  id: number;
  agentAnalytic: AgentAnalytic;
}
