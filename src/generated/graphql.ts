import { GraphQLResolveInfo } from 'graphql';
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type RequireFields<T, K extends keyof T> = Omit<T, K> & { [P in K]-?: NonNullable<T[P]> };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
};

export type AddListingMutationResponse = MutationResponse & {
  __typename?: 'AddListingMutationResponse';
  code: Scalars['String'];
  listing?: Maybe<Listing>;
  message: Scalars['String'];
  success: Scalars['Boolean'];
};

export type AddStatMutationResponse = MutationResponse & {
  __typename?: 'AddStatMutationResponse';
  code: Scalars['String'];
  message: Scalars['String'];
  stat?: Maybe<Stat>;
  success: Scalars['Boolean'];
};

export type Listing = {
  __typename?: 'Listing';
  baths?: Maybe<Scalars['Float']>;
  beds?: Maybe<Scalars['Float']>;
  city: Scalars['String'];
  fullBaths?: Maybe<Scalars['Float']>;
  hoa?: Maybe<Scalars['Int']>;
  latitude?: Maybe<Scalars['Float']>;
  listingId: Scalars['Int'];
  location?: Maybe<Scalars['String']>;
  longitude?: Maybe<Scalars['Float']>;
  lotSize?: Maybe<Scalars['Int']>;
  mlsId: Scalars['String'];
  mlsStatus?: Maybe<Scalars['String']>;
  partialBaths?: Maybe<Scalars['Float']>;
  price?: Maybe<Scalars['Int']>;
  pricePerSqFt?: Maybe<Scalars['Int']>;
  propertyId: Scalars['Int'];
  propertyType?: Maybe<Scalars['Int']>;
  soldDate?: Maybe<Scalars['Int']>;
  sqft?: Maybe<Scalars['Int']>;
  state: Scalars['String'];
  stories?: Maybe<Scalars['Float']>;
  streetLine: Scalars['String'];
  timeZone?: Maybe<Scalars['String']>;
  url: Scalars['String'];
  yearBuilt?: Maybe<Scalars['Int']>;
  zip: Scalars['String'];
};

export type ListingInput = {
  baths?: InputMaybe<Scalars['Float']>;
  beds?: InputMaybe<Scalars['Float']>;
  city: Scalars['String'];
  fullBaths?: InputMaybe<Scalars['Float']>;
  hoa?: InputMaybe<Scalars['Int']>;
  latitude?: InputMaybe<Scalars['Float']>;
  listingId: Scalars['Int'];
  location?: InputMaybe<Scalars['String']>;
  longitude?: InputMaybe<Scalars['Float']>;
  lotSize?: InputMaybe<Scalars['Int']>;
  mlsId: Scalars['String'];
  mlsStatus?: InputMaybe<Scalars['String']>;
  partialBaths?: InputMaybe<Scalars['Float']>;
  price?: InputMaybe<Scalars['Int']>;
  pricePerSqFt?: InputMaybe<Scalars['Int']>;
  propertyId: Scalars['Int'];
  propertyType?: InputMaybe<Scalars['Int']>;
  soldDate?: InputMaybe<Scalars['Int']>;
  sqft?: InputMaybe<Scalars['Int']>;
  state: Scalars['String'];
  stories?: InputMaybe<Scalars['Float']>;
  streetLine: Scalars['String'];
  timeZone?: InputMaybe<Scalars['String']>;
  url: Scalars['String'];
  yearBuilt?: InputMaybe<Scalars['Int']>;
  zip: Scalars['String'];
};

export type Mutation = {
  __typename?: 'Mutation';
  addListing: Listing;
  addListings: Array<Listing>;
  addStat: Stat;
  addStats: Array<Stat>;
};


export type MutationAddListingArgs = {
  listing: ListingInput;
};


export type MutationAddListingsArgs = {
  listings: Array<ListingInput>;
};


export type MutationAddStatArgs = {
  stat: StatInput;
};


export type MutationAddStatsArgs = {
  stats: Array<StatInput>;
};

export type MutationResponse = {
  code: Scalars['String'];
  message: Scalars['String'];
  success: Scalars['Boolean'];
};

