Beringei Erlang Client
=================

This is an Experimental erlang client for [Beringei](git@github.com:facebookincubator/beringei.git)

Uses [French Thrift](https://github.com/guardian/french-thrift) to generate protocol from Beringei Thrift definitions.

Generate the definitions from thrift files as follows:

    thrift -I . -r --gen erl beringei.thrift
    ...

To connect to Beringei service:

    beringei_client:connect("localhost", 9999).

    {tclient,beringei_service_thrift,
        {protocol,thrift_binary_protocol,
            {binary_protocol,
                {transport,thrift_buffered_transport,
                    {buffered_transport,
                        {transport,thrift_socket_transport,
                            {data,#Port<0.21721>,infinity}},
                        []}},
                true,true}},
        0}

Data types
==========

    -record('Key', {'key' :: string() | binary(),
                    'shardId' :: integer()}).

    -record('TimeValuePair', {'unixTime' :: integer(),
                              'value' :: float()}).

    -record('DataPoint', {'key' :: 'Key'(),
                          'value' :: 'TimeValuePair'(),
                          'categoryId' :: integer()}).

    -record('PutDataRequest', {'data' :: list()}).

Shell sessions:
===============

    rd('Key', {'key', 'shardId'}).
    rd('TimeValuePair', {'unixTime', 'value'}).
    rd('PutDataRequest', {data}).
    rd('DataPoint', {'key', 'value', 'categoryId'}).

    K = #'Key'{ key = <<"base.cpu">>, shardId = 1 }.

    N = 1000.
    Epoch = 62167219200.
    UnixT = fun(Offset) -> (calendar:datetime_to_gregorian_seconds(calendar:local_time()) - Epoch) + Offset end.
    Range = [X * 1000 || X <- lists:seq(1, N)].
    Values = [random:uniform() || _ <- lists:seq(1, N)].
    Pairs = [#'TimeValuePair'{unixTime = UnixT(T), value = V} || {T, V} <- lists:zip(Range, Values)].
    CategoryId = 0.

    Points = [#'DataPoint'{key = K, value = V, categoryId = CategoryId} || V <- Pairs].
    Request = #'PutDataRequest'{data = Points}.

    Client = beringei_client:connect("localhost", 9999).
    beringei_client:put_data_points(Client, Request).

