Æ
I/Users/nizar/SwaggerDemo/src/SwaggerDemo.AuthServer/Pages/Index.cshtml.cs
	namespace 	
SwaggerDemo
 
. 
Pages 
; 
public

 
class

 

IndexModel

 
:

 
AbpPageModel

 &
{ 
public 

List 
< !
OpenIddictApplication %
>% &
?& '
Applications( 4
{5 6
get7 :
;: ;
	protected< E
setF I
;I J
}K L
public 

IReadOnlyList 
< 
LanguageInfo %
>% &
?& '
	Languages( 1
{2 3
get4 7
;7 8
	protected9 B
setC F
;F G
}H I
public 

string 
? 
CurrentLanguage "
{# $
get% (
;( )
	protected* 3
set4 7
;7 8
}9 :
	protected ,
 IOpenIddictApplicationRepository .'
OpenIdApplicationRepository/ J
{K L
getM P
;P Q
}R S
	protected 
ILanguageProvider 
LanguageProvider  0
{1 2
get3 6
;6 7
}8 9
public 


IndexModel 
( ,
 IOpenIddictApplicationRepository 6'
openIdApplicationRepository7 R
,R S
ILanguageProviderT e
languageProviderf v
)v w
{ '
OpenIdApplicationRepository #
=$ %'
openIdApplicationRepository& A
;A B
LanguageProvider 
= 
languageProvider +
;+ ,
} 
public 

async 
Task 

OnGetAsync  
(  !
)! "
{ 
Applications 
= 
await '
OpenIdApplicationRepository 8
.8 9
GetListAsync9 E
(E F
)F G
;G H
	Languages   
=   
await   
LanguageProvider   *
.  * +
GetLanguagesAsync  + <
(  < =
)  = >
;  > ?
CurrentLanguage!! 
=!! 
CultureInfo!! %
.!!% &
CurrentCulture!!& 4
.!!4 5
DisplayName!!5 @
;!!@ A
}"" 
}## è
>/Users/nizar/SwaggerDemo/src/SwaggerDemo.AuthServer/Program.cs
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
$str >
)> ?
;? @
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
<##- .'
SwaggerDemoAuthServerModule##. I
>##I J
(##J K
)##K L
;##L M
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
$str00 K
)00K L
;00L M
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
}88 ¸q
R/Users/nizar/SwaggerDemo/src/SwaggerDemo.AuthServer/SwaggerDemoAuthServerModule.cs
	namespace&& 	
SwaggerDemo&&
 
;&& 
[(( 
	DependsOn(( 

(((
 
typeof)) 

())
 
AbpAutofacModule)) 
))) 
,)) 
typeof** 

(**
 .
"AbpCachingStackExchangeRedisModule** -
)**- .
,**. /
typeof++ 

(++
 '
AbpDistributedLockingModule++ &
)++& '
,++' (
typeof,, 

(,,
 )
AbpAccountWebOpenIddictModule,, (
),,( )
,,,) *
typeof-- 

(--
 '
AbpAccountApplicationModule-- &
)--& '
,--' (
typeof.. 

(..
 #
AbpAccountHttpApiModule.. "
).." #
,..# $
typeof// 

