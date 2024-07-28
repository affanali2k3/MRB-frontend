import { PostImage } from "./PostImage";
import { PostTypes } from "./PostTypes";
import { User } from "./User";

export interface Post {
  id: number;
  userId: number;
  text: string;
  name: string;
  likes: number;
  comments: number;
  type: PostTypes;
  madeReferralId: number;
  sharedLikedCommentedId: number;
  user: User;
  postImages: PostImage[];
}
