import { User } from "./User";

export interface ReferralDirectForm {
  id: number;
  timeAmount: number;
  senderAgentId: number;
  receiverAgentId: number;
  details: string;
  typeOfHouse: string;
  isBuyer: boolean;
  city: string;
  state: string;
  providence: string;
  price: number;
  createdAt: Date;
  updatedAt: Date;
  senderAgent: User;
}