(//
 4
(AbpAspNetCoreMvcUiLeptonXLiteThemeModule// 3
)//3 4
,//4 5
typeof00 

(00
 0
$SwaggerDemoEntityFrameworkCoreModule00 /
)00/ 0
,000 1
typeof11 

(11
 &
AbpAspNetCoreSerilogModule11 %
)11% &
)22 
]22 
public33 
class33 '
SwaggerDemoAuthServerModule33 (
:33) *
	AbpModule33+ 4
{44 
public55 

override55 
void55  
PreConfigureServices55 -
(55- .'
ServiceConfigurationContext55. I
context55J Q
)55Q R
{66 
PreConfigure77 
<77 
OpenIddictBuilder77 &
>77& '
(77' (
builder77( /
=>770 2
{88 	
builder99 
.99 
AddValidation99 !
(99! "
options99" )
=>99* ,
{:: 
options;; 
.;; 
AddAudiences;; $
(;;$ %
$str;;% 2
);;2 3
;;;3 4
options<< 
.<< 
UseLocalServer<< &
(<<& '
)<<' (
;<<( )
options== 
.== 
UseAspNetCore== %
(==% &
)==& '
;==' (
}>> 
)>> 
;>> 
}?? 	
)??	 

;??
 
}@@ 
publicBB 

overrideBB 
voidBB 
ConfigureServicesBB *
(BB* +'
ServiceConfigurationContextBB+ F
contextBBG N
)BBN O
{CC 
varDD 
hostingEnvironmentDD 
=DD  
contextDD! (
.DD( )
ServicesDD) 1
.DD1 2!
GetHostingEnvironmentDD2 G
(DDG H
)DDH I
;DDI J
varEE 
configurationEE 
=EE 
contextEE #
.EE# $
ServicesEE$ ,
.EE, -
GetConfigurationEE- =
(EE= >
)EE> ?
;EE? @
	ConfigureGG 
<GG "
AbpLocalizationOptionsGG (
>GG( )
(GG) *
optionsGG* 1
=>GG2 4
{HH 	
optionsII 
.II 
	ResourcesII 
.JJ 
GetJJ 
<JJ 
SwaggerDemoResourceJJ (
>JJ( )
(JJ) *
)JJ* +
.KK 
AddBaseTypesKK 
(KK 
typeofLL 
(LL 
AbpUiResourceLL (
)LL( )
)MM 
;MM 
}NN 	
)NN	 

;NN
 
	ConfigurePP 
<PP 
AbpBundlingOptionsPP $
>PP$ %
(PP% &
optionsPP& -
=>PP. 0
{QQ 	
optionsRR 
.RR 
StyleBundlesRR  
.RR  !
	ConfigureRR! *
(RR* +#
LeptonXLiteThemeBundlesSS '
.SS' (
StylesSS( .
.SS. /
GlobalSS/ 5
,SS5 6
bundleTT 
=>TT 
{UU 
bundleVV 
.VV 
AddFilesVV #
(VV# $
$strVV$ 8
)VV8 9
;VV9 :
}WW 
)XX 
;XX 
}YY 	
)YY	 

;YY
 
	Configure[[ 
<[[ 
AbpAuditingOptions[[ $
>[[$ %
([[% &
options[[& -
=>[[. 0
{\\ 	
options^^ 
.^^ 
ApplicationName^^ '
=^^( )
$str^^* 6
;^^6 7
}__ 	
)__	 

;__
 
ifaa 

(aa 
hostingEnvironmentaa 
.aa 
IsDevelopmentaa ,
(aa, -
)aa- .
)aa. /
{bb 	
	Configurecc 
<cc '
AbpVirtualFileSystemOptionscc 1
>cc1 2
(cc2 3
optionscc3 :
=>cc; =
{dd 
optionsee 
.ee 
FileSetsee  
.ee  !%
ReplaceEmbeddedByPhysicalee! :
<ee: ;)
SwaggerDemoDomainSharedModuleee; X
>eeX Y
(eeY Z
PatheeZ ^
.ee^ _
Combineee_ f
(eef g
hostingEnvironmenteeg y
.eey z
ContentRootPath	eez â
,
eeâ ä
$"
eeã ç
$str
eeç è
{
eeè ê
Path
eeê î
.
eeî ï$
DirectorySeparatorChar
eeï ´
}
ee´ ¨
$str
ee¨ ≈
"
ee≈ ∆
)
ee∆ «
)
ee« »
;
ee» …
optionsff 
.ff 
FileSetsff  
.ff  !%
ReplaceEmbeddedByPhysicalff! :
<ff: ;#
SwaggerDemoDomainModuleff; R
>ffR S
(ffS T
PathffT X
.ffX Y
CombineffY `
(ff` a
hostingEnvironmentffa s
.ffs t
ContentRootPath	fft É
,
ffÉ Ñ
$"
ffÖ á
$str
ffá â
{
ffâ ä
Path
ffä é
.
ffé è$
DirectorySeparatorChar
ffè •
}
ff• ¶
$str
ff¶ ∏
"
ff∏ π
)
ffπ ∫
)
ff∫ ª
;
ffª º
}gg 
)gg 
;gg 
}hh 	
	Configurejj 
<jj 
AppUrlOptionsjj 
>jj  
(jj  !
optionsjj! (
=>jj) +
{kk 	
optionsll 
.ll 
Applicationsll  
[ll  !
$strll! &
]ll& '
.ll' (
RootUrlll( /
=ll0 1
configurationll2 ?
[ll? @
$strll@ M
]llM N
;llN O
optionsmm 
.mm 
RedirectAllowedUrlsmm '
.mm' (
AddRangemm( 0
(mm0 1
configurationmm1 >
[mm> ?
$strmm? X
]mmX Y
?mmY Z
.mmZ [
Splitmm[ `
(mm` a
$charmma d
)mmd e
??mmf h
Arraymmi n
.mmn o
Emptymmo t
<mmt u
stringmmu {
>mm{ |
(mm| }
)mm} ~
)mm~ 
;	mm Ä
optionsoo 
.oo 
Applicationsoo  
[oo  !
$stroo! *
]oo* +
.oo+ ,
RootUrloo, 3
=oo4 5
configurationoo6 C
[ooC D
$strooD S
]ooS T
;ooT U
optionspp 
.pp 
Applicationspp  
[pp  !
$strpp! *
]pp* +
.pp+ ,
Urlspp, 0
[pp0 1
AccountUrlNamespp1 @
.pp@ A
PasswordResetppA N
]ppN O
=ppP Q
$strppR j
;ppj k
}qq 	
)qq	 

;qq
 
	Configuress 
<ss #
AbpBackgroundJobOptionsss )
>ss) *
(ss* +
optionsss+ 2
=>ss3 5
{tt 	
optionsuu 
.uu !
IsJobExecutionEnableduu )
=uu* +
falseuu, 1
;uu1 2
}vv 	
)vv	 

;vv
 
	Configurexx 
<xx &
AbpDistributedCacheOptionsxx ,
>xx, -
(xx- .
optionsxx. 5
=>xx6 8
{yy 	
optionszz 
.zz 
	KeyPrefixzz 
=zz 
$strzz  .
;zz. /
}{{ 	
){{	 

;{{
 
var}} !
dataProtectionBuilder}} !
=}}" #
context}}$ +
.}}+ ,
Services}}, 4
.}}4 5
AddDataProtection}}5 F
(}}F G
)}}G H
.}}H I
SetApplicationName}}I [
(}}[ \
$str}}\ i
)}}i j
;}}j k
if~~ 

