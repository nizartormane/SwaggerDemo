�
S/Users/nizar/SwaggerDemo/src/SwaggerDemo.HttpApi.Host/Controllers/HomeController.cs
	namespace 	
SwaggerDemo
 
. 
Controllers !
;! "
public 
class 
HomeController 
: 
AbpController +
{ 
public 

ActionResult 
Index 
( 
) 
{		 
return

 
Redirect

 
(

 
$str

 #
)

# $
;

$ %
} 
} �
@/Users/nizar/SwaggerDemo/src/SwaggerDemo.HttpApi.Host/Program.cs
	namespace		 	
SwaggerDemo		
 
;		 
public 
class 
Program 
{ 
public 

async 
static 
Task 
< 
int  
>  !
Main" &
(& '
string' -
[- .
]. /
args0 4
)4 5
{ 
Log 
. 
Logger 
= 
new 
LoggerConfiguration ,
(, -
)- .
. 
MinimumLevel 
. 
Debug 
(  
)  !
. 
MinimumLevel 
. 
Override "
(" #
$str# .
,. /
LogEventLevel0 =
.= >
Information> I
)I J
. 
MinimumLevel 
. 
Override "
(" #
$str# B
,B C
LogEventLevelD Q
.Q R
WarningR Y
)Y Z
. 
Enrich 
. 
FromLogContext "
(" #
)# $
. 
WriteTo 
. 
Async 
( 
c 
=> 
c  !
.! "
File" &
(& '
$str' 6
)6 7
)7 8
. 
WriteTo 
. 
Async 
( 
c 
=> 
c  !
.! "
Console" )
() *
)* +
)+ ,
. 
CreateLogger 
( 
) 
; 
try 
{ 	
Log 
. 
Information 
( 
$str @
)@ A
;A B
var 
builder 
= 
WebApplication (
.( )
CreateBuilder) 6
(6 7
args7 ;
); <
;< =
builder   
.   
Host   
.   %
AddAppSettingsSecretsJson   2
(  2 3
)  3 4
.!! 

UseAutofac!! 
(!! 
)!! 
."" 

UseSerilog"" 
("" 
)"" 
;"" 
await## 
builder## 
.## 
AddApplicationAsync## -
<##- .(
SwaggerDemoHttpApiHostModule##. J
>##J K
(##K L
)##L M
;##M N
var$$ 
app$$ 
=$$ 
builder$$ 
.$$ 
Build$$ #
($$# $
)$$$ %
;$$% &
await%% 
app%% 
.%% &
InitializeApplicationAsync%% 0
(%%0 1
)%%1 2
;%%2 3
await&& 
app&& 
.&& 
RunAsync&& 
(&& 
)&&  
;&&  !
return'' 
$num'' 
;'' 
}(( 	
catch)) 
()) 
	Exception)) 
ex)) 
))) 
{** 	
if++ 
(++ 
ex++ 
is++  
HostAbortedException++ *
)++* +
{,, 
throw-- 
;-- 
}.. 
Log00 
.00 
Fatal00 
(00 
ex00 
,00 
$str00 9
)009 :
;00: ;
return11 
$num11 
;11 
}22 	
finally33 
{44 	
Log55 
.55 
CloseAndFlush55 
(55 
)55 
;55  
}66 	
}77 
}88 �
U/Users/nizar/SwaggerDemo/src/SwaggerDemo.HttpApi.Host/SwaggerDemoHttpApiHostModule.cs
	namespace   	
SwaggerDemo  
 
