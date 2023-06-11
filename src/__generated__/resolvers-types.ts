import { GraphQLResolveInfo, GraphQLScalarType, GraphQLScalarTypeConfig } from 'graphql';
import { MyContext } from '../index';
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
export type MakeEmpty<T extends { [key: string]: unknown }, K extends keyof T> = { [_ in K]?: never };
export type Incremental<T> = T | { [P in keyof T]?: P extends ' $fragmentName' | '__typename' ? T[P] : never };
export type RequireFields<T, K extends keyof T> = Omit<T, K> & { [P in K]-?: NonNullable<T[P]> };
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
  stats?: Maybe<Array<Maybe<Stat>>>;
};


export type QueryListingArgs = {
  listingId: Scalars['Int']['input'];
};


export type QueryStatsArgs = {
  city?: InputMaybe<Scalars['String']['input']>;
  curDateUtc?: InputMaybe<Scalars['String']['input']>;
  state?: InputMaybe<Scalars['String']['input']>;
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

export type WithIndex<TObject> = TObject & Record<string, any>;
export type ResolversObject<TObject> = WithIndex<TObject>;

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


/** Mapping of interface types */
export type ResolversInterfaceTypes<RefType extends Record<string, unknown>> = ResolversObject<{
  MutationResponse: ( AddListingMutationResponse ) | ( AddStatMutationResponse );
}>;

/** Mapping between all available schema types and the resolvers types */
export type ResolversTypes = ResolversObject<{
  AddListingMutationResponse: ResolverTypeWrapper<AddListingMutationResponse>;
  AddStatMutationResponse: ResolverTypeWrapper<AddStatMutationResponse>;
  Boolean: ResolverTypeWrapper<Scalars['Boolean']['output']>;
  DateTime: ResolverTypeWrapper<Scalars['DateTime']['output']>;
  Float: ResolverTypeWrapper<Scalars['Float']['output']>;
  Int: ResolverTypeWrapper<Scalars['Int']['output']>;
  Listing: ResolverTypeWrapper<Listing>;
  ListingInput: ListingInput;
  Mutation: ResolverTypeWrapper<{}>;
  MutationResponse: ResolverTypeWrapper<ResolversInterfaceTypes<ResolversTypes>['MutationResponse']>;
  Query: ResolverTypeWrapper<{}>;
  Stat: ResolverTypeWrapper<Stat>;
  StatInput: StatInput;
  String: ResolverTypeWrapper<Scalars['String']['output']>;
}>;

/** Mapping between all available schema types and the resolvers parents */
export type ResolversParentTypes = ResolversObject<{
  AddListingMutationResponse: AddListingMutationResponse;
  AddStatMutationResponse: AddStatMutationResponse;
  Boolean: Scalars['Boolean']['output'];
  DateTime: Scalars['DateTime']['output'];
  Float: Scalars['Float']['output'];
  Int: Scalars['Int']['output'];
  Listing: Listing;
  ListingInput: ListingInput;
  Mutation: {};
  MutationResponse: ResolversInterfaceTypes<ResolversParentTypes>['MutationResponse'];
  Query: {};
  Stat: Stat;
  StatInput: StatInput;
  String: Scalars['String']['output'];
}>;

export type AddListingMutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['AddListingMutationResponse'] = ResolversParentTypes['AddListingMutationResponse']> = ResolversObject<{
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  listing?: Resolver<Maybe<ResolversTypes['Listing']>, ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export type AddStatMutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['AddStatMutationResponse'] = ResolversParentTypes['AddStatMutationResponse']> = ResolversObject<{
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  stat?: Resolver<Maybe<ResolversTypes['Stat']>, ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export interface DateTimeScalarConfig extends GraphQLScalarTypeConfig<ResolversTypes['DateTime'], any> {
  name: 'DateTime';
}

export type ListingResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['Listing'] = ResolversParentTypes['Listing']> = ResolversObject<{
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
}>;

export type MutationResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['Mutation'] = ResolversParentTypes['Mutation']> = ResolversObject<{
  addListing?: Resolver<Maybe<ResolversTypes['AddListingMutationResponse']>, ParentType, ContextType, RequireFields<MutationAddListingArgs, 'listing'>>;
  addStat?: Resolver<Maybe<ResolversTypes['AddStatMutationResponse']>, ParentType, ContextType, RequireFields<MutationAddStatArgs, 'stat'>>;
}>;

export type MutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['MutationResponse'] = ResolversParentTypes['MutationResponse']> = ResolversObject<{
  __resolveType: TypeResolveFn<'AddListingMutationResponse' | 'AddStatMutationResponse', ParentType, ContextType>;
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
}>;

export type QueryResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['Query'] = ResolversParentTypes['Query']> = ResolversObject<{
  listing?: Resolver<Maybe<ResolversTypes['Listing']>, ParentType, ContextType, RequireFields<QueryListingArgs, 'listingId'>>;
  stats?: Resolver<Maybe<Array<Maybe<ResolversTypes['Stat']>>>, ParentType, ContextType, Partial<QueryStatsArgs>>;
}>;

export type StatResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['Stat'] = ResolversParentTypes['Stat']> = ResolversObject<{
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
}>;

export type Resolvers<ContextType = MyContext> = ResolversObject<{
  AddListingMutationResponse?: AddListingMutationResponseResolvers<ContextType>;
  AddStatMutationResponse?: AddStatMutationResponseResolvers<ContextType>;
  DateTime?: GraphQLScalarType;
  Listing?: ListingResolvers<ContextType>;
  Mutation?: MutationResolvers<ContextType>;
  MutationResponse?: MutationResponseResolvers<ContextType>;
  Query?: QueryResolvers<ContextType>;
  Stat?: StatResolvers<ContextType>;
}>;