(~~ 
!~~ 
hostingEnvironment~~ 
.~~  
IsDevelopment~~  -
(~~- .
)~~. /
)~~/ 0
{ 	
var
ÄÄ 
redis
ÄÄ 
=
ÄÄ #
ConnectionMultiplexer
ÄÄ -
.
ÄÄ- .
Connect
ÄÄ. 5
(
ÄÄ5 6
configuration
ÄÄ6 C
[
ÄÄC D
$str
ÄÄD Y
]
ÄÄY Z
)
ÄÄZ [
;
ÄÄ[ \#
dataProtectionBuilder
ÅÅ !
.
ÅÅ! "-
PersistKeysToStackExchangeRedis
ÅÅ" A
(
ÅÅA B
redis
ÅÅB G
,
ÅÅG H
$str
ÅÅI f
)
ÅÅf g
;
ÅÅg h
}
ÇÇ 	
context
ÑÑ 
.
ÑÑ 
Services
ÑÑ 
.
ÑÑ 
AddSingleton
ÑÑ %
<
ÑÑ% &&
IDistributedLockProvider
ÑÑ& >
>
ÑÑ> ?
(
ÑÑ? @
sp
ÑÑ@ B
=>
ÑÑC E
{
ÖÖ 	
var
ÜÜ 

connection
ÜÜ 
=
ÜÜ #
ConnectionMultiplexer
ÜÜ 2
.
áá 
Connect
áá 
(
áá 
configuration
áá &
[
áá& '
$str
áá' <
]
áá< =
)
áá= >
;
áá> ?
return
àà 
new
àà 5
'RedisDistributedSynchronizationProvider
àà >
(
àà> ?

connection
àà? I
.
ààI J
GetDatabase
ààJ U
(
ààU V
)
ààV W
)
ààW X
;
ààX Y
}
ââ 	
)
ââ	 

;
ââ
 
context
ãã 
.
ãã 
Services
ãã 
.
ãã 
AddCors
ãã  
(
ãã  !
options
ãã! (
=>
ãã) +
{
åå 	
options
çç 
.
çç 
AddDefaultPolicy
çç $
(
çç$ %
builder
çç% ,
=>
çç- /
{
éé 
builder
èè 
.
êê 
WithOrigins
êê  
(
êê  !
configuration
ëë %
[
ëë% &
$str
ëë& 7
]
ëë7 8
?
ëë8 9
.
íí 
Split
íí "
(
íí" #
$str
íí# &
,
íí& ' 
StringSplitOptions
íí( :
.
íí: ; 
RemoveEmptyEntries
íí; M
)
ííM N
.
ìì 
Select
ìì #
(
ìì# $
o
ìì$ %
=>
ìì& (
o
ìì) *
.
ìì* +
RemovePostFix
ìì+ 8
(
ìì8 9
$str
ìì9 <
)
ìì< =
)
ìì= >
.
îî 
ToArray
îî $
(
îî$ %
)
îî% &
??
îî' )
Array
îî* /
.
îî/ 0
Empty
îî0 5
<
îî5 6
string
îî6 <
>
îî< =
(
îî= >
)
îî> ?
)
ïï 
.
ññ #
WithAbpExposedHeaders
ññ *
(
ññ* +
)
ññ+ ,
.
óó 9
+SetIsOriginAllowedToAllowWildcardSubdomains
óó @
(
óó@ A
)
óóA B
.
òò 
AllowAnyHeader
òò #
(
òò# $
)
òò$ %
.
ôô 
AllowAnyMethod
ôô #
(
ôô# $
)
ôô$ %
.
öö 
AllowCredentials
öö %
(
öö% &
)
öö& '
;
öö' (
}
õõ 
)
õõ 
;
õõ 
}
úú 	
)
úú	 

;
úú
 
}
ùù 
public
üü 

override
üü 
void
üü )
OnApplicationInitialization
üü 4
(
üü4 5.
 ApplicationInitializationContext
üü5 U
context
üüV ]
)
üü] ^
{
†† 
var
°° 
app
°° 
=
°° 
context
°° 
.
°° #
GetApplicationBuilder
°° /
(
°°/ 0
)
°°0 1
;
°°1 2
var
¢¢ 
env
¢¢ 
=
¢¢ 
context
¢¢ 
.
¢¢ 
GetEnvironment
¢¢ (
(
¢¢( )
)
¢¢) *
;
¢¢* +
if
§§ 

(
§§ 
env
§§ 
.
§§ 
IsDevelopment
§§ 
(
§§ 
)
§§ 
)
§§  
{
•• 	
app
¶¶ 
.
¶¶ '
UseDeveloperExceptionPage
¶¶ )
(
¶¶) *
)
¶¶* +
;
¶¶+ ,
}
ßß 	
app
©© 
.
©© '
UseAbpRequestLocalization
©© %
(
©©% &
)
©©& '
;
©©' (
if
´´ 

