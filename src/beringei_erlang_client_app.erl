-module(beringei_erlang_client_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    beringei_erlang_client_sup:start_link().

stop(_State) ->
    ok.
