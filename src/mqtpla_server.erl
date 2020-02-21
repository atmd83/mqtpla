-module(mqtpla_server).
-export([start_link/0, init/1, callback_mode/0, handle_event/4]).

start_link() ->
   gen_statem:start_link({local, ?MODULE}, ?MODULE, [], []). 

init([]) ->
    Self = self(),
    {ok, Client} = mqtent_client:start(fun(Body) -> Self ! {update, Body} end),
    Username = <<"stevemarkking@gmail.com">>,

    mqtent_client:connect(
      Client,
      #{will => #{topic => <<"abc">>,
                  message => <<"pqr">>,
                  retain => false,
                  qos => 0},
        client => Username,
        session =>
            #{clean => true,
              keep_alive => 2}}),

    mqtent_client:subscribe(
      Client,
      [#{filter => <<"stream/compact">>, qos => 0}]),

    {ok, undefined, #{client => Client}}.


callback_mode() ->
    handle_event_function.

handle_event(info, {update, _Payload}, _, _) ->
    keep_state_and_data.