(
´´ 
!
´´ 
env
´´ 
.
´´ 
IsDevelopment
´´ 
(
´´ 
)
´´  
)
´´  !
{
¨¨ 	
app
≠≠ 
.
≠≠ 
UseErrorPage
≠≠ 
(
≠≠ 
)
≠≠ 
;
≠≠ 
}
ÆÆ 	
app
∞∞ 
.
∞∞ 
UseCorrelationId
∞∞ 
(
∞∞ 
)
∞∞ 
;
∞∞ 
app
±± 
.
±± 
UseStaticFiles
±± 
(
±± 
)
±± 
;
±± 
app
≤≤ 
.
≤≤ 

UseRouting
≤≤ 
(
≤≤ 
)
≤≤ 
;
≤≤ 
app
≥≥ 
.
≥≥ 
UseCors
≥≥ 
(
≥≥ 
)
≥≥ 
;
≥≥ 
app
¥¥ 
.
¥¥ 
UseAuthentication
¥¥ 
(
¥¥ 
)
¥¥ 
;
¥¥  
app
µµ 
.
µµ (
UseAbpOpenIddictValidation
µµ &
(
µµ& '
)
µµ' (
;
µµ( )
if
∑∑ 

(
∑∑  
MultiTenancyConsts
∑∑ 
.
∑∑ 
	IsEnabled
∑∑ (
)
∑∑( )
{
∏∏ 	
app
ππ 
.
ππ 
UseMultiTenancy
ππ 
(
ππ  
)
ππ  !
;
ππ! "
}
∫∫ 	
app
ºº 
.
ºº 
UseUnitOfWork
ºº 
(
ºº 
)
ºº 
;
ºº 
app
ΩΩ 
.
ΩΩ 
UseAuthorization
ΩΩ 
(
ΩΩ 
)
ΩΩ 
;
ΩΩ 
app
ææ 
.
ææ 
UseAuditing
ææ 
(
ææ 
)
ææ 
;
ææ 
app
øø 
.
øø $
UseAbpSerilogEnrichers
øø "
(
øø" #
)
øø# $
;
øø$ %
app
¿¿ 
.
¿¿ $
UseConfiguredEndpoints
¿¿ "
(
¿¿" #
)
¿¿# $
;
¿¿$ %
}
¡¡ 
}¬¬ ¡
R/Users/nizar/SwaggerDemo/src/SwaggerDemo.AuthServer/SwaggerDemoBrandingProvider.cs
	namespace 	
SwaggerDemo
 
; 
[ 

Dependency 
( 
ReplaceServices 
= 
true "
)" #
]# $
public 
class '
SwaggerDemoBrandingProvider (
:) *#
DefaultBrandingProvider+ B
{ 
public		 

override		 
string		 
AppName		 "
=>		# %
$str		& 3
;		3 4
}

 