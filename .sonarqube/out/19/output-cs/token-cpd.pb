�
c/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Components/Toolbar/LoginLink/LoginLinkViewComponent.cs
	namespace 	
SwaggerDemo
 
. 
Web 
. 

Components $
.$ %
Toolbar% ,
., -
	LoginLink- 6
;6 7
public 
class "
LoginLinkViewComponent #
:$ %
AbpViewComponent& 6
{ 
public 

virtual  
IViewComponentResult '
Invoke( .
(. /
)/ 0
{		 
return

 
View

 
(

 
$str

 C
)

C D
;

D E
} 
} �
M/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Controllers/AccountController.cs
	namespace 	
SwaggerDemo
 
. 
Web 
. 
Controllers %
;% &
public 
class 
AccountController 
:  &
ChallengeAccountController! ;
{ 
} �3
P/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Menus/SwaggerDemoMenuContributor.cs
	namespace 	
SwaggerDemo
 
. 
Web 
. 
Menus 
;  
public 
class &
SwaggerDemoMenuContributor '
:( )
IMenuContributor* :
{ 
private 
readonly 
IConfiguration #
_configuration$ 2
;2 3
public 
&
SwaggerDemoMenuContributor %
(% &
IConfiguration& 4
configuration5 B
)B C
{ 
_configuration 
= 
configuration &
;& '
} 
public 

async 
Task 
ConfigureMenuAsync (
(( )$
MenuConfigurationContext) A
contextB I
)I J
{ 
if 

( 
context 
. 
Menu 
. 
Name 
==  
StandardMenus! .
.. /
Main/ 3
)3 4
{ 	
await "
ConfigureMainMenuAsync (
(( )
context) 0
)0 1
;1 2
} 	
else   
if   
(   
context   
.   
Menu   
.   
Name   "
==  # %
StandardMenus  & 3
.  3 4
User  4 8
)  8 9
{!! 	
await"" "
ConfigureUserMenuAsync"" (
(""( )
context"") 0
)""0 1
;""1 2
}## 	
}$$ 
private&& 
Task&& "
ConfigureMainMenuAsync&& '
(&&' ($
MenuConfigurationContext&&( @
context&&A H
)&&H I
{'' 
var(( 
administration(( 
=(( 
context(( $
.(($ %
Menu((% )
.(() *
GetAdministration((* ;
(((; <
)((< =
;((= >
var)) 
l)) 
=)) 
context)) 
.)) 
GetLocalizer)) $
<))$ %
SwaggerDemoResource))% 8
>))8 9
())9 :
))): ;
;)); <
context++ 
.++ 
Menu++ 
.++ 
Items++ 
.++ 
Insert++ !
(++! "
$num,, 
,,, 
new-- 
ApplicationMenuItem-- #
(--# $
SwaggerDemoMenus..  
...  !
Home..! %
,..% &
l// 
[// 
$str// 
]// 
,// 
$str00 
,00 
icon11 
:11 
$str11 #
,11# $
order22 
:22 
$num22 
)33 
)44 	
;44	 

if66 

