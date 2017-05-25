-module(beringei_client).

-include("beringei_data_types.hrl").

-export([connect/2, put_data_points/2, close/1]).

-record(tclient, {service, protocol, seqid}).

-type tclient() :: #tclient{}.

connect(Host, Port) ->
    Service = beringei_service_thrift,
    {ok, Client} = thrift_client_util:new(Host, Port, Service, []),
    Client.

put_data_points(Client, Request) ->
    Fn = putDataPoints,
    {Client1, {ok, Response}} = thrift_client:call(Client, Fn, [Request]),
    {Client1, Response}.

-spec close(tclient()) -> ok.
close(Client) ->
    thrift_client:close(Client).
