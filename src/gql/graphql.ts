/* eslint-disable */
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: { input: string | number; output: string; }
  String: { input: string; output: string; }
  Boolean: { input: boolean; output: boolean; }
  Int: { input: number; output: number; }
  Float: { input: number; output: number; }
  DateTime: { input: any; output: any; }
};

export type AddListingMutationResponse = MutationResponse & {
  __typename?: 'AddListingMutationResponse';
  code: Scalars['String']['output'];
  listing?: Maybe<Listing>;
  message: Scalars['String']['output'];
  success: Scalars['Boolean']['output'];
};

export type AddStatMutationResponse = MutationResponse & {
  __typename?: 'AddStatMutationResponse';
  code: Scalars['String']['output'];
  message: Scalars['String']['output'];
  stat?: Maybe<Stat>;
  success: Scalars['Boolean']['output'];
};

export type Listing = {
  __typename?: 'Listing';
  baths?: Maybe<Scalars['Float']['output']>;
  beds?: Maybe<Scalars['Float']['output']>;
  city: Scalars['String']['output'];
  fullBaths?: Maybe<Scalars['Float']['output']>;
  hoa?: Maybe<Scalars['Int']['output']>;
  latitude?: Maybe<Scalars['Float']['output']>;
  listingId: Scalars['Int']['output'];
  location?: Maybe<Scalars['String']['output']>;
  longitude?: Maybe<Scalars['Float']['output']>;
  lotSize?: Maybe<Scalars['Int']['output']>;
  mlsId: Scalars['String']['output'];
  mlsStatus?: Maybe<Scalars['String']['output']>;
  partialBaths?: Maybe<Scalars['Float']['output']>;
  price?: Maybe<Scalars['Int']['output']>;
  pricePerSqFt?: Maybe<Scalars['Int']['output']>;
  propertyId: Scalars['Int']['output'];
  propertyType?: Maybe<Scalars['Int']['output']>;
  soldDate?: Maybe<Scalars['Int']['output']>;
  sqft?: Maybe<Scalars['Int']['output']>;
  state: Scalars['String']['output'];
  stories?: Maybe<Scalars['Float']['output']>;
  streetLine: Scalars['String']['output'];
  timeZone?: Maybe<Scalars['String']['output']>;
  url: Scalars['String']['output'];
  yearBuilt?: Maybe<Scalars['Int']['output']>;
  zip: Scalars['String']['output'];
};

export type ListingInput = {
  baths?: InputMaybe<Scalars['Float']['input']>;
  beds?: InputMaybe<Scalars['Float']['input']>;
  city: Scalars['String']['input'];
  fullBaths?: InputMaybe<Scalars['Float']['input']>;
  hoa?: InputMaybe<Scalars['Int']['input']>;
  latitude?: InputMaybe<Scalars['Float']['input']>;
  listingId: Scalars['Int']['input'];
  location?: InputMaybe<Scalars['String']['input']>;
  longitude?: InputMaybe<Scalars['Float']['input']>;
  lotSize?: InputMaybe<Scalars['Int']['input']>;
  mlsId: Scalars['String']['input'];
  mlsStatus?: InputMaybe<Scalars['String']['input']>;
  partialBaths?: InputMaybe<Scalars['Float']['input']>;
  price?: InputMaybe<Scalars['Int']['input']>;
  pricePerSqFt?: InputMaybe<Scalars['Int']['input']>;
  propertyId: Scalars['Int']['input'];
  propertyType?: InputMaybe<Scalars['Int']['input']>;
  soldDate?: InputMaybe<Scalars['Int']['input']>;
  sqft?: InputMaybe<Scalars['Int']['input']>;
  state: Scalars['String']['input'];
  stories?: InputMaybe<Scalars['Float']['input']>;
  streetLine: Scalars['String']['input'];
  timeZone?: InputMaybe<Scalars['String']['input']>;
  url: Scalars['String']['input'];
  yearBuilt?: InputMaybe<Scalars['Int']['input']>;
  zip: Scalars['String']['input'];
};

export type Mutation = {
  __typename?: 'Mutation';
  addListing?: Maybe<AddListingMutationResponse>;
  addStat?: Maybe<AddStatMutationResponse>;
};


export type MutationAddListingArgs = {
  listing: ListingInput;
};


export type MutationAddStatArgs = {
  stat: StatInput;
};

export type MutationResponse = {
  code: Scalars['String']['output'];
  message: Scalars['String']['output'];
  success: Scalars['Boolean']['output'];
};

