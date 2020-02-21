-module(mqtpla_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    genity_sup:children([genity_sup:worker(mqtpla_server)]).
%    SupFlags = #{
%                 id => mqtpla_server,
%                 strategy => simple_one_for_one,
%                 intensity => 0,
%                 period => 1},
%    ChildSpecs = [#{
%                    start => {mqtpla_server, start_link, []},
%                    shutdown => brutal_kill}],
%    {ok, {SupFlags, ChildSpecs}}.
