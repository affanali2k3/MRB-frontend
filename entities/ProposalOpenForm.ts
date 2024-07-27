import { AgentAnalytic } from "./AgentAnalytic";
import { ReferralOpenForm } from "./ReferralOpenForm";
import { User } from "./User";

export interface ProposalOpenForm {
  id: number;
  receiverAgentId: number;
  senderAgentFormId: number;
  proposal: string;
  status: string;
  referralForm: ReferralOpenForm;
}