;   
["" 
	DependsOn"" 

(""
 
typeof## 

(##
 $
SwaggerDemoHttpApiModule## #
)### $
,##$ %
typeof$$ 

($$
 
AbpAutofacModule$$ 
)$$ 
,$$ 
typeof%% 

(%%
 .
"AbpCachingStackExchangeRedisModule%% -
)%%- .
,%%. /
typeof&& 

(&&
 '
AbpDistributedLockingModule&& &
)&&& '
,&&' (
typeof'' 

(''
 0
$AbpAspNetCoreMvcUiMultiTenancyModule'' /
)''/ 0
,''0 1
typeof(( 

(((
 (
SwaggerDemoApplicationModule(( '
)((' (
,((( )
typeof)) 

())
 0
$SwaggerDemoEntityFrameworkCoreModule)) /
)))/ 0
,))0 1
typeof** 

(**
 &
AbpAspNetCoreSerilogModule** %
)**% &
,**& '
typeof++ 

(++
  
AbpSwashbuckleModule++ 
)++  
),, 
],, 
public-- 
class-- (
SwaggerDemoHttpApiHostModule-- )
:--* +
	AbpModule--, 5
{.. 
public// 

override// 
void// 
ConfigureServices// *
(//* +'
ServiceConfigurationContext//+ F
context//G N
)//N O
{00 
var11 
configuration11 
=11 
context11 #
.11# $
Services11$ ,
.11, -
GetConfiguration11- =
(11= >
)11> ?
;11? @
var22 
hostingEnvironment22 
=22  
context22! (
.22( )
Services22) 1
.221 2!
GetHostingEnvironment222 G
(22G H
)22H I
;22I J,
 ConfigureConventionalControllers44 (
(44( )
)44) *
;44* +#
ConfigureAuthentication55 
(55  
context55  '
,55' (
configuration55) 6
)556 7
;557 8
ConfigureCache66 
(66 
configuration66 $
)66$ %
;66% &&
ConfigureVirtualFileSystem77 "
(77" #
context77# *
)77* +
;77+ ,#
ConfigureDataProtection88 
(88  
context88  '
,88' (
configuration88) 6
,886 7
hostingEnvironment888 J
)88J K
;88K L'
ConfigureDistributedLocking99 #
(99# $
context99$ +
,99+ ,
configuration99- :
)99: ;
;99; <
ConfigureCors:: 
(:: 
context:: 
,:: 
configuration:: ,
)::, -
;::- .$
ConfigureSwaggerServices;;  
(;;  !
context;;! (
,;;( )
configuration;;* 7
);;7 8
;;;8 9
}<< 
private>> 
void>> 
ConfigureCache>> 
(>>  
IConfiguration>>  .
configuration>>/ <
)>>< =
{?? 
	Configure@@ 
<@@ &
AbpDistributedCacheOptions@@ ,
>@@, -
(@@- .
options@@. 5
=>@@6 8
{@@9 :
options@@; B
.@@B C
	KeyPrefix@@C L
=@@M N
$str@@O ]
;@@] ^
}@@_ `
)@@` a
;@@a b
}AA 
privateCC 
voidCC &
ConfigureVirtualFileSystemCC +
(CC+ ,'
ServiceConfigurationContextCC, G
contextCCH O
)CCO P
{DD 
varEE 
hostingEnvironmentEE 
=EE  
contextEE! (
.EE( )
ServicesEE) 1
.EE1 2!
GetHostingEnvironmentEE2 G
(EEG H
)EEH I
;EEI J
ifGG 

(GG 
hostingEnvironmentGG 
.GG 
IsDevelopmentGG ,
(GG, -
)GG- .
)GG. /
{HH 	
	ConfigureII 
<II '
AbpVirtualFileSystemOptionsII 1
>II1 2
(II2 3
optionsII3 :
=>II; =
{JJ 
optionsKK 
.KK 
FileSetsKK  
.KK  !%
ReplaceEmbeddedByPhysicalKK! :
<KK: ;)
SwaggerDemoDomainSharedModuleKK; X
>KKX Y
(KKY Z
PathLL 
.LL 
CombineLL  
(LL  !
hostingEnvironmentLL! 3
.LL3 4
ContentRootPathLL4 C
,LLC D
$"MM 
$strMM 
{MM 
PathMM !
.MM! ""
DirectorySeparatorCharMM" 8
}MM8 9
$strMM9 R
"MMR S
)MMS T
)MMT U
;MMU V
optionsNN 
.NN 
FileSetsNN  
.NN  !%
ReplaceEmbeddedByPhysicalNN! :
<NN: ;#
SwaggerDemoDomainModuleNN; R
>NNR S
(NNS T
PathOO 
.OO 
CombineOO  
(OO  !
hostingEnvironmentOO! 3
.OO3 4
ContentRootPathOO4 C
,OOC D
$"PP 
$strPP 
{PP 
PathPP !
.PP! ""
DirectorySeparatorCharPP" 8
}PP8 9
$strPP9 K
"PPK L
)PPL M
)PPM N
;PPN O
optionsQQ 
.QQ 
FileSetsQQ  
.QQ  !%
ReplaceEmbeddedByPhysicalQQ! :
<QQ: ;1
%SwaggerDemoApplicationContractsModuleQQ; `
>QQ` a
(QQa b
PathRR 
.RR 
CombineRR  
(RR  !
hostingEnvironmentRR! 3
.RR3 4
ContentRootPathRR4 C
,RRC D
$"SS 
$strSS 
{SS 
PathSS !
.SS! ""
DirectorySeparatorCharSS" 8
}SS8 9
$strSS9 Z
"SSZ [
)SS[ \
)SS\ ]
;SS] ^
optionsTT 
.TT 
FileSetsTT  
.TT  !%
ReplaceEmbeddedByPhysicalTT! :
<TT: ;(
SwaggerDemoApplicationModuleTT; W
>TTW X
(TTX Y
PathUU 
.UU 
CombineUU  
(UU  !
hostingEnvironmentUU! 3
.UU3 4
ContentRootPathUU4 C
,UUC D
$"VV 
$strVV 
{VV 
PathVV !
.VV! ""
DirectorySeparatorCharVV" 8
}VV8 9
$strVV9 P
"VVP Q
)VVQ R
)VVR S
;VVS T
}WW 
)WW 
;WW 
}XX 	
}YY 
private[[ 
void[[ ,
 ConfigureConventionalControllers[[ 1
([[1 2
)[[2 3
{\\ 
	Configure]] 
<]] #
AbpAspNetCoreMvcOptions]] )
>]]) *
(]]* +
options]]+ 2
=>]]3 5
{^^ 	
options__ 
.__ #
ConventionalControllers__ +
.__+ ,
Create__, 2
(__2 3
typeof__3 9
(__9 :(
SwaggerDemoApplicationModule__: V
)__V W
.__W X
Assembly__X `
)__` a
;__a b
}`` 	
)``	 

;``
 
}aa 
privatecc 
voidcc #
ConfigureAuthenticationcc (
(cc( )'
ServiceConfigurationContextcc) D
contextccE L
,ccL M
IConfigurationccN \
configurationcc] j
)ccj k
{dd 
contextee 
.ee 
Servicesee 
.ee 
AddAuthenticationee *
(ee* +
JwtBearerDefaultsee+ <
.ee< = 
AuthenticationSchemeee= Q
)eeQ R
.ff 
AddJwtBearerff 
(ff 
optionsff !
=>ff" $
{gg 
optionshh 
.hh 
	Authorityhh !
=hh" #
configurationhh$ 1
[hh1 2
$strhh2 H
]hhH I
;hhI J
optionsii 
.ii  
RequireHttpsMetadataii ,
=ii- .
Convertii/ 6
.ii6 7
	ToBooleanii7 @
(ii@ A
configurationiiA N
[iiN O
$striiO p
]iip q
)iiq r
;iir s
optionsjj 
.jj 
Audiencejj  
=jj! "
$strjj# 0
;jj0 1
optionskk 
.kk 
MapInboundClaimskk (
=kk) *
falsekk+ 0
;kk0 1
}ll 
)ll 
;ll 
}mm 
privateoo 
staticoo 
voidoo $
ConfigureSwaggerServicesoo 0
(oo0 1'
ServiceConfigurationContextoo1 L
contextooM T
,ooT U
IConfigurationooV d
configurationooe r
)oor s
{pp 
context
�� 
.
�� 
Services
�� 
.
�� &
AddAbpSwaggerGenWithOidc
�� 1
(
��1 2
configuration
�� 
[
�� 
$str
�� 0
]
��0 1
,
��1 2
scopes
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
�� 
$str
�� )
}
��* +
,
��+ ,
flows
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
�� !
AbpSwaggerOidcFlows
�� .
.
��. /
AuthorizationCode
��/ @
,
��@ A!
AbpSwaggerOidcFlows
��B U
.
��U V
Password
��V ^
}
��_ `
,
��` a
discoveryEndpoint
�� 
:
�� 
null
�� #
,
��# $
options
�� 
=>
�� 
{
�� 
options
�� 
.
�� 

SwaggerDoc
�� "
(
��" #
$str
��# '
,
��' (
new
��) ,
OpenApiInfo
��- 8
{
��9 :
Title
��; @
=
��A B
$str
��C T
,
��T U
Version
��V ]
=
��^ _
$str
��` d
}
��e f
)
��f g
;
��g h
options
�� 
.
�� #
DocInclusionPredicate
�� -
(
��- .
(
��. /
docName
��/ 6
,
��6 7
description
��8 C
)
��C D
=>
��E G
true
��H L
)
��L M
;
��M N
options
�� 
.
�� 
CustomSchemaIds
�� '
(
��' (
type
��( ,
=>
��- /
type
��0 4
.
��4 5
FullName
��5 =
)
��= >
;
��> ?
}
�� 
)
�� 
;
�� 
}
�� 
private
�� 
void
�� %
ConfigureDataProtection
�� (
(
��( ))
ServiceConfigurationContext
�� #
context
��$ +
,
��+ ,
IConfiguration
�� 
configuration
�� $
,
��$ %!
IWebHostEnvironment
��  
hostingEnvironment
�� .
)
��. /
{
�� 
var
�� #
dataProtectionBuilder
�� !
=
��" #
context
��$ +
.
��+ ,
Services
��, 4
.
��4 5
AddDataProtection
��5 F
(
��F G
)
��G H
.
��H I 
SetApplicationName
��I [
(
��[ \
$str
��\ i
)
��i j
;
��j k
if
�� 

(
�� 
!
��  
hostingEnvironment
�� 
.
��  
IsDevelopment
��  -
(
��- .
)
��. /
)
��/ 0
{
�� 	
var
�� 
redis
�� 
=
�� #
ConnectionMultiplexer
�� -
.
��- .
Connect
��. 5
(
��5 6
configuration
��6 C
[
��C D
$str
��D Y
]
��Y Z
)
��Z [
;
��[ \#
dataProtectionBuilder
�� !
.
��! "-
PersistKeysToStackExchangeRedis
��" A
(
��A B
redis
��B G
,
��G H
$str
��I f
)
��f g
;
��g h
}
�� 	
}
�� 
private
�� 
void
�� )
ConfigureDistributedLocking
�� ,
(
��, -)
ServiceConfigurationContext
�� #
context
��$ +
,
��+ ,
IConfiguration
�� 
configuration
�� $
)
��$ %
{
�� 
context
�� 
.
�� 
Services
�� 
.
�� 
AddSingleton
�� %
<
��% &&
IDistributedLockProvider
��& >
>
��> ?
(
��? @
sp
��@ B
=>
��C E
{
�� 	
var
�� 

connection
�� 
=
�� #
ConnectionMultiplexer
�� 2
.
�� 
Connect
�� 
(
�� 
configuration
�� &
[
��& '
$str
��' <
]
��< =
)
��= >
;
��> ?
return
�� 
new
�� 5
'RedisDistributedSynchronizationProvider
�� >
(
��> ?

connection
��? I
.
��I J
GetDatabase
��J U
(
��U V
)
��V W
)
��W X
;
��X Y
}
�� 	
)
��	 

;
��
 
}
�� 
private
�� 
void
�� 
ConfigureCors
�� 
(
�� )
ServiceConfigurationContext
�� :
context
��; B
,
��B C
IConfiguration
��D R
configuration
��S `
)
��` a
{
�� 
context
�� 
.
�� 
Services
�� 
.
�� 
AddCors
��  
(
��  !
options
��! (
=>
��) +
{
�� 	
options
�� 
.
�� 
AddDefaultPolicy
�� $
(
��$ %
builder
��% ,
=>
��- /
{
�� 
builder
�� 
.
�� 
WithOrigins
��  
(
��  !
configuration
��! .
[
��. /
$str
��/ @
]
��@ A
?
��A B
.
�� 
Split
�� 
(
�� 
$str
�� "
,
��" # 
StringSplitOptions
��$ 6
.
��6 7 
RemoveEmptyEntries
��7 I
)
��I J
.
�� 
Select
�� 
(
��  
o
��  !
=>
��" $
o
��% &
.
��& '
RemovePostFix
��' 4
(
��4 5
$str
��5 8
)
��8 9
)
��9 :
.
�� 
ToArray
��  
(
��  !
)
��! "
??
��# %
Array
��& +
.
��+ ,
Empty
��, 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
)
��: ;
)
��; <
.
�� #
WithAbpExposedHeaders
�� *
(
��* +
)
��+ ,
.
�� 9
+SetIsOriginAllowedToAllowWildcardSubdomains
�� @
(
��@ A
)
��A B
.
�� 
AllowAnyHeader
�� #
(
��# $
)
��$ %
.
�� 
AllowAnyMethod
�� #
(
��# $
)
��$ %
.
�� 
AllowCredentials
�� %
(
��% &
)
��& '
;
��' (
}
�� 
)
�� 
;
�� 
}
�� 	
)
��	 

;
��
 
}
�� 
public
�� 

override
�� 
void
�� )
OnApplicationInitialization
�� 4
(
��4 5.
 ApplicationInitializationContext
��5 U
context
��V ]
)
��] ^
{
�� 
var
�� 
app
�� 
=
�� 
context
�� 
.
�� #
GetApplicationBuilder
�� /
(
��/ 0
)
��0 1
;
��1 2
var
�� 
env
�� 
=
�� 
context
�� 
.
�� 
GetEnvironment
�� (
(
��( )
)
��) *
;
��* +
if
�� 

(
�� 
env
�� 
.
�� 
IsDevelopment
�� 
(
�� 
)
�� 
)
��  
{
�� 	
app
�� 
.
�� '
UseDeveloperExceptionPage
�� )
(
��) *
)
��* +
;
��+ ,
}
�� 	
app
�� 
.
�� '
UseAbpRequestLocalization
�� %
(
��% &
)
��& '
;
��' (
app
�� 
.
�� 
UseCorrelationId
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseStaticFiles
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 

UseRouting
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseCors
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseAuthentication
�� 
(
�� 
)
�� 
;
��  
if
�� 

(
��  
MultiTenancyConsts
�� 
.
�� 
	IsEnabled
�� (
)
��( )
{
�� 	
app
�� 
.
�� 
UseMultiTenancy
�� 
(
��  
)
��  !
;
��! "
}
�� 	
app
�� 
.
�� 
UseAuthorization
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 

UseSwagger
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseAbpSwaggerUI
�� 
(
�� 
options
�� #
=>
��$ &
{
�� 	
options
�� 
.
�� 
SwaggerEndpoint
�� #
(
��# $
$str
��$ >
,
��> ?
$str
��@ Q
)
��Q R
;
��R S
var
�� 
configuration
�� 
=
�� 
context
��  '
.
��' (
GetConfiguration
��( 8
(
��8 9
)
��9 :
;
��: ;
options
�� 
.
�� 
OAuthClientId
�� !
(
��! "
configuration
��" /
[
��/ 0
$str
��0 L
]
��L M
)
��M N
;
��N O
options
�� 
.
�� 
OAuthScopes
�� 
(
��  
$str
��  -
)
��- .
;
��. /
}
�� 	
)
��	 

;
��
 
app
�� 
.
�� 
UseAuditing
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� $
UseAbpSerilogEnrichers
�� "
(
��" #
)
��# $
;
��$ %
app
�� 
.
�� 
UseUnitOfWork
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� $
UseConfiguredEndpoints
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
}�� 