(66 
MultiTenancyConsts66 
.66 
	IsEnabled66 (
)66( )
{77 	
administration88 
.88 
SetSubItemOrder88 *
(88* +%
TenantManagementMenuNames88+ D
.88D E
	GroupName88E N
,88N O
$num88P Q
)88Q R
;88R S
}99 	
else:: 
{;; 	
administration<< 
.<< 
TryRemoveMenuItem<< ,
(<<, -%
TenantManagementMenuNames<<- F
.<<F G
	GroupName<<G P
)<<P Q
;<<Q R
}== 	
administration?? 
.?? 
SetSubItemOrder?? &
(??& '
IdentityMenuNames??' 8
.??8 9
	GroupName??9 B
,??B C
$num??D E
)??E F
;??F G
administration@@ 
.@@ 
SetSubItemOrder@@ &
(@@& '&
SettingManagementMenuNames@@' A
.@@A B
	GroupName@@B K
,@@K L
$num@@M N
)@@N O
;@@O P
returnBB 
TaskBB 
.BB 
CompletedTaskBB !
;BB! "
}CC 
privateEE 
TaskEE "
ConfigureUserMenuAsyncEE '
(EE' ($
MenuConfigurationContextEE( @
contextEEA H
)EEH I
{FF 
varGG 
lGG 
=GG 
contextGG 
.GG 
GetLocalizerGG $
<GG$ %
SwaggerDemoResourceGG% 8
>GG8 9
(GG9 :
)GG: ;
;GG; <
varHH "
accountStringLocalizerHH "
=HH# $
contextHH% ,
.HH, -
GetLocalizerHH- 9
<HH9 :
AccountResourceHH: I
>HHI J
(HHJ K
)HHK L
;HHL M
varII 
authServerUrlII 
=II 
_configurationII *
[II* +
$strII+ A
]IIA B
??IIC E
$strIIF H
;IIH I
contextKK 
.KK 
MenuKK 
.KK 
AddItemKK 
(KK 
newKK  
ApplicationMenuItemKK! 4
(KK4 5
$strKK5 E
,KKE F"
accountStringLocalizerKKG ]
[KK] ^
$strKK^ i
]KKi j
,KKj k
$"LL 
{LL 
authServerUrlLL 
.LL 
EnsureEndsWithLL +
(LL+ ,
$charLL, /
)LL/ 0
}LL0 1
$strLL1 J
{LLJ K
_configurationLLK Y
[LLY Z
$strLLZ g
]LLg h
}LLh i
"LLi j
,LLj k
iconLLl p
:LLp q
$strLLr }
,LL} ~
order	LL �
:
LL� �
$num
LL� �
,
LL� �
null
LL� �
,
LL� �
$str
LL� �
)
LL� �
.
LL� �"
RequireAuthenticated
LL� �
(
LL� �
)
LL� �
)
LL� �
;
LL� �
contextMM 
.MM 
MenuMM 
.MM 
AddItemMM 
(MM 
newMM  
ApplicationMenuItemMM! 4
(MM4 5
$strMM5 E
,MME F
lMMG H
[MMH I
$strMMI Q
]MMQ R
,MMR S
urlMMT W
:MMW X
$strMMY k
,MMk l
iconMMm q
:MMq r
$str	MMs �
,
MM� �
order
MM� �
:
MM� �
int
MM� �
.
MM� �
MaxValue
MM� �
-
MM� �
$num
MM� �
)
MM� �
.
MM� �"
RequireAuthenticated
MM� �
(
MM� �
)
MM� �
)
MM� �
;
MM� �
returnOO 
TaskOO 
.OO 
CompletedTaskOO !
;OO! "
}PP 
}QQ �
F/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Menus/SwaggerDemoMenus.cs
	namespace 	
SwaggerDemo
 
. 
Web 
. 
Menus 
;  
public 
class 
SwaggerDemoMenus 
{ 
private 
const 
string 
Prefix 
=  !
$str" /
;/ 0
public 

const 
string 
Home 
= 
Prefix %
+& '
$str( /
;/ 0
}

 �
S/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Menus/SwaggerDemoToolbarContributor.cs
	namespace 	
SwaggerDemo
 
. 
Web 
. 
Menus 
;  
public		 
class		 )
SwaggerDemoToolbarContributor		 *
:		+ ,
IToolbarContributor		- @
{

 
public 

virtual 
Task !
ConfigureToolbarAsync -
(- .(
IToolbarConfigurationContext. J
contextK R
)R S
{ 
if 

( 
context 
. 
Toolbar 
. 
Name  
!=! #
StandardToolbars$ 4
.4 5
Main5 9
)9 :
{ 	
return 
Task 
. 
CompletedTask %
;% &
} 	
if 

( 
! 
context 
. 
ServiceProvider $
.$ %
GetRequiredService% 7
<7 8
ICurrentUser8 D
>D E
(E F
)F G
.G H
IsAuthenticatedH W
)W X
{ 	
context 
. 
Toolbar 
. 
Items !
.! "
Add" %
(% &
new& )
ToolbarItem* 5
(5 6
typeof6 <
(< ="
LoginLinkViewComponent= S
)S T
)T U
)U V
;V W
} 	
return 
Task 
. 
CompletedTask !
;! "
} 
} �
B/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Pages/Index.cshtml.cs
	namespace 	
SwaggerDemo
 
. 
Web 
. 
Pages 
;  
public 
class 

