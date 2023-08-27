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

export type AddExpenseMutationResponse = MutationResponse & {
  __typename?: 'AddExpenseMutationResponse';
  code: Scalars['String']['output'];
  expense: Expense;
  message: Scalars['String']['output'];
  success: Scalars['Boolean']['output'];
};

export type AddListingMutationResponse = MutationResponse & {
  __typename?: 'AddListingMutationResponse';
  code: Scalars['String']['output'];
  listing: Listing;
  message: Scalars['String']['output'];
  success: Scalars['Boolean']['output'];
};

export type AddSearchMutationResponse = MutationResponse & {
  __typename?: 'AddSearchMutationResponse';
  code: Scalars['String']['output'];
  message: Scalars['String']['output'];
  search: Search;
  success: Scalars['Boolean']['output'];
};

export type AddStatMutationResponse = MutationResponse & {
  __typename?: 'AddStatMutationResponse';
  code: Scalars['String']['output'];
  message: Scalars['String']['output'];
  stat: Stat;
  success: Scalars['Boolean']['output'];
};

export type AddUserMutationResponse = MutationResponse & {
  __typename?: 'AddUserMutationResponse';
  code: Scalars['String']['output'];
  message: Scalars['String']['output'];
  success: Scalars['Boolean']['output'];
  user: User;
};

export type Expense = {
  __typename?: 'Expense';
  capex?: Maybe<Scalars['Float']['output']>;
  electric?: Maybe<Scalars['Float']['output']>;
  garbage?: Maybe<Scalars['Float']['output']>;
  gas?: Maybe<Scalars['Float']['output']>;
  hoa?: Maybe<Scalars['Float']['output']>;
  id?: Maybe<Scalars['Int']['output']>;
  insurance?: Maybe<Scalars['Float']['output']>;
  lot?: Maybe<Scalars['Float']['output']>;
  management?: Maybe<Scalars['Float']['output']>;
  mortgage?: Maybe<Scalars['Float']['output']>;
  repairs?: Maybe<Scalars['Float']['output']>;
  sewer?: Maybe<Scalars['Float']['output']>;
  taxes?: Maybe<Scalars['Float']['output']>;
  vacancy?: Maybe<Scalars['Float']['output']>;
  water?: Maybe<Scalars['Float']['output']>;
};

export type ExpenseInput = {
  capex?: InputMaybe<Scalars['Float']['input']>;
  electric?: InputMaybe<Scalars['Float']['input']>;
  garbage?: InputMaybe<Scalars['Float']['input']>;
  gas?: InputMaybe<Scalars['Float']['input']>;
  hoa?: InputMaybe<Scalars['Float']['input']>;
  id?: InputMaybe<Scalars['Int']['input']>;
  insurance?: InputMaybe<Scalars['Float']['input']>;
  lot?: InputMaybe<Scalars['Float']['input']>;
  management?: InputMaybe<Scalars['Float']['input']>;
  mortgage?: InputMaybe<Scalars['Float']['input']>;
  repairs?: InputMaybe<Scalars['Float']['input']>;
  sewer?: InputMaybe<Scalars['Float']['input']>;
  taxes?: InputMaybe<Scalars['Float']['input']>;
  vacancy?: InputMaybe<Scalars['Float']['input']>;
  water?: InputMaybe<Scalars['Float']['input']>;
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
  addExpense?: Maybe<AddExpenseMutationResponse>;
  addListing?: Maybe<AddListingMutationResponse>;
  addSearch?: Maybe<AddSearchMutationResponse>;
  addStat?: Maybe<AddStatMutationResponse>;
  addUser?: Maybe<AddUserMutationResponse>;
  updateExpense?: Maybe<AddExpenseMutationResponse>;
  updateSearch?: Maybe<AddSearchMutationResponse>;
  updateUser?: Maybe<AddUserMutationResponse>;
};


export type MutationAddExpenseArgs = {
  expense: ExpenseInput;
};


export type MutationAddListingArgs = {
  listing: ListingInput;
};


export type MutationAddSearchArgs = {
  search: SearchInput;
};


export type MutationAddStatArgs = {
  stat: StatInput;
};


export type MutationAddUserArgs = {
  user: UserInput;
};


export type MutationUpdateExpenseArgs = {
  expense: ExpenseInput;
};