export type Query = {
  __typename?: 'Query';
  listings?: Maybe<Array<Maybe<Listing>>>;
  stats?: Maybe<Array<Maybe<Stat>>>;
};

export type Stat = {
  __typename?: 'Stat';
  averageBaths?: Maybe<Scalars['Float']>;
  averageBeds?: Maybe<Scalars['Float']>;
  averageHoa?: Maybe<Scalars['Float']>;
  averageLotSize?: Maybe<Scalars['Float']>;
  averagePrice?: Maybe<Scalars['Float']>;
  averagePricePerSqFt?: Maybe<Scalars['Float']>;
  averageSqFt?: Maybe<Scalars['Float']>;
  averageYearBuilt?: Maybe<Scalars['Float']>;
  baths?: Maybe<Scalars['Float']>;
  beds?: Maybe<Scalars['Float']>;
  city?: Maybe<Scalars['String']>;
  curDateUtc?: Maybe<Scalars['String']>;
  medianBaths?: Maybe<Scalars['Float']>;
  medianBeds?: Maybe<Scalars['Float']>;
  medianHoa?: Maybe<Scalars['Float']>;
  medianLotSize?: Maybe<Scalars['Float']>;
  /** Fields that you can retrieve from a stat object. */
  medianPrice?: Maybe<Scalars['Float']>;
  medianPricePerSqFt?: Maybe<Scalars['Float']>;
  medianSqFt?: Maybe<Scalars['Float']>;
  medianYearBuilt?: Maybe<Scalars['Float']>;
  modeBaths?: Maybe<Scalars['Int']>;
  modeBeds?: Maybe<Scalars['Int']>;
  modeHoa?: Maybe<Scalars['Int']>;
  modeLotSize?: Maybe<Scalars['Int']>;
  modePrice?: Maybe<Scalars['Int']>;
  modePricePerSqFt?: Maybe<Scalars['Int']>;
  modeSqFt?: Maybe<Scalars['Int']>;
  modeYearBuilt?: Maybe<Scalars['Int']>;
  state?: Maybe<Scalars['String']>;
  zip?: Maybe<Scalars['String']>;
};

export type StatInput = {
  averageBaths?: InputMaybe<Scalars['Float']>;
  averageBeds?: InputMaybe<Scalars['Float']>;
  averageHoa?: InputMaybe<Scalars['Float']>;
  averageLotSize?: InputMaybe<Scalars['Float']>;
  averagePrice?: InputMaybe<Scalars['Float']>;
  averagePricePerSqFt?: InputMaybe<Scalars['Float']>;
  averageSqFt?: InputMaybe<Scalars['Float']>;
  averageYearBuilt?: InputMaybe<Scalars['Float']>;
  baths?: InputMaybe<Scalars['Float']>;
  beds?: InputMaybe<Scalars['Float']>;
  city?: InputMaybe<Scalars['String']>;
  curDateUtc?: InputMaybe<Scalars['String']>;
  medianBaths?: InputMaybe<Scalars['Float']>;
  medianBeds?: InputMaybe<Scalars['Float']>;
  medianHoa?: InputMaybe<Scalars['Float']>;
  medianLotSize?: InputMaybe<Scalars['Float']>;
  /** Fields responsible for creating a new stat object. */
  medianPrice?: InputMaybe<Scalars['Float']>;
  medianPricePerSqFt?: InputMaybe<Scalars['Float']>;
  medianSqFt?: InputMaybe<Scalars['Float']>;
  medianYearBuilt?: InputMaybe<Scalars['Float']>;
  modeBaths?: InputMaybe<Scalars['Int']>;
  modeBeds?: InputMaybe<Scalars['Int']>;
  modeHoa?: InputMaybe<Scalars['Int']>;
  modeLotSize?: InputMaybe<Scalars['Int']>;
  modePrice?: InputMaybe<Scalars['Int']>;
  modePricePerSqFt?: InputMaybe<Scalars['Int']>;
  modeSqFt?: InputMaybe<Scalars['Int']>;
  modeYearBuilt?: InputMaybe<Scalars['Int']>;
  state?: InputMaybe<Scalars['String']>;
  zip?: InputMaybe<Scalars['String']>;
};



export type ResolverTypeWrapper<T> = Promise<T> | T;


