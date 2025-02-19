•
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
} í
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
}88 Ïë
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
ÅÅ 
.
ÅÅ 
Services
ÅÅ 
.
ÅÅ &
AddAbpSwaggerGenWithOidc
ÅÅ 1
(
ÅÅ1 2
configuration
ÇÇ 
[
ÇÇ 
$str
ÇÇ 0
]
ÇÇ0 1
,
ÇÇ1 2
scopes
ÉÉ 
:
ÉÉ 
new
ÉÉ 
[
ÉÉ 
]
ÉÉ 
{
ÉÉ 
$str
ÉÉ )
}
ÉÉ* +
,
ÉÉ+ ,
flows
ÖÖ 
:
ÖÖ 
new
ÖÖ 
[
ÖÖ 
]
ÖÖ 
{
ÖÖ !
AbpSwaggerOidcFlows
ÖÖ .
.
ÖÖ. /
AuthorizationCode
ÖÖ/ @
,
ÖÖ@ A!
AbpSwaggerOidcFlows
ÖÖB U
.
ÖÖU V
Password
ÖÖV ^
}
ÖÖ_ `
,
ÖÖ` a
discoveryEndpoint
àà 
:
àà 
null
àà #
,
àà# $
options
ââ 
=>
ââ 
{
ää 
options
ãã 
.
ãã 

SwaggerDoc
ãã "
(
ãã" #
$str
ãã# '
,
ãã' (
new
ãã) ,
OpenApiInfo
ãã- 8
{
ãã9 :
Title
ãã; @
=
ããA B
$str
ããC T
,
ããT U
Version
ããV ]
=
ãã^ _
$str
ãã` d
}
ããe f
)
ããf g
;
ããg h
options
åå 
.
åå #
DocInclusionPredicate
åå -
(
åå- .
(
åå. /
docName
åå/ 6
,
åå6 7
description
åå8 C
)
ååC D
=>
ååE G
true
ååH L
)
ååL M
;
ååM N
options
çç 
.
çç 
CustomSchemaIds
çç '
(
çç' (
type
çç( ,
=>
çç- /
type
çç0 4
.
çç4 5
FullName
çç5 =
)
çç= >
;
çç> ?
}
éé 
)
éé 
;
éé 
}
èè 
private
ëë 
void
ëë %
ConfigureDataProtection
ëë (
(
ëë( ))
ServiceConfigurationContext
íí #
context
íí$ +
,
íí+ ,
IConfiguration
ìì 
configuration
ìì $
,
ìì$ %!
IWebHostEnvironment
îî  
hostingEnvironment
îî .
)
îî. /
{
ïï 
var
ññ #
dataProtectionBuilder
ññ !
=
ññ" #
context
ññ$ +
.
ññ+ ,
Services
ññ, 4
.
ññ4 5
AddDataProtection
ññ5 F
(
ññF G
)
ññG H
.
ññH I 
SetApplicationName
ññI [
(
ññ[ \
$str
ññ\ i
)
ññi j
;
ññj k
if
óó 

(
óó 
!
óó  
hostingEnvironment
óó 
.
óó  
IsDevelopment
óó  -
(
óó- .
)
óó. /
)
óó/ 0
{
òò 	
var
ôô 
redis
ôô 
=
ôô #
ConnectionMultiplexer
ôô -
.
ôô- .
Connect
ôô. 5
(
ôô5 6
configuration
ôô6 C
[
ôôC D
$str
ôôD Y
]
ôôY Z
)
ôôZ [
;
ôô[ \#
dataProtectionBuilder
öö !
.
öö! "-
PersistKeysToStackExchangeRedis
öö" A
(
ööA B
redis
ööB G
,
ööG H
$str
ööI f
)
ööf g
;
öög h
}
õõ 	
}
úú 
private
ûû 
void
ûû )
ConfigureDistributedLocking
ûû ,
(
ûû, -)
ServiceConfigurationContext
üü #
context
üü$ +
,
üü+ ,
IConfiguration
†† 
configuration
†† $
)
††$ %
{
°° 
context
¢¢ 
.
¢¢ 
Services
¢¢ 
.
¢¢ 
AddSingleton
¢¢ %
<
¢¢% &&
IDistributedLockProvider
¢¢& >
>
¢¢> ?
(
¢¢? @
sp
¢¢@ B
=>
¢¢C E
{
££ 	
var
§§ 

connection
§§ 
=
§§ #
ConnectionMultiplexer
§§ 2
.
•• 
Connect
•• 
(
•• 
configuration
•• &
[
••& '
$str
••' <
]
••< =
)
••= >
;
••> ?
return
¶¶ 
new
¶¶ 5
'RedisDistributedSynchronizationProvider
¶¶ >
(
¶¶> ?

connection
¶¶? I
.
¶¶I J
GetDatabase
¶¶J U
(
¶¶U V
)
¶¶V W
)
¶¶W X
;
¶¶X Y
}
ßß 	
)
ßß	 

;
ßß
 
}
®® 
private
™™ 
void
™™ 
ConfigureCors
™™ 
(
™™ )
ServiceConfigurationContext
™™ :
context
™™; B
,
™™B C
IConfiguration
™™D R
configuration
™™S `
)
™™` a
{
´´ 
context
¨¨ 
.
¨¨ 
Services
¨¨ 
.
¨¨ 
AddCors
¨¨  
(
¨¨  !
options
¨¨! (
=>
¨¨) +
{
≠≠ 	
options
ÆÆ 
.
ÆÆ 
AddDefaultPolicy
ÆÆ $
(
ÆÆ$ %
builder
ÆÆ% ,
=>
ÆÆ- /
{
ØØ 
builder
∞∞ 
.
±± 
WithOrigins
±±  
(
±±  !
configuration
±±! .
[
±±. /
$str
±±/ @
]
±±@ A
?
±±A B
.
≤≤ 
Split
≤≤ 
(
≤≤ 
$str
≤≤ "
,
≤≤" # 
StringSplitOptions
≤≤$ 6
.
≤≤6 7 
RemoveEmptyEntries
≤≤7 I
)
≤≤I J
.
≥≥ 
Select
≥≥ 
(
≥≥  
o
≥≥  !
=>
≥≥" $
o
≥≥% &
.
≥≥& '
RemovePostFix
≥≥' 4
(
≥≥4 5
$str
≥≥5 8
)
≥≥8 9
)
≥≥9 :
.
¥¥ 
ToArray
¥¥  
(
¥¥  !
)
¥¥! "
??
¥¥# %
Array
¥¥& +
.
¥¥+ ,
Empty
¥¥, 1
<
¥¥1 2
string
¥¥2 8
>
¥¥8 9
(
¥¥9 :
)
¥¥: ;
)
¥¥; <
.
µµ #
WithAbpExposedHeaders
µµ *
(
µµ* +
)
µµ+ ,
.
∂∂ 9
+SetIsOriginAllowedToAllowWildcardSubdomains
∂∂ @
(
∂∂@ A
)
∂∂A B
.
∑∑ 
AllowAnyHeader
∑∑ #
(
∑∑# $
)
∑∑$ %
.
∏∏ 
AllowAnyMethod
∏∏ #
(
∏∏# $
)
∏∏$ %
.
ππ 
AllowCredentials
ππ %
(
ππ% &
)
ππ& '
;
ππ' (
}
∫∫ 
)
∫∫ 
;
∫∫ 
}
ªª 	
)
ªª	 

;
ªª
 
}
ºº 
public
ææ 

override
ææ 
void
ææ )
OnApplicationInitialization
ææ 4
(
ææ4 5.
 ApplicationInitializationContext
ææ5 U
context
ææV ]
)
ææ] ^
{
øø 
var
¿¿ 
app
¿¿ 
=
¿¿ 
context
¿¿ 
.
¿¿ #
GetApplicationBuilder
¿¿ /
(
¿¿/ 0
)
¿¿0 1
;
¿¿1 2
var
¡¡ 
env
¡¡ 
=
¡¡ 
context
¡¡ 
.
¡¡ 
GetEnvironment
¡¡ (
(
¡¡( )
)
¡¡) *
;
¡¡* +
if
√√ 

(
√√ 
env
√√ 
.
√√ 
IsDevelopment
√√ 
(
√√ 
)
√√ 
)
√√  
{
ƒƒ 	
app
≈≈ 
.
≈≈ '
UseDeveloperExceptionPage
≈≈ )
(
≈≈) *
)
≈≈* +
;
≈≈+ ,
}
∆∆ 	
app
»» 
.
»» '
UseAbpRequestLocalization
»» %
(
»»% &
)
»»& '
;
»»' (
app
…… 
.
…… 
UseCorrelationId
…… 
(
…… 
)
…… 
;
…… 
app
   
.
   
UseStaticFiles
   
(
   
)
   
;
   
app
ÀÀ 
.
ÀÀ 

UseRouting
ÀÀ 
(
ÀÀ 
)
ÀÀ 
;
ÀÀ 
app
ÃÃ 
.
ÃÃ 
UseCors
ÃÃ 
(
ÃÃ 
)
ÃÃ 
;
ÃÃ 
app
ÕÕ 
.
ÕÕ 
UseAuthentication
ÕÕ 
(
ÕÕ 
)
ÕÕ 
;
ÕÕ  
if
œœ 

(
œœ  
MultiTenancyConsts
œœ 
.
œœ 
	IsEnabled
œœ (
)
œœ( )
{
–– 	
app
—— 
.
—— 
UseMultiTenancy
—— 
(
——  
)
——  !
;
——! "
}
““ 	
app
‘‘ 
.
‘‘ 
UseAuthorization
‘‘ 
(
‘‘ 
)
‘‘ 
;
‘‘ 
app
÷÷ 
.
÷÷ 

UseSwagger
÷÷ 
(
÷÷ 
)
÷÷ 
;
÷÷ 
app
◊◊ 
.
◊◊ 
UseAbpSwaggerUI
◊◊ 
(
◊◊ 
options
◊◊ #
=>
◊◊$ &
{
ÿÿ 	
options
ŸŸ 
.
ŸŸ 
SwaggerEndpoint
ŸŸ #
(
ŸŸ# $
$str
ŸŸ$ >
,
ŸŸ> ?
$str
ŸŸ@ Q
)
ŸŸQ R
;
ŸŸR S
var
€€ 
configuration
€€ 
=
€€ 
context
€€  '
.
€€' (
GetConfiguration
€€( 8
(
€€8 9
)
€€9 :
;
€€: ;
options
‹‹ 
.
‹‹ 
OAuthClientId
‹‹ !
(
‹‹! "
configuration
‹‹" /
[
‹‹/ 0
$str
‹‹0 L
]
‹‹L M
)
‹‹M N
;
‹‹N O
options
›› 
.
›› 
OAuthScopes
›› 
(
››  
$str
››  -
)
››- .
;
››. /
}
ﬁﬁ 	
)
ﬁﬁ	 

;
ﬁﬁ
 
app
‡‡ 
.
‡‡ 
UseAuditing
‡‡ 
(
‡‡ 
)
‡‡ 
;
‡‡ 
app
·· 
.
·· $
UseAbpSerilogEnrichers
·· "
(
··" #
)
··# $
;
··$ %
app
‚‚ 
.
‚‚ 
UseUnitOfWork
‚‚ 
(
‚‚ 
)
‚‚ 
;
‚‚ 
app
„„ 
.
„„ $
UseConfiguredEndpoints
„„ "
(
„„" #
)
„„# $
;
„„$ %
}
‰‰ 
}ÂÂ 