IndexModel 
:  
SwaggerDemoPageModel .
{ 
public 

void 
OnGet 
( 
) 
{		 
} 
public 

async 
Task 
OnPostLoginAsync &
(& '
)' (
{ 
await 
HttpContext 
. 
ChallengeAsync (
(( )
$str) /
)/ 0
;0 1
} 
} �
J/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Pages/SwaggerDemoPageModel.cs
	namespace 	
SwaggerDemo
 
. 
Web 
. 
Pages 
;  
public 
abstract 
class  
SwaggerDemoPageModel *
:+ ,
AbpPageModel- 9
{ 
	protected  
SwaggerDemoPageModel "
(" #
)# $
{		 $
LocalizationResourceType

  
=

! "
typeof

# )
(

) *
SwaggerDemoResource

* =
)

= >
;

> ?
} 
} �
7/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Program.cs
	namespace		 	
SwaggerDemo		
 
.		 
Web		 
;		 
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
$str 0
)0 1
;1 2
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
<##- . 
SwaggerDemoWebModule##. B
>##B C
(##C D
)##D E
;##E F
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
G/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/Properties/AssemblyInfo.cs
[ 
assembly 	
:	 
'
InternalsVisibleToAttribute
 %
(% &
$str& =
)= >
]> ?�
K/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/SwaggerDemoBrandingProvider.cs
	namespace 	
SwaggerDemo
 
. 
Web 
; 
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
 �
O/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/SwaggerDemoWebAutoMapperProfile.cs
	namespace 	
SwaggerDemo
 
. 
Web 
; 
public 
class +
SwaggerDemoWebAutoMapperProfile ,
:- .
Profile/ 6
{ 
public 
+
SwaggerDemoWebAutoMapperProfile *
(* +
)+ ,
{ 
}

 
} ��
D/Users/nizar/SwaggerDemo/src/SwaggerDemo.Web/SwaggerDemoWebModule.cs
	namespace00 	
SwaggerDemo00
 
.00 
Web00 
;00 
[22 
	DependsOn22 

(22
 
typeof33 

(33
 *
SwaggerDemoHttpApiClientModule33 )
)33) *
,33* +
typeof44 

(44
 $
SwaggerDemoHttpApiModule44 #
)44# $
,44$ %
typeof55 

(55
 :
.AbpAspNetCoreAuthenticationOpenIdConnectModule55 9
)559 :
,55: ;
typeof66 

