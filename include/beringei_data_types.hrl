-ifndef(_beringei_data_types_included).
-define(_beringei_data_types_included, yeah).

-define(BERINGEI_DATA_COMPRESSION_NONE, 0).
-define(BERINGEI_DATA_COMPRESSION_ZLIB, 1).

-define(BERINGEI_DATA_STATUSCODE_OK, 0).
-define(BERINGEI_DATA_STATUSCODE_DONT_OWN_SHARD, 1).
-define(BERINGEI_DATA_STATUSCODE_KEY_MISSING, 2).
-define(BERINGEI_DATA_STATUSCODE_RPC_FAIL, 3).
-define(BERINGEI_DATA_STATUSCODE_SHARD_IN_PROGRESS, 4).
-define(BERINGEI_DATA_STATUSCODE_BUCKET_NOT_FINALIZED, 5).
-define(BERINGEI_DATA_STATUSCODE_ZIPPY_STORAGE_FAIL, 6).
-define(BERINGEI_DATA_STATUSCODE_MISSING_TOO_MUCH_DATA, 7).

%% struct 'Key'

-record('Key', {'key' :: string() | binary(),
                'shardId' :: integer()}).
-type 'Key'() :: #'Key'{}.

%% struct 'TimeSeriesBlock'

-record('TimeSeriesBlock', {'compression' :: integer(),
                            'count' :: integer(),
                            'data' :: string() | binary()}).
-type 'TimeSeriesBlock'() :: #'TimeSeriesBlock'{}.

%% struct 'TimeSeriesData'

-record('TimeSeriesData', {'data' :: list(),
                           'status' = 0 :: integer()}).
-type 'TimeSeriesData'() :: #'TimeSeriesData'{}.

%% struct 'GetDataRequest'

-record('GetDataRequest', {'keys' :: list(),
                           'begin' :: integer(),
                           'end' :: integer()}).
-type 'GetDataRequest'() :: #'GetDataRequest'{}.

%% struct 'GetDataResult'

-record('GetDataResult', {'results' :: list()}).
-type 'GetDataResult'() :: #'GetDataResult'{}.

%% struct 'TimeValuePair'

-record('TimeValuePair', {'unixTime' :: integer(),
                          'value' :: float()}).
-type 'TimeValuePair'() :: #'TimeValuePair'{}.

%% struct 'DataPoint'

-record('DataPoint', {'key' :: 'Key'(),
                      'value' :: 'TimeValuePair'(),
                      'categoryId' :: integer()}).
-type 'DataPoint'() :: #'DataPoint'{}.

%% struct 'PutDataRequest'

-record('PutDataRequest', {'data' :: list()}).
-type 'PutDataRequest'() :: #'PutDataRequest'{}.

%% struct 'PutDataResult'

-record('PutDataResult', {'data' :: list()}).
-type 'PutDataResult'() :: #'PutDataResult'{}.

%% struct 'GetShardDataBucketResult'

-record('GetShardDataBucketResult', {'status' :: integer(),
                                     'keys' :: list(),
                                     'data' :: list(),
                                     'recentRead' :: list(),
                                     'moreEntries' :: boolean()}).
-type 'GetShardDataBucketResult'() :: #'GetShardDataBucketResult'{}.

%% struct 'ShardInfo'

-record('ShardInfo', {'shardId' :: integer(),
                      'hostAddress' :: string() | binary(),
                      'port' :: integer()}).
-type 'ShardInfo'() :: #'ShardInfo'{}.

%% struct 'ServiceMap'

-record('ServiceMap', {'serviceName' :: string() | binary(),
                       'location' :: string() | binary(),
                       'isLoggingNewKeysEnabled' :: boolean(),
                       'shardMap' :: list()}).
-type 'ServiceMap'() :: #'ServiceMap'{}.

%% struct 'ConfigurationInfo'

-record('ConfigurationInfo', {'shardCount' :: integer(),
                              'serviceMap' :: list()}).
-type 'ConfigurationInfo'() :: #'ConfigurationInfo'{}.

%% struct 'GetLastUpdateTimesRequest'

-record('GetLastUpdateTimesRequest', {'shardId' :: integer(),
                                      'minLastUpdateTime' :: integer(),
                                      'offset' :: integer(),
                                      'limit' :: integer()}).
-type 'GetLastUpdateTimesRequest'() :: #'GetLastUpdateTimesRequest'{}.

%% struct 'KeyUpdateTime'

-record('KeyUpdateTime', {'key' :: string() | binary(),
                          'categoryId' :: integer(),
                          'updateTime' :: integer(),
                          'queriedRecently' :: boolean()}).
-type 'KeyUpdateTime'() :: #'KeyUpdateTime'{}.

%% struct 'GetLastUpdateTimesResult'

-record('GetLastUpdateTimesResult', {'keys' :: list(),
                                     'moreResults' :: boolean()}).
-type 'GetLastUpdateTimesResult'() :: #'GetLastUpdateTimesResult'{}.

-endif.