export type ResolverWithResolve<TResult, TParent, TContext, TArgs> = {
  resolve: ResolverFn<TResult, TParent, TContext, TArgs>;
};
export type Resolver<TResult, TParent = {}, TContext = {}, TArgs = {}> = ResolverFn<TResult, TParent, TContext, TArgs> | ResolverWithResolve<TResult, TParent, TContext, TArgs>;

export type ResolverFn<TResult, TParent, TContext, TArgs> = (
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => Promise<TResult> | TResult;

export type SubscriptionSubscribeFn<TResult, TParent, TContext, TArgs> = (
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => AsyncIterable<TResult> | Promise<AsyncIterable<TResult>>;

export type SubscriptionResolveFn<TResult, TParent, TContext, TArgs> = (
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => TResult | Promise<TResult>;

export interface SubscriptionSubscriberObject<TResult, TKey extends string, TParent, TContext, TArgs> {
  subscribe: SubscriptionSubscribeFn<{ [key in TKey]: TResult }, TParent, TContext, TArgs>;
  resolve?: SubscriptionResolveFn<TResult, { [key in TKey]: TResult }, TContext, TArgs>;
}

export interface SubscriptionResolverObject<TResult, TParent, TContext, TArgs> {
  subscribe: SubscriptionSubscribeFn<any, TParent, TContext, TArgs>;
  resolve: SubscriptionResolveFn<TResult, any, TContext, TArgs>;
}

export type SubscriptionObject<TResult, TKey extends string, TParent, TContext, TArgs> =
  | SubscriptionSubscriberObject<TResult, TKey, TParent, TContext, TArgs>
  | SubscriptionResolverObject<TResult, TParent, TContext, TArgs>;

export type SubscriptionResolver<TResult, TKey extends string, TParent = {}, TContext = {}, TArgs = {}> =
  | ((...args: any[]) => SubscriptionObject<TResult, TKey, TParent, TContext, TArgs>)
  | SubscriptionObject<TResult, TKey, TParent, TContext, TArgs>;

export type TypeResolveFn<TTypes, TParent = {}, TContext = {}> = (
  parent: TParent,
  context: TContext,
  info: GraphQLResolveInfo
) => Maybe<TTypes> | Promise<Maybe<TTypes>>;

export type IsTypeOfResolverFn<T = {}, TContext = {}> = (obj: T, context: TContext, info: GraphQLResolveInfo) => boolean | Promise<boolean>;

export type NextResolverFn<T> = () => Promise<T>;

export type DirectiveResolverFn<TResult = {}, TParent = {}, TContext = {}, TArgs = {}> = (
  next: NextResolverFn<TResult>,
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => TResult | Promise<TResult>;



/** Mapping between all available schema types and the resolvers types */
export type ResolversTypes = {
  AddListingMutationResponse: ResolverTypeWrapper<AddListingMutationResponse>;
  AddStatMutationResponse: ResolverTypeWrapper<AddStatMutationResponse>;
  Boolean: ResolverTypeWrapper<Scalars['Boolean']>;
  Float: ResolverTypeWrapper<Scalars['Float']>;
  Int: ResolverTypeWrapper<Scalars['Int']>;
  Listing: ResolverTypeWrapper<Listing>;
  ListingInput: ListingInput;
  Mutation: ResolverTypeWrapper<{}>;
  MutationResponse: ResolversTypes['AddListingMutationResponse'] | ResolversTypes['AddStatMutationResponse'];
  Query: ResolverTypeWrapper<{}>;
  Stat: ResolverTypeWrapper<Stat>;
  StatInput: StatInput;
  String: ResolverTypeWrapper<Scalars['String']>;
};

/** Mapping between all available schema types and the resolvers parents */
export type ResolversParentTypes = {
  AddListingMutationResponse: AddListingMutationResponse;
  AddStatMutationResponse: AddStatMutationResponse;
  Boolean: Scalars['Boolean'];
  Float: Scalars['Float'];
  Int: Scalars['Int'];
  Listing: Listing;
  ListingInput: ListingInput;
  Mutation: {};
  MutationResponse: ResolversParentTypes['AddListingMutationResponse'] | ResolversParentTypes['AddStatMutationResponse'];
  Query: {};
  Stat: Stat;
  StatInput: StatInput;
  String: Scalars['String'];
};

export type AddListingMutationResponseResolvers<ContextType = any, ParentType extends ResolversParentTypes['AddListingMutationResponse'] = ResolversParentTypes['AddListingMutationResponse']> = {
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  listing?: Resolver<Maybe<ResolversTypes['Listing']>, ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
};

export type AddStatMutationResponseResolvers<ContextType = any, ParentType extends ResolversParentTypes['AddStatMutationResponse'] = ResolversParentTypes['AddStatMutationResponse']> = {
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  stat?: Resolver<Maybe<ResolversTypes['Stat']>, ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
};

export type ListingResolvers<ContextType = any, ParentType extends ResolversParentTypes['Listing'] = ResolversParentTypes['Listing']> = {
  baths?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  beds?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  city?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  fullBaths?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  hoa?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  latitude?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  listingId?: Resolver<ResolversTypes['Int'], ParentType, ContextType>;
  location?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  longitude?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  lotSize?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  mlsId?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  mlsStatus?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  partialBaths?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  price?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  pricePerSqFt?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  propertyId?: Resolver<ResolversTypes['Int'], ParentType, ContextType>;
  propertyType?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  soldDate?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  sqft?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  state?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  stories?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  streetLine?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  timeZone?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  url?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  yearBuilt?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  zip?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
};

export type MutationResolvers<ContextType = any, ParentType extends ResolversParentTypes['Mutation'] = ResolversParentTypes['Mutation']> = {
  addListing?: Resolver<ResolversTypes['Listing'], ParentType, ContextType, RequireFields<MutationAddListingArgs, 'listing'>>;
  addListings?: Resolver<Array<ResolversTypes['Listing']>, ParentType, ContextType, RequireFields<MutationAddListingsArgs, 'listings'>>;
  addStat?: Resolver<ResolversTypes['Stat'], ParentType, ContextType, RequireFields<MutationAddStatArgs, 'stat'>>;
  addStats?: Resolver<Array<ResolversTypes['Stat']>, ParentType, ContextType, RequireFields<MutationAddStatsArgs, 'stats'>>;
};

export type MutationResponseResolvers<ContextType = any, ParentType extends ResolversParentTypes['MutationResponse'] = ResolversParentTypes['MutationResponse']> = {
  __resolveType: TypeResolveFn<'AddListingMutationResponse' | 'AddStatMutationResponse', ParentType, ContextType>;
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
};

export type QueryResolvers<ContextType = any, ParentType extends ResolversParentTypes['Query'] = ResolversParentTypes['Query']> = {
  listings?: Resolver<Maybe<Array<Maybe<ResolversTypes['Listing']>>>, ParentType, ContextType>;
  stats?: Resolver<Maybe<Array<Maybe<ResolversTypes['Stat']>>>, ParentType, ContextType>;
};

export type StatResolvers<ContextType = any, ParentType extends ResolversParentTypes['Stat'] = ResolversParentTypes['Stat']> = {
  averageBaths?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  averageBeds?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  averageHoa?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  averageLotSize?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  averagePrice?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  averagePricePerSqFt?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  averageSqFt?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  averageYearBuilt?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  baths?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  beds?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  city?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  curDateUtc?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  medianBaths?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  medianBeds?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  medianHoa?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  medianLotSize?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  medianPrice?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  medianPricePerSqFt?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  medianSqFt?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  medianYearBuilt?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  modeBaths?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  modeBeds?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  modeHoa?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  modeLotSize?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  modePrice?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  modePricePerSqFt?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  modeSqFt?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  modeYearBuilt?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  state?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  zip?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
};

export type Resolvers<ContextType = any> = {
  AddListingMutationResponse?: AddListingMutationResponseResolvers<ContextType>;
  AddStatMutationResponse?: AddStatMutationResponseResolvers<ContextType>;
  Listing?: ListingResolvers<ContextType>;
  Mutation?: MutationResolvers<ContextType>;
  MutationResponse?: MutationResponseResolvers<ContextType>;
  Query?: QueryResolvers<ContextType>;
  Stat?: StatResolvers<ContextType>;
};