export type MutationUpdateSearchArgs = {
  search: SearchInput;
};


export type MutationUpdateUserArgs = {
  user: UserInput;
};

export type MutationResponse = {
  code: Scalars['String']['output'];
  message: Scalars['String']['output'];
  success: Scalars['Boolean']['output'];
};

export type Query = {
  __typename?: 'Query';
  expense?: Maybe<Expense>;
  listing?: Maybe<Listing>;
  search?: Maybe<Search>;
  searches?: Maybe<Array<Maybe<Search>>>;
  searchesByUserId?: Maybe<Array<Maybe<Search>>>;
  stats?: Maybe<Array<Maybe<Stat>>>;
  user?: Maybe<User>;
  userByName?: Maybe<User>;
};


export type QueryExpenseArgs = {
  id?: InputMaybe<Scalars['Int']['input']>;
};


export type QueryListingArgs = {
  listingId: Scalars['Int']['input'];
};


export type QuerySearchArgs = {
  id?: InputMaybe<Scalars['Int']['input']>;
};


export type QuerySearchesArgs = {
  city: Scalars['String']['input'];
  state: Scalars['String']['input'];
};


export type QuerySearchesByUserIdArgs = {
  userId: Scalars['Int']['input'];
};


export type QueryStatsArgs = {
  city?: InputMaybe<Scalars['String']['input']>;
  curDateUtc?: InputMaybe<Scalars['String']['input']>;
  state?: InputMaybe<Scalars['String']['input']>;
};


export type QueryUserArgs = {
  id?: InputMaybe<Scalars['Int']['input']>;
};


export type QueryUserByNameArgs = {
  name?: InputMaybe<Scalars['String']['input']>;
};

export type Search = {
  __typename?: 'Search';
  beds?: Maybe<Scalars['Int']['output']>;
  city?: Maybe<Scalars['String']['output']>;
  expenseFk?: Maybe<Expense>;
  id?: Maybe<Scalars['Int']['output']>;
  maxBath?: Maybe<Scalars['Float']['output']>;
  minBath?: Maybe<Scalars['Float']['output']>;
  state?: Maybe<Scalars['String']['output']>;
  user?: Maybe<Scalars['Int']['output']>;
  zip?: Maybe<Scalars['String']['output']>;
};

