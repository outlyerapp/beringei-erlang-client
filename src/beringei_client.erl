-module(beringei_client).

-include("beringei_data_types.hrl").

-export([connect/2, put_data_points/2, close/1]).

-record(tclient, {service, protocol, seqid}).

-type tclient() :: #tclient{}.

connect(Host, Port) ->
    {ok, Client} = thrift_client_util:new(Host, Port, beringei_service_thrift, []),
    Client.

put_data_points(Client, DataPoints) ->
    {Client1, {ok, Response}} = thrift_client:call(Client, [DataPoints]),
    {Client1, Response}.

-spec close(tclient()) -> ok.
close(Client) ->
    thrift_client:close(Client).
