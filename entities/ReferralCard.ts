import { User } from "./User";

export interface ReferralCard {
  id: number;
  timeAmount: number;
  senderAgent: number;
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
