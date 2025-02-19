Ñ
N/Users/nizar/SwaggerDemo/src/SwaggerDemo.DbMigrator/DbMigratorHostedService.cs
	namespace 	
SwaggerDemo
 
. 

DbMigrator  
;  !
public 
class #
DbMigratorHostedService $
:% &
IHostedService' 5
{ 
private 
readonly $
IHostApplicationLifetime -$
_hostApplicationLifetime. F
;F G
private 
readonly 
IConfiguration #
_configuration$ 2
;2 3
public 
#
DbMigratorHostedService "
(" #$
IHostApplicationLifetime# ;#
hostApplicationLifetime< S
,S T
IConfigurationU c
configurationd q
)q r
{ $
_hostApplicationLifetime  
=! "#
hostApplicationLifetime# :
;: ;
_configuration 
= 
configuration &
;& '
} 
public 

async 
Task 

StartAsync  
(  !
CancellationToken! 2
cancellationToken3 D
)D E
{ 
using 
( 
var 
application 
=  
await! &!
AbpApplicationFactory' <
.< =
CreateAsync= H
<H I'
SwaggerDemoDbMigratorModuleI d
>d e
(e f
optionsf m
=>n p
{ 	
options 
. 
Services 
.  
ReplaceConfiguration 0
(0 1
_configuration1 ?
)? @
;@ A
options 
. 

UseAutofac 
( 
) 
;  
options 
. 
Services 
. 

AddLogging &
(& '
c' (
=>) +
c, -
.- .

AddSerilog. 8
(8 9
)9 :
): ;
;; <
options 
. '
AddDataMigrationEnvironment .
(. /
)/ 0
;0 1
}   	
)  	 

)  
 
{!! 	
await"" 
application"" 
."" 
InitializeAsync"" -
(""- .
)"". /
;""/ 0
await$$ 
application$$ 
.%% 
ServiceProvider%%  
.&& 
GetRequiredService&& #
<&&# $)
SwaggerDemoDbMigrationService&&$ A
>&&A B
(&&B C
)&&C D
.'' 
MigrateAsync'' 
('' 
)'' 
;''  
await)) 
application)) 
.)) 
ShutdownAsync)) +
())+ ,
))), -
;))- .$
_hostApplicationLifetime++ $
.++$ %
StopApplication++% 4
(++4 5
)++5 6
;++6 7
},, 	
}-- 
public// 

Task// 
	StopAsync// 
(// 
CancellationToken// +
cancellationToken//, =
)//= >
{00 
return11 
Task11 
.11 
CompletedTask11 !
;11! "
}22 
}33 ‰
>/Users/nizar/SwaggerDemo/src/SwaggerDemo.DbMigrator/Program.cs
	namespace

 	
SwaggerDemo


 
.

 

DbMigrator

  
;

  !
class 
Program 
{ 
static 

async 
Task 
Main 
( 
string !
[! "
]" #
args$ (
)( )
{ 
Log 
. 
Logger 
= 
new 
LoggerConfiguration ,
(, -
)- .
. 
MinimumLevel 
. 
Information %
(% &
)& '
. 
MinimumLevel 
. 
Override "
(" #
$str# .
,. /
LogEventLevel0 =
.= >
Warning> E
)E F
. 
MinimumLevel 
. 
Override "
(" #
$str# -
,- .
LogEventLevel/ <
.< =
Warning= D
)D E
. 
MinimumLevel 
. 
Override &
(& '
$str' 4
,4 5
LogEventLevel6 C
.C D
DebugD I
)I J
. 
Enrich 
. 
FromLogContext &
(& '
)' (
. 
WriteTo 
. 
Async 
( 
c 
=> 
c  !
.! "
File" &
(& '
$str' 6
)6 7
)7 8
. 
WriteTo 
. 
Async 
( 
c 
=> 
c  !
.! "
Console" )
() *
)* +
)+ ,
. 
CreateLogger 
( 
) 
; 
await 
CreateHostBuilder 
(  
args  $
)$ %
.% &
RunConsoleAsync& 5
(5 6
)6 7
;7 8
} 
public!! 

static!! 
IHostBuilder!! 
CreateHostBuilder!! 0
(!!0 1
string!!1 7
[!!7 8
]!!8 9
args!!: >
)!!> ?
=>!!@ B
Host"" 
.""  
CreateDefaultBuilder"" !
(""! "
args""" &
)""& '
.## %
AddAppSettingsSecretsJson## &
(##& '
)##' (
.$$ 
ConfigureLogging$$ 
($$ 
($$ 
context$$ &
,$$& '
logging$$( /
)$$/ 0
=>$$1 3
logging$$4 ;
.$$; <
ClearProviders$$< J
($$J K
)$$K L
)$$L M
.%% 
ConfigureServices%% 
(%% 
(%%  
hostContext%%  +
,%%+ ,
services%%- 5
)%%5 6
=>%%7 9
{&& 
services'' 
.'' 
AddHostedService'' )
<'') *#
DbMigratorHostedService''* A
>''A B
(''B C
)''C D
;''D E
}(( 
)(( 
;(( 
})) Ì

R/Users/nizar/SwaggerDemo/src/SwaggerDemo.DbMigrator/SwaggerDemoDbMigratorModule.cs
	namespace 	
SwaggerDemo
 
. 

DbMigrator  
;  !
[		 
	DependsOn		 

(		
 
typeof

 

(


 
AbpAutofacModule

 
)

 
,

 
typeof 

(
 .
"AbpCachingStackExchangeRedisModule -
)- .
,. /
typeof 

(
 0
$SwaggerDemoEntityFrameworkCoreModule /
)/ 0
,0 1
typeof 

(
 1
%SwaggerDemoApplicationContractsModule 0
)0 1
) 
] 
public 
class '
SwaggerDemoDbMigratorModule (
:) *
	AbpModule+ 4
{ 
public 

override 
void 
ConfigureServices *
(* +'
ServiceConfigurationContext+ F
contextG N
)N O
{ 
	Configure 
< &
AbpDistributedCacheOptions ,
>, -
(- .
options. 5
=>6 8
{9 :
options; B
.B C
	KeyPrefixC L
=M N
$strO ]
;] ^
}_ `
)` a
;a b
} 
} 