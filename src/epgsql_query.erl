%% Copyright (c) 2012 Smarkets Limited
%% Distributed under the MIT license; see LICENSE for details.
-module(epgsql_query).

-export([squery/1,
         equery/1,
         equery/2]).
-export([parse/1,
         parse/2,
         parse/3]).
-export([describe/1,
         describe/2]).
-export([bind/2,
         bind/3]).
-export([execute/1,
         execute/2,
         execute/3]).
-export([sync/0]).
-export([get_parameter/1]).

squery(Sql) ->
    epgsql:squery(cpid(), Sql).

equery(Sql) ->
    epgsql:equery(cpid(), Sql).

equery(Sql, Parameters) ->
    epgsql:equery(cpid(), Sql, Parameters).

parse(Sql) ->
    epgsql:parse(cpid(), Sql).

parse(Sql, Types) ->
    epgsql:parse(cpid(), Sql, Types).

parse(Name, Sql, Types) ->
    epgsql:parse(cpid(), Name, Sql, Types).

bind(Statement, Parameters) ->
    epgsql:bind(cpid(), Statement, Parameters).

bind(Statement, PortalName, Parameters) ->
    epgsql:bind(cpid(), Statement, PortalName, Parameters).

execute(S) ->
    epgsql:execute(cpid(), S).

execute(S, N) ->
    epgsql:execute(cpid(), S, N).

execute(S, PortalName, N) ->
    epgsql:execute(cpid(), S, PortalName, N).

describe(Statement) ->
    epgsql:describe(cpid(), Statement).

describe(Type, Name) ->
    epgsql:describe(cpid(), Type, Name).

sync() ->
    epgsql:sync(cpid()).

get_parameter(Name) ->
    epgsql:get_parameter(cpid(), Name).

cpid() ->
    case get(epgsql_conn) of
        Pid when is_pid(Pid) -> Pid;
        _ -> exit(no_connection)
    end.