export type SearchInput = {
  beds?: InputMaybe<Scalars['Int']['input']>;
  city?: InputMaybe<Scalars['String']['input']>;
  expenseFk?: InputMaybe<ExpenseInput>;
  id?: InputMaybe<Scalars['Int']['input']>;
  maxBath?: InputMaybe<Scalars['Float']['input']>;
  minBath?: InputMaybe<Scalars['Float']['input']>;
  state?: InputMaybe<Scalars['String']['input']>;
  user?: InputMaybe<Scalars['Int']['input']>;
  zip?: InputMaybe<Scalars['String']['input']>;
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

export type User = {
  __typename?: 'User';
  id?: Maybe<Scalars['Int']['output']>;
  name: Scalars['String']['output'];
};

export type UserInput = {
  id?: InputMaybe<Scalars['Int']['input']>;
  name: Scalars['String']['input'];
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
  MutationResponse: ( AddExpenseMutationResponse ) | ( AddListingMutationResponse ) | ( AddSearchMutationResponse ) | ( AddStatMutationResponse ) | ( AddUserMutationResponse );
}>;

/** Mapping between all available schema types and the resolvers types */
export type ResolversTypes = ResolversObject<{
  AddExpenseMutationResponse: ResolverTypeWrapper<AddExpenseMutationResponse>;
  AddListingMutationResponse: ResolverTypeWrapper<AddListingMutationResponse>;
  AddSearchMutationResponse: ResolverTypeWrapper<AddSearchMutationResponse>;
  AddStatMutationResponse: ResolverTypeWrapper<AddStatMutationResponse>;
  AddUserMutationResponse: ResolverTypeWrapper<AddUserMutationResponse>;
  Boolean: ResolverTypeWrapper<Scalars['Boolean']['output']>;
  DateTime: ResolverTypeWrapper<Scalars['DateTime']['output']>;
  Expense: ResolverTypeWrapper<Expense>;
  ExpenseInput: ExpenseInput;
  Float: ResolverTypeWrapper<Scalars['Float']['output']>;
  Int: ResolverTypeWrapper<Scalars['Int']['output']>;
  Listing: ResolverTypeWrapper<Listing>;
  ListingInput: ListingInput;
  Mutation: ResolverTypeWrapper<{}>;
  MutationResponse: ResolverTypeWrapper<ResolversInterfaceTypes<ResolversTypes>['MutationResponse']>;
  Query: ResolverTypeWrapper<{}>;
  Search: ResolverTypeWrapper<Search>;
  SearchInput: SearchInput;
  Stat: ResolverTypeWrapper<Stat>;
  StatInput: StatInput;
  String: ResolverTypeWrapper<Scalars['String']['output']>;
  User: ResolverTypeWrapper<User>;
  UserInput: UserInput;
}>;

/** Mapping between all available schema types and the resolvers parents */
export type ResolversParentTypes = ResolversObject<{
  AddExpenseMutationResponse: AddExpenseMutationResponse;
  AddListingMutationResponse: AddListingMutationResponse;
  AddSearchMutationResponse: AddSearchMutationResponse;
  AddStatMutationResponse: AddStatMutationResponse;
  AddUserMutationResponse: AddUserMutationResponse;
  Boolean: Scalars['Boolean']['output'];
  DateTime: Scalars['DateTime']['output'];
  Expense: Expense;
  ExpenseInput: ExpenseInput;
  Float: Scalars['Float']['output'];
  Int: Scalars['Int']['output'];
  Listing: Listing;
  ListingInput: ListingInput;
  Mutation: {};
  MutationResponse: ResolversInterfaceTypes<ResolversParentTypes>['MutationResponse'];
  Query: {};
  Search: Search;
  SearchInput: SearchInput;
  Stat: Stat;
  StatInput: StatInput;
  String: Scalars['String']['output'];
  User: User;
  UserInput: UserInput;
}>;

export type AddExpenseMutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['AddExpenseMutationResponse'] = ResolversParentTypes['AddExpenseMutationResponse']> = ResolversObject<{
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  expense?: Resolver<ResolversTypes['Expense'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export type AddListingMutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['AddListingMutationResponse'] = ResolversParentTypes['AddListingMutationResponse']> = ResolversObject<{
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  listing?: Resolver<ResolversTypes['Listing'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export type AddSearchMutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['AddSearchMutationResponse'] = ResolversParentTypes['AddSearchMutationResponse']> = ResolversObject<{
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  search?: Resolver<ResolversTypes['Search'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export type AddStatMutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['AddStatMutationResponse'] = ResolversParentTypes['AddStatMutationResponse']> = ResolversObject<{
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  stat?: Resolver<ResolversTypes['Stat'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export type AddUserMutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['AddUserMutationResponse'] = ResolversParentTypes['AddUserMutationResponse']> = ResolversObject<{
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
  user?: Resolver<ResolversTypes['User'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export interface DateTimeScalarConfig extends GraphQLScalarTypeConfig<ResolversTypes['DateTime'], any> {
  name: 'DateTime';
}

export type ExpenseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['Expense'] = ResolversParentTypes['Expense']> = ResolversObject<{
  capex?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  electric?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  garbage?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  gas?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  hoa?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  id?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  insurance?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  lot?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  management?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  mortgage?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  repairs?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  sewer?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  taxes?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  vacancy?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  water?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

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
  addExpense?: Resolver<Maybe<ResolversTypes['AddExpenseMutationResponse']>, ParentType, ContextType, RequireFields<MutationAddExpenseArgs, 'expense'>>;
  addListing?: Resolver<Maybe<ResolversTypes['AddListingMutationResponse']>, ParentType, ContextType, RequireFields<MutationAddListingArgs, 'listing'>>;
  addSearch?: Resolver<Maybe<ResolversTypes['AddSearchMutationResponse']>, ParentType, ContextType, RequireFields<MutationAddSearchArgs, 'search'>>;
  addStat?: Resolver<Maybe<ResolversTypes['AddStatMutationResponse']>, ParentType, ContextType, RequireFields<MutationAddStatArgs, 'stat'>>;
  addUser?: Resolver<Maybe<ResolversTypes['AddUserMutationResponse']>, ParentType, ContextType, RequireFields<MutationAddUserArgs, 'user'>>;
  updateExpense?: Resolver<Maybe<ResolversTypes['AddExpenseMutationResponse']>, ParentType, ContextType, RequireFields<MutationUpdateExpenseArgs, 'expense'>>;
  updateSearch?: Resolver<Maybe<ResolversTypes['AddSearchMutationResponse']>, ParentType, ContextType, RequireFields<MutationUpdateSearchArgs, 'search'>>;
  updateUser?: Resolver<Maybe<ResolversTypes['AddUserMutationResponse']>, ParentType, ContextType, RequireFields<MutationUpdateUserArgs, 'user'>>;
}>;

export type MutationResponseResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['MutationResponse'] = ResolversParentTypes['MutationResponse']> = ResolversObject<{
  __resolveType: TypeResolveFn<'AddExpenseMutationResponse' | 'AddListingMutationResponse' | 'AddSearchMutationResponse' | 'AddStatMutationResponse' | 'AddUserMutationResponse', ParentType, ContextType>;
  code?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  message?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  success?: Resolver<ResolversTypes['Boolean'], ParentType, ContextType>;
}>;

export type QueryResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['Query'] = ResolversParentTypes['Query']> = ResolversObject<{
  expense?: Resolver<Maybe<ResolversTypes['Expense']>, ParentType, ContextType, Partial<QueryExpenseArgs>>;
  listing?: Resolver<Maybe<ResolversTypes['Listing']>, ParentType, ContextType, RequireFields<QueryListingArgs, 'listingId'>>;
  search?: Resolver<Maybe<ResolversTypes['Search']>, ParentType, ContextType, Partial<QuerySearchArgs>>;
  searches?: Resolver<Maybe<Array<Maybe<ResolversTypes['Search']>>>, ParentType, ContextType, RequireFields<QuerySearchesArgs, 'city' | 'state'>>;
  searchesByUserId?: Resolver<Maybe<Array<Maybe<ResolversTypes['Search']>>>, ParentType, ContextType, RequireFields<QuerySearchesByUserIdArgs, 'userId'>>;
  stats?: Resolver<Maybe<Array<Maybe<ResolversTypes['Stat']>>>, ParentType, ContextType, Partial<QueryStatsArgs>>;
  user?: Resolver<Maybe<ResolversTypes['User']>, ParentType, ContextType, Partial<QueryUserArgs>>;
  userByName?: Resolver<Maybe<ResolversTypes['User']>, ParentType, ContextType, Partial<QueryUserByNameArgs>>;
}>;

export type SearchResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['Search'] = ResolversParentTypes['Search']> = ResolversObject<{
  beds?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  city?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  expenseFk?: Resolver<Maybe<ResolversTypes['Expense']>, ParentType, ContextType>;
  id?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  maxBath?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  minBath?: Resolver<Maybe<ResolversTypes['Float']>, ParentType, ContextType>;
  state?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  user?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  zip?: Resolver<Maybe<ResolversTypes['String']>, ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
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

export type UserResolvers<ContextType = MyContext, ParentType extends ResolversParentTypes['User'] = ResolversParentTypes['User']> = ResolversObject<{
  id?: Resolver<Maybe<ResolversTypes['Int']>, ParentType, ContextType>;
  name?: Resolver<ResolversTypes['String'], ParentType, ContextType>;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
}>;

export type Resolvers<ContextType = MyContext> = ResolversObject<{
  AddExpenseMutationResponse?: AddExpenseMutationResponseResolvers<ContextType>;
  AddListingMutationResponse?: AddListingMutationResponseResolvers<ContextType>;
  AddSearchMutationResponse?: AddSearchMutationResponseResolvers<ContextType>;
  AddStatMutationResponse?: AddStatMutationResponseResolvers<ContextType>;
  AddUserMutationResponse?: AddUserMutationResponseResolvers<ContextType>;
  DateTime?: GraphQLScalarType;
  Expense?: ExpenseResolvers<ContextType>;
  Listing?: ListingResolvers<ContextType>;
  Mutation?: MutationResolvers<ContextType>;
  MutationResponse?: MutationResponseResolvers<ContextType>;
  Query?: QueryResolvers<ContextType>;
  Search?: SearchResolvers<ContextType>;
  Stat?: StatResolvers<ContextType>;
  User?: UserResolvers<ContextType>;
}>;

