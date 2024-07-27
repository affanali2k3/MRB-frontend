import { User } from "./User";

export interface ReferralOpenForm {
  id: number;
  timeAmount: number;
  senderAgentId: number;
  details: string;
  typeOfHouse: string;
  isBuyer: boolean;
  city: string;
  state: string;
  providence: string;
  price: number;
  createdAt: Date;
  updatedAt: Date;
  user: User;
}