(66
 (
AbpAspNetCoreMvcClientModule66 '
)66' (
,66( )
typeof77 

(77
 "
AbpHttpClientWebModule77 !
)77! "
,77" #
typeof88 

(88
 4
(AbpAspNetCoreMvcUiLeptonXLiteThemeModule88 3
)883 4
,884 5
typeof99 

(99
 
AbpAutofacModule99 
)99 
,99 
typeof:: 

(::
 .
"AbpCachingStackExchangeRedisModule:: -
)::- .
,::. /
typeof;; 

(;;
 '
AbpDistributedLockingModule;; &
);;& '
,;;' (
typeof<< 

(<<
 )
AbpSettingManagementWebModule<< (
)<<( )
,<<) *
typeof== 

(==
 /
#AbpHttpClientIdentityModelWebModule== .
)==. /
,==/ 0
typeof>> 

(>>
  
AbpIdentityWebModule>> 
)>>  
,>>  !
typeof?? 

(??
 (
AbpTenantManagementWebModule?? '
)??' (
,??( )
typeof@@ 

(@@
 &
AbpAspNetCoreSerilogModule@@ %
)@@% &
,@@& '
typeofAA 

(AA
  
AbpSwashbuckleModuleAA 
)AA  
)BB 
]BB 
publicCC 
classCC  
SwaggerDemoWebModuleCC !
:CC" #
	AbpModuleCC$ -
{DD 
publicEE 

overrideEE 
voidEE  
PreConfigureServicesEE -
(EE- .'
ServiceConfigurationContextEE. I
contextEEJ Q
)EEQ R
{FF 
contextGG 
.GG 
ServicesGG 
.GG 
PreConfigureGG %
<GG% &4
(AbpMvcDataAnnotationsLocalizationOptionsGG& N
>GGN O
(GGO P
optionsGGP W
=>GGX Z
{HH 	
optionsII 
.II 
AddAssemblyResourceII '
(II' (
typeofJJ 
(JJ 
SwaggerDemoResourceJJ *
)JJ* +
,JJ+ ,
typeofKK 
(KK )
SwaggerDemoDomainSharedModuleKK 4
)KK4 5
.KK5 6
AssemblyKK6 >
,KK> ?
typeofLL 
(LL 1
%SwaggerDemoApplicationContractsModuleLL <
)LL< =
.LL= >
AssemblyLL> F
,LLF G
typeofMM 
(MM  
SwaggerDemoWebModuleMM +
)MM+ ,
.MM, -
AssemblyMM- 5
)NN 
;NN 
}OO 	
)OO	 

;OO
 
}PP 
publicRR 

overrideRR 
voidRR 
ConfigureServicesRR *
(RR* +'
ServiceConfigurationContextRR+ F
contextRRG N
)RRN O
{SS 
varTT 
hostingEnvironmentTT 
=TT  
contextTT! (
.TT( )
ServicesTT) 1
.TT1 2!
GetHostingEnvironmentTT2 G
(TTG H
)TTH I
;TTI J
varUU 
configurationUU 
=UU 
contextUU #
.UU# $
ServicesUU$ ,
.UU, -
GetConfigurationUU- =
(UU= >
)UU> ?
;UU? @
ConfigureBundlesWW 
(WW 
)WW 
;WW 
ConfigureCacheXX 
(XX 
)XX 
;XX #
ConfigureDataProtectionYY 
(YY  
contextYY  '
,YY' (
configurationYY) 6
,YY6 7
hostingEnvironmentYY8 J
)YYJ K
;YYK L'
ConfigureDistributedLockingZZ #
(ZZ# $
contextZZ$ +
,ZZ+ ,
configurationZZ- :
)ZZ: ;
;ZZ; <
ConfigureUrls[[ 
([[ 
configuration[[ #
)[[# $
;[[$ %#
ConfigureAuthentication\\ 
(\\  
context\\  '
,\\' (
configuration\\) 6
)\\6 7
;\\7 8
ConfigureAutoMapper]] 
(]] 
)]] 
;]] &
ConfigureVirtualFileSystem^^ "
(^^" #
hostingEnvironment^^# 5
)^^5 6
;^^6 7'
ConfigureNavigationServices__ #
(__# $
configuration__$ 1
)__1 2
;__2 3!
ConfigureMultiTenancy`` 
(`` 
)`` 
;``  $
ConfigureSwaggerServicesaa  
(aa  !
contextaa! (
.aa( )
Servicesaa) 1
)aa1 2
;aa2 3
}bb 
privatedd 
voiddd 
ConfigureBundlesdd !
(dd! "
)dd" #
{ee 
	Configureff 
<ff 
AbpBundlingOptionsff $
>ff$ %
(ff% &
optionsff& -
=>ff. 0
{gg 	
optionshh 
.hh 
StyleBundleshh  
.hh  !
	Configurehh! *
(hh* +#
LeptonXLiteThemeBundlesii '
.ii' (
Stylesii( .
.ii. /
Globalii/ 5
,ii5 6
bundlejj 
=>jj 
{kk 
bundlell 
.ll 
AddFilesll #
(ll# $
$strll$ 8
)ll8 9
;ll9 :
}mm 
)nn 
;nn 
}oo 	
)oo	 

;oo
 
}pp 
privaterr 
voidrr 
ConfigureCacherr 
(rr  
)rr  !
{ss 
	Configurett 
<tt &
AbpDistributedCacheOptionstt ,
>tt, -
(tt- .
optionstt. 5
=>tt6 8
{uu 	
optionsvv 
.vv 
	KeyPrefixvv 
=vv 
$strvv  .
;vv. /
}ww 	
)ww	 

;ww
 
}xx 
privatezz 
voidzz 
ConfigureUrlszz 
(zz 
IConfigurationzz -
configurationzz. ;
)zz; <
{{{ 
	Configure|| 
<|| 
AppUrlOptions|| 
>||  
(||  !
options||! (
=>||) +
{}} 	
options~~ 
.~~ 
Applications~~  
[~~  !
$str~~! &
]~~& '
.~~' (
RootUrl~~( /
=~~0 1
configuration~~2 ?
[~~? @
$str~~@ M
]~~M N
;~~N O
} 	
)	 

;
 
}
�� 
private
�� 
void
�� #
ConfigureMultiTenancy
�� &
(
��& '
)
��' (
{
�� 
	Configure
�� 
<
�� $
AbpMultiTenancyOptions
�� (
>
��( )
(
��) *
options
��* 1
=>
��2 4
{
�� 	
options
�� 
.
�� 
	IsEnabled
�� 
=
��  
MultiTenancyConsts
��  2
.
��2 3
	IsEnabled
��3 <
;
��< =
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
�� %
ConfigureAuthentication
�� (
(
��( ))
ServiceConfigurationContext
��) D
context
��E L
,
��L M
IConfiguration
��N \
configuration
��] j
)
��j k
{
�� 
context
�� 
.
�� 
Services
�� 
.
�� 
AddAuthentication
�� *
(
��* +
options
��+ 2
=>
��3 5
{
�� 
options
�� 
.
�� 
DefaultScheme
�� %
=
��& '
$str
��( 1
;
��1 2
options
�� 
.
�� $
DefaultChallengeScheme
�� .
=
��/ 0
$str
��1 7
;
��7 8
}
�� 
)
�� 
.
�� 
	AddCookie
�� 
(
�� 
$str
��  
,
��  !
options
��" )
=>
��* ,
{
�� 
options
�� 
.
�� 
ExpireTimeSpan
�� &
=
��' (
TimeSpan
��) 1
.
��1 2
FromDays
��2 :
(
��: ;
$num
��; >
)
��> ?
;
��? @
options
�� 
.
�� "
CheckTokenExpiration
�� ,
(
��, -
)
��- .
;
��. /
}
�� 
)
�� 
.
�� !
AddAbpOpenIdConnect
��  
(
��  !
$str
��! '
,
��' (
options
��) 0
=>
��1 3
{
�� 
options
�� 
.
�� 
	Authority
�� !
=
��" #
configuration
��$ 1
[
��1 2
$str
��2 H
]
��H I
;
��I J
options
�� 
.
�� "
RequireHttpsMetadata
�� ,
=
��- .
Convert
��/ 6
.
��6 7
	ToBoolean
��7 @
(
��@ A
configuration
��A N
[
��N O
$str
��O p
]
��p q
)
��q r
;
��r s
options
�� 
.
�� 
ResponseType
�� $
=
��% &'
OpenIdConnectResponseType
��' @
.
��@ A
CodeIdToken
��A L
;
��L M
options
�� 
.
�� 
ClientId
��  
=
��! "
configuration
��# 0
[
��0 1
$str
��1 F
]
��F G
;
��G H
options
�� 
.
�� 
ClientSecret
�� $
=
��% &
configuration
��' 4
[
��4 5
$str
��5 N
]
��N O
;
��O P
options
�� 
.
�� 
UsePkce
�� 
=
��  !
true
��" &
;
��& '
options
�� 
.
�� 

SaveTokens
�� "
=
��# $
true
��% )
;
��) *
options
�� 
.
�� +
GetClaimsFromUserInfoEndpoint
�� 5
=
��6 7
true
��8 <
;
��< =
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "
$str
��" )
)
��) *
;
��* +
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "
$str
��" )
)
��) *
;
��* +
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "
$str
��" )
)
��) *
;
��* +
options
�� 
.
�� 
Scope
�� 
.
�� 
Add
�� !
(
��! "
$str
��" /
)
��/ 0
;
��0 1
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
�� !
ConfigureAutoMapper
�� $
(
��$ %
)
��% &
{
�� 
	Configure
�� 
<
�� "
AbpAutoMapperOptions
�� &
>
��& '
(
��' (
options
��( /
=>
��0 2
{
�� 	
options
�� 
.
�� 
AddMaps
�� 
<
�� "
SwaggerDemoWebModule
�� 0
>
��0 1
(
��1 2
)
��2 3
;
��3 4
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
�� (
ConfigureVirtualFileSystem
�� +
(
��+ ,!
IWebHostEnvironment
��, ? 
hostingEnvironment
��@ R
)
��R S
{
�� 
if
�� 

(
��  
hostingEnvironment
�� 
.
�� 
IsDevelopment
�� ,
(
��, -
)
��- .
)
��. /
{
�� 	
	Configure
�� 
<
�� )
AbpVirtualFileSystemOptions
�� 1
>
��1 2
(
��2 3
options
��3 :
=>
��; =
{
�� 
options
�� 
.
�� 
FileSets
��  
.
��  !'
ReplaceEmbeddedByPhysical
��! :
<
��: ;+
SwaggerDemoDomainSharedModule
��; X
>
��X Y
(
��Y Z
Path
��Z ^
.
��^ _
Combine
��_ f
(
��f g 
hostingEnvironment
��g y
.
��y z
ContentRootPath��z �
,��� �
$"��� �
$str��� �
{��� �
Path��� �
.��� �&
DirectorySeparatorChar��� �
}��� �
$str��� �
"��� �
)��� �
)��� �
;��� �
options
�� 
.
�� 
FileSets
��  
.
��  !'
ReplaceEmbeddedByPhysical
��! :
<
��: ;3
%SwaggerDemoApplicationContractsModule
��; `
>
��` a
(
��a b
Path
��b f
.
��f g
Combine
��g n
(
��n o!
hostingEnvironment��o �
.��� �
ContentRootPath��� �
,��� �
$"��� �
$str��� �
{��� �
Path��� �
.��� �&
DirectorySeparatorChar��� �
}��� �
$str��� �
"��� �
)��� �
)��� �
;��� �
options
�� 
.
�� 
FileSets
��  
.
��  !'
ReplaceEmbeddedByPhysical
��! :
<
��: ;"
SwaggerDemoWebModule
��; O
>
��O P
(
��P Q 
hostingEnvironment
��Q c
.
��c d
ContentRootPath
��d s
)
��s t
;
��t u
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
private
�� 
void
�� )
ConfigureNavigationServices
�� ,
(
��, -
IConfiguration
��- ;
configuration
��< I
)
��I J
{
�� 
	Configure
�� 
<
�� "
AbpNavigationOptions
�� &
>
��& '
(
��' (
options
��( /
=>
��0 2
{
�� 	
options
�� 
.
�� 
MenuContributors
�� $
.
��$ %
Add
��% (
(
��( )
new
��) ,(
SwaggerDemoMenuContributor
��- G
(
��G H
configuration
��H U
)
��U V
)
��V W
;
��W X
}
�� 	
)
��	 

;
��
 
	Configure
�� 
<
�� 
AbpToolbarOptions
�� #
>
��# $
(
��$ %
options
��% ,
=>
��- /
{
�� 	
options
�� 
.
�� 
Contributors
��  
.
��  !
Add
��! $
(
��$ %
new
��% (+
SwaggerDemoToolbarContributor
��) F
(
��F G
)
��G H
)
��H I
;
��I J
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
�� &
ConfigureSwaggerServices
�� )
(
��) * 
IServiceCollection
��* <
services
��= E
)
��E F
{
�� 
services
�� 
.
�� 
AddAbpSwaggerGen
�� !
(
��! "
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
�� 	
;
��	 

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
��' (
if
�� 

(
�� 
!
�� 
env
�� 
.
�� 
IsDevelopment
�� 
(
�� 
)
��  
)
��  !
{
�� 	
app
�� 
.
�� 
UseErrorPage
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
app
�� 
.
�� 
UseCorrelationId
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseStaticFiles
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 

UseRouting
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseAuthentication
�� 
(
�� 
)
�� 
;
��  
if
�� 

(
��  
MultiTenancyConsts
�� 
.
�� 
	IsEnabled
�� (
)
��( )
{
�� 	
app
�� 
.
�� 
UseMultiTenancy
�� 
(
��  
)
��  !
;
��! "
}
�� 	
app
�� 
.
�� 
UseAuthorization
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 

UseSwagger
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseAbpSwaggerUI
�� 
(
�� 
options
�� #
=>
��$ &
{
�� 	
options
�� 
.
�� 
SwaggerEndpoint
�� #
(
��# $
$str
��$ >
,
��> ?
$str
��@ Q
)
��Q R
;
��R S
}
�� 	
)
��	 

;
��
 
app
�� 
.
�� $
UseAbpSerilogEnrichers
�� "
(
��" #
)
��# $
;
��$ %
app
�� 
.
�� $
UseConfiguredEndpoints
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
}�� 