export type Query = {
  __typename?: 'Query';
  listing?: Maybe<Listing>;
  stat?: Maybe<Stat>;
};

export type Stat = {
  __typename?: 'Stat';
  averageBaths?: Maybe<Scalars['Float']['output']>;
  averageBeds?: Maybe<Scalars['Float']['output']>;
  averageHoa?: Maybe<Scalars['Float']['output']>;
  averageLotSize?: Maybe<Scalars['Float']['output']>;
  averagePrice?: Maybe<Scalars['Float']['output']>;
  averagePricePerSqFt?: Maybe<Scalars['Float']['output']>;
  averageSqFt?: Maybe<Scalars['Float']['output']>;
  averageYearBuilt?: Maybe<Scalars['Float']['output']>;
  baths?: Maybe<Scalars['Float']['output']>;
  beds?: Maybe<Scalars['Float']['output']>;
  city?: Maybe<Scalars['String']['output']>;
  curDateUtc?: Maybe<Scalars['String']['output']>;
  medianBaths?: Maybe<Scalars['Float']['output']>;
  medianBeds?: Maybe<Scalars['Float']['output']>;
  medianHoa?: Maybe<Scalars['Float']['output']>;
  medianLotSize?: Maybe<Scalars['Float']['output']>;
  /** Fields that you can retrieve from a stat object. */
  medianPrice?: Maybe<Scalars['Float']['output']>;
  medianPricePerSqFt?: Maybe<Scalars['Float']['output']>;
  medianSqFt?: Maybe<Scalars['Float']['output']>;
  medianYearBuilt?: Maybe<Scalars['Float']['output']>;
  modeBaths?: Maybe<Scalars['Int']['output']>;
  modeBeds?: Maybe<Scalars['Int']['output']>;
  modeHoa?: Maybe<Scalars['Int']['output']>;
  modeLotSize?: Maybe<Scalars['Int']['output']>;
  modePrice?: Maybe<Scalars['Int']['output']>;
  modePricePerSqFt?: Maybe<Scalars['Int']['output']>;
  modeSqFt?: Maybe<Scalars['Int']['output']>;
  modeYearBuilt?: Maybe<Scalars['Int']['output']>;
  state?: Maybe<Scalars['String']['output']>;
  zip?: Maybe<Scalars['String']['output']>;
};

export type StatInput = {
  averageBaths?: InputMaybe<Scalars['Float']['input']>;
  averageBeds?: InputMaybe<Scalars['Float']['input']>;
  averageHoa?: InputMaybe<Scalars['Float']['input']>;
  averageLotSize?: InputMaybe<Scalars['Float']['input']>;
  averagePrice?: InputMaybe<Scalars['Float']['input']>;
  averagePricePerSqFt?: InputMaybe<Scalars['Float']['input']>;
  averageSqFt?: InputMaybe<Scalars['Float']['input']>;
  averageYearBuilt?: InputMaybe<Scalars['Float']['input']>;
  baths?: InputMaybe<Scalars['Float']['input']>;
  beds?: InputMaybe<Scalars['Float']['input']>;
  city?: InputMaybe<Scalars['String']['input']>;
  curDateUtc?: InputMaybe<Scalars['String']['input']>;
  medianBaths?: InputMaybe<Scalars['Float']['input']>;
  medianBeds?: InputMaybe<Scalars['Float']['input']>;
  medianHoa?: InputMaybe<Scalars['Float']['input']>;
  medianLotSize?: InputMaybe<Scalars['Float']['input']>;
  /** Fields responsible for creating a new stat object. */
  medianPrice?: InputMaybe<Scalars['Float']['input']>;
  medianPricePerSqFt?: InputMaybe<Scalars['Float']['input']>;
  medianSqFt?: InputMaybe<Scalars['Float']['input']>;
  medianYearBuilt?: InputMaybe<Scalars['Float']['input']>;
  modeBaths?: InputMaybe<Scalars['Int']['input']>;
  modeBeds?: InputMaybe<Scalars['Int']['input']>;
  modeHoa?: InputMaybe<Scalars['Int']['input']>;
  modeLotSize?: InputMaybe<Scalars['Int']['input']>;
  modePrice?: InputMaybe<Scalars['Int']['input']>;
  modePricePerSqFt?: InputMaybe<Scalars['Int']['input']>;
  modeSqFt?: InputMaybe<Scalars['Int']['input']>;
  modeYearBuilt?: InputMaybe<Scalars['Int']['input']>;
  state?: InputMaybe<Scalars['String']['input']>;
  zip?: InputMaybe<Scalars['String']['input']>;
};
