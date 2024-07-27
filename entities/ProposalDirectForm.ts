import { AgentAnalytic } from "./AgentAnalytic";
import { ReferralDirectForm } from "./ReferralDirectForm";
import { User } from "./User";

export interface ProposalDirectForm {
  id: number;
  receiverAgentId: number;
  senderAgentFormId: number;
  proposal: string;
  status: string;
  referralForm: ReferralDirectForm;
}
