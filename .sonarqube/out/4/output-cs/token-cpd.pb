˙
T/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/Data/ISwaggerDemoDbSchemaMigrator.cs
	namespace 	
SwaggerDemo
 
. 
Data 
; 
public 
	interface (
ISwaggerDemoDbSchemaMigrator -
{ 
Task 
MigrateAsync	 
( 
) 
; 
} Ë
W/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/Data/NullSwaggerDemoDbSchemaMigrator.cs
	namespace 	
SwaggerDemo
 
. 
Data 
; 
public		 
class		 +
NullSwaggerDemoDbSchemaMigrator		 ,
:		- .(
ISwaggerDemoDbSchemaMigrator		/ K
,		K L 
ITransientDependency		M a
{

 
public 

Task 
MigrateAsync 
( 
) 
{ 
return 
Task 
. 
CompletedTask !
;! "
} 
} ∑|
U/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/Data/SwaggerDemoDbMigrationService.cs
	namespace 	
SwaggerDemo
 
. 
Data 
; 
public 
class )
SwaggerDemoDbMigrationService *
:+ , 
ITransientDependency- A
{ 
public 

ILogger 
< )
SwaggerDemoDbMigrationService 0
>0 1
Logger2 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
private 
readonly 
IDataSeeder  
_dataSeeder! ,
;, -
private 
readonly 
IEnumerable  
<  !(
ISwaggerDemoDbSchemaMigrator! =
>= >
_dbSchemaMigrators? Q
;Q R
private 
readonly 
ITenantRepository &
_tenantRepository' 8
;8 9
private 
readonly 
ICurrentTenant #
_currentTenant$ 2
;2 3
public 
)
SwaggerDemoDbMigrationService (
(( )
IDataSeeder 

dataSeeder 
, 
IEnumerable 
< (
ISwaggerDemoDbSchemaMigrator 0
>0 1
dbSchemaMigrators2 C
,C D
ITenantRepository 
tenantRepository *
,* +
ICurrentTenant 
currentTenant $
)$ %
{   
_dataSeeder!! 
=!! 

dataSeeder!!  
;!!  !
_dbSchemaMigrators"" 
="" 
dbSchemaMigrators"" .
;"". /
_tenantRepository## 
=## 
tenantRepository## ,
;##, -
_currentTenant$$ 
=$$ 
currentTenant$$ &
;$$& '
Logger&& 
=&& 

NullLogger&& 
<&& )
SwaggerDemoDbMigrationService&& 9
>&&9 :
.&&: ;
Instance&&; C
;&&C D
}'' 
public)) 

async)) 
Task)) 
MigrateAsync)) "
())" #
)))# $
{** 
var++ !
initialMigrationAdded++ !
=++" #)
AddInitialMigrationIfNotExist++$ A
(++A B
)++B C
;++C D
if-- 

(-- !
initialMigrationAdded-- !
)--! "
{.. 	
return// 
;// 
}00 	
Logger22 
.22 
LogInformation22 
(22 
$str22 >
)22> ?
;22? @
await44 &
MigrateDatabaseSchemaAsync44 (
(44( )
)44) *
;44* +
await55 
SeedDataAsync55 
(55 
)55 
;55 
Logger77 
.77 
LogInformation77 
(77 
$"77  
$str77  P
"77P Q
)77Q R
;77R S
var99 
tenants99 
=99 
await99 
_tenantRepository99 -
.99- .
GetListAsync99. :
(99: ;
includeDetails99; I
:99I J
true99K O
)99O P
;99P Q
var;; #
migratedDatabaseSchemas;; #
=;;$ %
new;;& )
HashSet;;* 1
<;;1 2
string;;2 8
>;;8 9
(;;9 :
);;: ;
;;;; <
foreach<< 
(<< 
var<< 
tenant<< 
in<< 
tenants<< &
)<<& '
{== 	
using>> 
(>> 
_currentTenant>> !
.>>! "
Change>>" (
(>>( )
tenant>>) /
.>>/ 0
Id>>0 2
)>>2 3
)>>3 4
{?? 
if@@ 
(@@ 
tenant@@ 
.@@ 
ConnectionStrings@@ ,
.@@, -
Any@@- 0
(@@0 1
)@@1 2
)@@2 3
{AA 
varBB #
tenantConnectionStringsBB /
=BB0 1
tenantBB2 8
.BB8 9
ConnectionStringsBB9 J
.CC 
SelectCC 
(CC  
xCC  !
=>CC" $
xCC% &
.CC& '
ValueCC' ,
)CC, -
.DD 
ToListDD 
(DD  
)DD  !
;DD! "
ifFF 
(FF 
!FF #
migratedDatabaseSchemasFF 0
.FF0 1
IsSupersetOfFF1 =
(FF= >#
tenantConnectionStringsFF> U
)FFU V
)FFV W
{GG 
awaitHH &
MigrateDatabaseSchemaAsyncHH 8
(HH8 9
tenantHH9 ?
)HH? @
;HH@ A#
migratedDatabaseSchemasJJ /
.JJ/ 0
AddIfNotContainsJJ0 @
(JJ@ A#
tenantConnectionStringsJJA X
)JJX Y
;JJY Z
}KK 
}LL 
awaitNN 
SeedDataAsyncNN #
(NN# $
tenantNN$ *
)NN* +
;NN+ ,
}OO 
LoggerQQ 
.QQ 
LogInformationQQ !
(QQ! "
$"QQ" $
$strQQ$ ;
{QQ; <
tenantQQ< B
.QQB C
NameQQC G
}QQG H
$strQQH d
"QQd e
)QQe f
;QQf g
}RR 	
LoggerTT 
.TT 
LogInformationTT 
(TT 
$strTT O
)TTO P
;TTP Q
LoggerUU 
.UU 
LogInformationUU 
(UU 
$strUU B
)UUB C
;UUC D
}VV 
privateXX 
asyncXX 
TaskXX &
MigrateDatabaseSchemaAsyncXX 1
(XX1 2
TenantXX2 8
?XX8 9
tenantXX: @
=XXA B
nullXXC G
)XXG H
{YY 
LoggerZZ 
.ZZ 
LogInformationZZ 
(ZZ 
$"[[ 
$str[[ #
{[[# $
([[$ %
tenant[[% +
==[[, .
null[[/ 3
?[[4 5
$str[[6 <
:[[= >
tenant[[? E
.[[E F
Name[[F J
+[[K L
$str[[M V
)[[V W
}[[W X
$str[[X d
"[[d e
)[[e f
;[[f g
foreach]] 
(]] 
var]] 
migrator]] 
in]]  
_dbSchemaMigrators]]! 3
)]]3 4
{^^ 	
await__ 
migrator__ 
.__ 
MigrateAsync__ '
(__' (
)__( )
;__) *
}`` 	
}aa 
privatecc 
asynccc 
Taskcc 
SeedDataAsynccc $
(cc$ %
Tenantcc% +
?cc+ ,
tenantcc- 3
=cc4 5
nullcc6 :
)cc: ;
{dd 
Loggeree 
.ee 
LogInformationee 
(ee 
$"ee  
$stree  *
{ee* +
(ee+ ,
tenantee, 2
==ee3 5
nullee6 :
?ee; <
$stree= C
:eeD E
tenanteeF L
.eeL M
NameeeM Q
+eeR S
$streeT ]
)ee] ^
}ee^ _
$stree_ p
"eep q
)eeq r
;eer s
awaitgg 
_dataSeedergg 
.gg 
	SeedAsyncgg #
(gg# $
newgg$ '
DataSeedContextgg( 7
(gg7 8
tenantgg8 >
?gg> ?
.gg? @
Idgg@ B
)ggB C
.hh 
WithPropertyhh 
(hh '
IdentityDataSeedContributorhh 5
.hh5 6"
AdminEmailPropertyNamehh6 L
,hhL M'
IdentityDataSeedContributorhhN i
.hhi j#
AdminEmailDefaultValue	hhj Ä
)
hhÄ Å
.ii 
WithPropertyii 
(ii '
IdentityDataSeedContributorii 5
.ii5 6%
AdminPasswordPropertyNameii6 O
,iiO P'
IdentityDataSeedContributoriiQ l
.iil m&
AdminPasswordDefaultValue	iim Ü
)
iiÜ á
)jj 	
;jj	 

}kk 
privatemm 
boolmm )
AddInitialMigrationIfNotExistmm .
(mm. /
)mm/ 0
{nn 
tryoo 
{pp 	
ifqq 
(qq 
!qq %
DbMigrationsProjectExistsqq *
(qq* +
)qq+ ,
)qq, -
{rr 
returnss 
falsess 
;ss 
}tt 
}uu 	
catchvv 
(vv 
	Exceptionvv 
)vv 
{ww 	
returnxx 
falsexx 
;xx 
}yy 	
try{{ 
{|| 	
if}} 
(}} 
!}} "
MigrationsFolderExists}} '
(}}' (
)}}( )
)}}) *
{~~ 
AddInitialMigration #
(# $
)$ %
;% &
return
ÄÄ 
true
ÄÄ 
;
ÄÄ 
}
ÅÅ 
else
ÇÇ 
{
ÉÉ 
return
ÑÑ 
false
ÑÑ 
;
ÑÑ 
}
ÖÖ 
}
ÜÜ 	
catch
áá 
(
áá 
	Exception
áá 
e
áá 
)
áá 
{
àà 	
Logger
ââ 
.
ââ 

LogWarning
ââ 
(
ââ 
$str
ââ O
+
ââP Q
e
ââR S
.
ââS T
Message
ââT [
)
ââ[ \
;
ââ\ ]
return
ää 
false
ää 
;
ää 
}
ãã 	
}
åå 
private
éé 
bool
éé '
DbMigrationsProjectExists
éé *
(
éé* +
)
éé+ ,
{
èè 
var
êê '
dbMigrationsProjectFolder
êê %
=
êê& '5
'GetEntityFrameworkCoreProjectFolderPath
êê( O
(
êêO P
)
êêP Q
;
êêQ R
return
íí '
dbMigrationsProjectFolder
íí (
!=
íí) +
null
íí, 0
;
íí0 1
}
ìì 
private
ïï 
bool
ïï $
MigrationsFolderExists
ïï '
(
ïï' (
)
ïï( )
{
ññ 
var
óó '
dbMigrationsProjectFolder
óó %
=
óó& '5
'GetEntityFrameworkCoreProjectFolderPath
óó( O
(
óóO P
)
óóP Q
;
óóQ R
return
òò '
dbMigrationsProjectFolder
òò (
!=
òò) +
null
òò, 0
&&
òò1 3
	Directory
òò4 =
.
òò= >
Exists
òò> D
(
òòD E
Path
òòE I
.
òòI J
Combine
òòJ Q
(
òòQ R'
dbMigrationsProjectFolder
òòR k
,
òòk l
$str
òòm y
)
òòy z
)
òòz {
;
òò{ |
}
ôô 
private
õõ 
void
õõ !
AddInitialMigration
õõ $
(
õõ$ %
)
õõ% &
{
úú 
Logger
ùù 
.
ùù 
LogInformation
ùù 
(
ùù 
$str
ùù =
)
ùù= >
;
ùù> ?
string
üü 
argumentPrefix
üü 
;
üü 
string
†† 
fileName
†† 
;
†† 
if
¢¢ 

(
¢¢  
RuntimeInformation
¢¢ 
.
¢¢ 
IsOSPlatform
¢¢ +
(
¢¢+ ,

OSPlatform
¢¢, 6
.
¢¢6 7
OSX
¢¢7 :
)
¢¢: ;
||
¢¢< > 
RuntimeInformation
¢¢? Q
.
¢¢Q R
IsOSPlatform
¢¢R ^
(
¢¢^ _

OSPlatform
¢¢_ i
.
¢¢i j
Linux
¢¢j o
)
¢¢o p
)
¢¢p q
{
££ 	
argumentPrefix
§§ 
=
§§ 
$str
§§ !
;
§§! "
fileName
•• 
=
•• 
$str
•• "
;
••" #
}
¶¶ 	
else
ßß 
{
®® 	
argumentPrefix
©© 
=
©© 
$str
©© !
;
©©! "
fileName
™™ 
=
™™ 
$str
™™  
;
™™  !
}
´´ 	
var
≠≠ 
procStartInfo
≠≠ 
=
≠≠ 
new
≠≠ 
ProcessStartInfo
≠≠  0
(
≠≠0 1
fileName
≠≠1 9
,
≠≠9 :
$"
ÆÆ 
{
ÆÆ 
argumentPrefix
ÆÆ 
}
ÆÆ 
$str
ÆÆ I
{
ÆÆI J5
'GetEntityFrameworkCoreProjectFolderPath
ÆÆJ q
(
ÆÆq r
)
ÆÆr s
}
ÆÆs t
$str
ÆÆt x
"
ÆÆx y
)
ØØ 	
;
ØØ	 

try
±± 
{
≤≤ 	
Process
≥≥ 
.
≥≥ 
Start
≥≥ 
(
≥≥ 
procStartInfo
≥≥ '
)
≥≥' (
;
≥≥( )
}
¥¥ 	
catch
µµ 
(
µµ 
	Exception
µµ 
)
µµ 
{
∂∂ 	
throw
∑∑ 
new
∑∑ 
	Exception
∑∑ 
(
∑∑  
$str
∑∑  9
)
∑∑9 :
;
∑∑: ;
}
∏∏ 	
}
ππ 
private
ªª 
string
ªª 
?
ªª 5
'GetEntityFrameworkCoreProjectFolderPath
ªª ;
(
ªª; <
)
ªª< =
{
ºº 
var
ΩΩ 
slnDirectoryPath
ΩΩ 
=
ΩΩ &
GetSolutionDirectoryPath
ΩΩ 7
(
ΩΩ7 8
)
ΩΩ8 9
;
ΩΩ9 :
if
øø 

(
øø 
slnDirectoryPath
øø 
==
øø 
null
øø  $
)
øø$ %
{
¿¿ 	
throw
¡¡ 
new
¡¡ 
	Exception
¡¡ 
(
¡¡  
$str
¡¡  <
)
¡¡< =
;
¡¡= >
}
¬¬ 	
var
ƒƒ 
srcDirectoryPath
ƒƒ 
=
ƒƒ 
Path
ƒƒ #
.
ƒƒ# $
Combine
ƒƒ$ +
(
ƒƒ+ ,
slnDirectoryPath
ƒƒ, <
,
ƒƒ< =
$str
ƒƒ> C
)
ƒƒC D
;
ƒƒD E
return
∆∆ 
	Directory
∆∆ 
.
∆∆ 
GetDirectories
∆∆ '
(
∆∆' (
srcDirectoryPath
∆∆( 8
)
∆∆8 9
.
«« 
FirstOrDefault
«« 
(
«« 
d
«« 
=>
««  
d
««! "
.
««" #
EndsWith
««# +
(
««+ ,
$str
««, B
)
««B C
)
««C D
;
««D E
}
»» 
private
   
string
   
?
   &
GetSolutionDirectoryPath
   ,
(
  , -
)
  - .
{
ÀÀ 
var
ÃÃ 
currentDirectory
ÃÃ 
=
ÃÃ 
new
ÃÃ "
DirectoryInfo
ÃÃ# 0
(
ÃÃ0 1
	Directory
ÃÃ1 :
.
ÃÃ: ;!
GetCurrentDirectory
ÃÃ; N
(
ÃÃN O
)
ÃÃO P
)
ÃÃP Q
;
ÃÃQ R
while
ŒŒ 
(
ŒŒ 
currentDirectory
ŒŒ 
!=
ŒŒ  "
null
ŒŒ# '
&&
ŒŒ( *
	Directory
ŒŒ+ 4
.
ŒŒ4 5
	GetParent
ŒŒ5 >
(
ŒŒ> ?
currentDirectory
ŒŒ? O
.
ŒŒO P
FullName
ŒŒP X
)
ŒŒX Y
!=
ŒŒZ \
null
ŒŒ] a
)
ŒŒa b
{
œœ 	
currentDirectory
–– 
=
–– 
	Directory
–– (
.
––( )
	GetParent
––) 2
(
––2 3
currentDirectory
––3 C
.
––C D
FullName
––D L
)
––L M
;
––M N
if
““ 
(
““ 
currentDirectory
““  
!=
““! #
null
““$ (
&&
““) +
	Directory
““, 5
.
““5 6
GetFiles
““6 >
(
““> ?
currentDirectory
““? O
.
““O P
FullName
““P X
)
““X Y
.
““Y Z
FirstOrDefault
““Z h
(
““h i
f
““i j
=>
““k m
f
““n o
.
““o p
EndsWith
““p x
(
““x y
$str
““y 
)““ Ä
)““Ä Å
!=““Ç Ñ
null““Ö â
)““â ä
{
”” 
return
‘‘ 
currentDirectory
‘‘ '
.
‘‘' (
FullName
‘‘( 0
;
‘‘0 1
}
’’ 
}
÷÷ 	
return
ÿÿ 
null
ÿÿ 
;
ÿÿ 
}
ŸŸ 
}⁄⁄ ûﬁ
[/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/OpenIddict/OpenIddictDataSeedContributor.cs
	namespace 	
SwaggerDemo
 
. 

OpenIddict  
;  !
public 
class )
OpenIddictDataSeedContributor *
:+ , 
IDataSeedContributor- A
,A B 
ITransientDependencyC W
{ 
private 
readonly 
IConfiguration #
_configuration$ 2
;2 3
private 
readonly ,
 IOpenIddictApplicationRepository 5,
 _openIddictApplicationRepository6 V
;V W
private 
readonly "
IAbpApplicationManager +
_applicationManager, ?
;? @
private 
readonly &
IOpenIddictScopeRepository /&
_openIddictScopeRepository0 J
;J K
private 
readonly #
IOpenIddictScopeManager ,
_scopeManager- :
;: ;
private 
readonly !
IPermissionDataSeeder *!
_permissionDataSeeder+ @
;@ A
private   
readonly   
IStringLocalizer   %
<  % &
OpenIddictResponse  & 8
>  8 9
L  : ;
;  ; <
public"" 
)
OpenIddictDataSeedContributor"" (
(""( )
IConfiguration## 
configuration## $
,##$ %,
 IOpenIddictApplicationRepository$$ (+
openIddictApplicationRepository$$) H
,$$H I"
IAbpApplicationManager%% 
applicationManager%% 1
,%%1 2&
IOpenIddictScopeRepository&& "%
openIddictScopeRepository&&# <
,&&< =#
IOpenIddictScopeManager'' 
scopeManager''  ,
,'', -!
IPermissionDataSeeder((  
permissionDataSeeder(( 2
,((2 3
IStringLocalizer)) 
<)) 
OpenIddictResponse)) +
>))+ ,
l))- .
)))/ 0
{** 
_configuration++ 
=++ 
configuration++ &
;++& ',
 _openIddictApplicationRepository,, (
=,,) *+
openIddictApplicationRepository,,+ J
;,,J K
_applicationManager-- 
=-- 
applicationManager-- 0
;--0 1&
_openIddictScopeRepository.. "
=..# $%
openIddictScopeRepository..% >
;..> ?
_scopeManager// 
=// 
scopeManager// $
;//$ %!
_permissionDataSeeder00 
=00  
permissionDataSeeder00  4
;004 5
L11 	
=11
 
l11 
;11 
}22 
[44 

UnitOfWork44 
]44 
public55 

virtual55 
async55 
Task55 
	SeedAsync55 '
(55' (
DataSeedContext55( 7
context558 ?
)55? @
{66 
await77 
CreateScopesAsync77 
(77  
)77  !
;77! "
await88 #
CreateApplicationsAsync88 %
(88% &
)88& '
;88' (
}99 
private;; 
async;; 
Task;; 
CreateScopesAsync;; (
(;;( )
);;) *
{<< 
if== 

(== 
await== &
_openIddictScopeRepository== ,
.==, -
FindByNameAsync==- <
(==< =
$str=== J
)==J K
====L N
null==O S
)==S T
{>> 	
await?? 
_scopeManager?? 
.??  
CreateAsync??  +
(??+ ,
new??, /%
OpenIddictScopeDescriptor??0 I
{??J K
Name@@ 
=@@ 
$str@@ $
,@@$ %
DisplayName@@& 1
=@@2 3
$str@@4 E
,@@E F
	Resources@@G P
=@@Q R
{@@S T
$str@@U b
}@@c d
}AA 
)AA 
;AA 
}BB 	
}CC 
privateEE 
asyncEE 
TaskEE #
CreateApplicationsAsyncEE .
(EE. /
)EE/ 0
{FF 
varGG 
commonScopesGG 
=GG 
newGG 
ListGG #
<GG# $
stringGG$ *
>GG* +
{GG, -
OpenIddictConstantsHH 
.HH  
PermissionsHH  +
.HH+ ,
ScopesHH, 2
.HH2 3
AddressHH3 :
,HH: ;
OpenIddictConstantsII 
.II  
PermissionsII  +
.II+ ,
ScopesII, 2
.II2 3
EmailII3 8
,II8 9
OpenIddictConstantsJJ 
.JJ  
PermissionsJJ  +
.JJ+ ,
ScopesJJ, 2
.JJ2 3
PhoneJJ3 8
,JJ8 9
OpenIddictConstantsKK 
.KK  
PermissionsKK  +
.KK+ ,
ScopesKK, 2
.KK2 3
ProfileKK3 :
,KK: ;
OpenIddictConstantsLL 
.LL  
PermissionsLL  +
.LL+ ,
ScopesLL, 2
.LL2 3
RolesLL3 8
,LL8 9
$strMM 
}NN 	
;NN	 

varPP  
configurationSectionPP  
=PP! "
_configurationPP# 1
.PP1 2

GetSectionPP2 <
(PP< =
$strPP= V
)PPV W
;PPW X
varSS 
webClientIdSS 
=SS  
configurationSectionSS .
[SS. /
$strSS/ I
]SSI J
;SSJ K
ifTT 

(TT 
!TT 
webClientIdTT 
.TT 
IsNullOrWhiteSpaceTT +
(TT+ ,
)TT, -
)TT- .
{UU 	
varVV 
webClientRootUrlVV  
=VV! " 
configurationSectionVV# 7
[VV7 8
$strVV8 Q
]VVQ R
.VVR S
EnsureEndsWithVVS a
(VVa b
$charVVb e
)VVe f
;VVf g
awaitZZ "
CreateApplicationAsyncZZ (
(ZZ( )
name[[ 
:[[ 
webClientId[[ !
![[! "
,[[" #
type\\ 
:\\ 
OpenIddictConstants\\ )
.\\) *
ClientTypes\\* 5
.\\5 6
Confidential\\6 B
,\\B C
consentType]] 
:]] 
OpenIddictConstants]] 0
.]]0 1
ConsentTypes]]1 =
.]]= >
Implicit]]> F
,]]F G
displayName^^ 
:^^ 
$str^^ .
,^^. /
secret__ 
:__  
configurationSection__ ,
[__, -
$str__- K
]__K L
??__M O
$str__P Y
,__Y Z

grantTypes`` 
:`` 
new`` 
List``  $
<``$ %
string``% +
>``+ ,
{aa 
OpenIddictConstantsbb '
.bb' (

GrantTypesbb( 2
.bb2 3
AuthorizationCodebb3 D
,bbD E
OpenIddictConstantsbbF Y
.bbY Z

GrantTypesbbZ d
.bbd e
Implicitbbe m
}cc 
,cc 
scopesdd 
:dd 
commonScopesdd $
,dd$ %
redirectUriee 
:ee 
$"ee 
{ee  
webClientRootUrlee  0
}ee0 1
$stree1 <
"ee< =
,ee= >
	clientUriff 
:ff 
webClientRootUrlff +
,ff+ ,!
postLogoutRedirectUrigg %
:gg% &
$"gg' )
{gg) *
webClientRootUrlgg* :
}gg: ;
$strgg; P
"ggP Q
)hh 
;hh 
}ii 	
varll %
consoleAndAngularClientIdll %
=ll& ' 
configurationSectionll( <
[ll< =
$strll= W
]llW X
;llX Y
ifmm 

(mm 
!mm %
consoleAndAngularClientIdmm &
.mm& '
IsNullOrWhiteSpacemm' 9
(mm9 :
)mm: ;
)mm; <
{nn 	
varoo *
consoleAndAngularClientRootUrloo .
=oo/ 0 
configurationSectionoo1 E
[ooE F
$strooF _
]oo_ `
?oo` a
.ooa b
TrimEndoob i
(ooi j
$charooj m
)oom n
;oon o
awaitpp "
CreateApplicationAsyncpp (
(pp( )
nameqq 
:qq %
consoleAndAngularClientIdqq /
!qq/ 0
,qq0 1
typerr 
:rr 
OpenIddictConstantsrr )
.rr) *
ClientTypesrr* 5
.rr5 6
Publicrr6 <
,rr< =
consentTypess 
:ss 
OpenIddictConstantsss 0
.ss0 1
ConsentTypesss1 =
.ss= >
Implicitss> F
,ssF G
displayNamett 
:tt 
$strtt A
,ttA B
secretuu 
:uu 
nulluu 
,uu 

grantTypesvv 
:vv 
newvv 
Listvv  $
<vv$ %
stringvv% +
>vv+ ,
{vv- .
OpenIddictConstantsww '
.ww' (

GrantTypesww( 2
.ww2 3
AuthorizationCodeww3 D
,wwD E
OpenIddictConstantsxx '
.xx' (

GrantTypesxx( 2
.xx2 3
Passwordxx3 ;
,xx; <
OpenIddictConstantsyy '
.yy' (

GrantTypesyy( 2
.yy2 3
ClientCredentialsyy3 D
,yyD E
OpenIddictConstantszz '
.zz' (

GrantTypeszz( 2
.zz2 3
RefreshTokenzz3 ?
}{{ 
,{{ 
scopes|| 
:|| 
commonScopes|| $
,||$ %
redirectUri}} 
:}} *
consoleAndAngularClientRootUrl}} ;
,}}; <
	clientUri~~ 
:~~ *
consoleAndAngularClientRootUrl~~ 9
,~~9 :!
postLogoutRedirectUri %
:% &*
consoleAndAngularClientRootUrl' E
)
ÄÄ 
;
ÄÄ 
}
ÅÅ 	
var
ÑÑ 
blazorClientId
ÑÑ 
=
ÑÑ "
configurationSection
ÑÑ 1
[
ÑÑ1 2
$str
ÑÑ2 O
]
ÑÑO P
;
ÑÑP Q
if
ÖÖ 

(
ÖÖ 
!
ÖÖ 
blazorClientId
ÖÖ 
.
ÖÖ  
IsNullOrWhiteSpace
ÖÖ .
(
ÖÖ. /
)
ÖÖ/ 0
)
ÖÖ0 1
{
ÜÜ 	
var
áá 
blazorRootUrl
áá 
=
áá "
configurationSection
áá  4
[
áá4 5
$str
áá5 Q
]
ááQ R
?
ááR S
.
ááS T
TrimEnd
ááT [
(
áá[ \
$char
áá\ _
)
áá_ `
;
áá` a
await
ââ $
CreateApplicationAsync
ââ (
(
ââ( )
name
ää 
:
ää 
blazorClientId
ää $
!
ää$ %
,
ää% &
type
ãã 
:
ãã !
OpenIddictConstants
ãã )
.
ãã) *
ClientTypes
ãã* 5
.
ãã5 6
Public
ãã6 <
,
ãã< =
consentType
åå 
:
åå !
OpenIddictConstants
åå 0
.
åå0 1
ConsentTypes
åå1 =
.
åå= >
Implicit
åå> F
,
ååF G
displayName
çç 
:
çç 
$str
çç 1
,
çç1 2
secret
éé 
:
éé 
null
éé 
,
éé 

grantTypes
èè 
:
èè 
new
èè 
List
èè  $
<
èè$ %
string
èè% +
>
èè+ ,
{
èè- .!
OpenIddictConstants
èè/ B
.
èèB C

GrantTypes
èèC M
.
èèM N
AuthorizationCode
èèN _
,
èè_ `
}
èèa b
,
èèb c
scopes
êê 
:
êê 
commonScopes
êê $
,
êê$ %
redirectUri
ëë 
:
ëë 
$"
ëë 
{
ëë  
blazorRootUrl
ëë  -
}
ëë- .
$str
ëë. L
"
ëëL M
,
ëëM N
	clientUri
íí 
:
íí 
blazorRootUrl
íí (
,
íí( )#
postLogoutRedirectUri
ìì %
:
ìì% &
$"
ìì' )
{
ìì) *
blazorRootUrl
ìì* 7
}
ìì7 8
$str
ìì8 W
"
ììW X
)
îî 
;
îî 
}
ïï 	
var
òò (
blazorServerTieredClientId
òò &
=
òò' ("
configurationSection
òò) =
[
òò= >
$str
òò> g
]
òòg h
;
òòh i
if
ôô 

(
ôô 
!
ôô (
blazorServerTieredClientId
ôô '
.
ôô' ( 
IsNullOrWhiteSpace
ôô( :
(
ôô: ;
)
ôô; <
)
ôô< =
{
öö 	
var
õõ '
blazorServerTieredRootUrl
õõ )
=
õõ* +"
configurationSection
úú $
[
úú$ %
$str
úú% M
]
úúM N
.
úúN O
EnsureEndsWith
úúO ]
(
úú] ^
$char
úú^ a
)
úúa b
;
úúb c
await
ûû $
CreateApplicationAsync
ûû (
(
ûû( )
name
üü 
:
üü (
blazorServerTieredClientId
üü 0
!
üü0 1
,
üü1 2
type
†† 
:
†† !
OpenIddictConstants
†† )
.
††) *
ClientTypes
††* 5
.
††5 6
Confidential
††6 B
,
††B C
consentType
°° 
:
°° !
OpenIddictConstants
°° 0
.
°°0 1
ConsentTypes
°°1 =
.
°°= >
Implicit
°°> F
,
°°F G
displayName
¢¢ 
:
¢¢ 
$str
¢¢ 8
,
¢¢8 9
secret
££ 
:
££ "
configurationSection
££ ,
[
££, -
$str
££- Z
]
££Z [
??
££\ ^
$str
££_ h
,
££h i

grantTypes
§§ 
:
§§ 
new
§§ 
List
§§  $
<
§§$ %
string
§§% +
>
§§+ ,
{
•• !
OpenIddictConstants
¶¶ '
.
¶¶' (

GrantTypes
¶¶( 2
.
¶¶2 3
AuthorizationCode
¶¶3 D
,
¶¶D E!
OpenIddictConstants
¶¶F Y
.
¶¶Y Z

GrantTypes
¶¶Z d
.
¶¶d e
Implicit
¶¶e m
}
ßß 
,
ßß 
scopes
®® 
:
®® 
commonScopes
®® $
,
®®$ %
redirectUri
©© 
:
©© 
$"
©© 
{
©©  '
blazorServerTieredRootUrl
©©  9
}
©©9 :
$str
©©: E
"
©©E F
,
©©F G
	clientUri
™™ 
:
™™ '
blazorServerTieredRootUrl
™™ 4
,
™™4 5#
postLogoutRedirectUri
´´ %
:
´´% &
$"
´´' )
{
´´) *'
blazorServerTieredRootUrl
´´* C
}
´´C D
$str
´´D Y
"
´´Y Z
)
¨¨ 
;
¨¨ 
}
≠≠ 	
var
∞∞ 
swaggerClientId
∞∞ 
=
∞∞ "
configurationSection
∞∞ 2
[
∞∞2 3
$str
∞∞3 Q
]
∞∞Q R
;
∞∞R S
if
±± 

(
±± 
!
±± 
swaggerClientId
±± 
.
±±  
IsNullOrWhiteSpace
±± /
(
±±/ 0
)
±±0 1
)
±±1 2
{
≤≤ 	
var
≥≥ 
swaggerRootUrl
≥≥ 
=
≥≥  "
configurationSection
≥≥! 5
[
≥≥5 6
$str
≥≥6 S
]
≥≥S T
?
≥≥T U
.
≥≥U V
TrimEnd
≥≥V ]
(
≥≥] ^
$char
≥≥^ a
)
≥≥a b
;
≥≥b c
await
µµ $
CreateApplicationAsync
µµ (
(
µµ( )
name
∂∂ 
:
∂∂ 
swaggerClientId
∂∂ %
!
∂∂% &
,
∂∂& '
type
∑∑ 
:
∑∑ !
OpenIddictConstants
∑∑ )
.
∑∑) *
ClientTypes
∑∑* 5
.
∑∑5 6
Public
∑∑6 <
,
∑∑< =
consentType
∏∏ 
:
∏∏ !
OpenIddictConstants
∏∏ 0
.
∏∏0 1
ConsentTypes
∏∏1 =
.
∏∏= >
Implicit
∏∏> F
,
∏∏F G
displayName
ππ 
:
ππ 
$str
ππ 2
,
ππ2 3
secret
∫∫ 
:
∫∫ 
null
∫∫ 
,
∫∫ 

grantTypes
ªª 
:
ªª 
new
ªª 
List
ªª  $
<
ªª$ %
string
ªª% +
>
ªª+ ,
{
ªª- .!
OpenIddictConstants
ªª/ B
.
ªªB C

GrantTypes
ªªC M
.
ªªM N
AuthorizationCode
ªªN _
,
ªª_ `
}
ªªa b
,
ªªb c
scopes
ºº 
:
ºº 
commonScopes
ºº $
,
ºº$ %
redirectUri
ΩΩ 
:
ΩΩ 
$"
ΩΩ 
{
ΩΩ  
swaggerRootUrl
ΩΩ  .
}
ΩΩ. /
$str
ΩΩ/ L
"
ΩΩL M
,
ΩΩM N
	clientUri
ææ 
:
ææ 
swaggerRootUrl
ææ )
)
øø 
;
øø 
}
¿¿ 	
}
¡¡ 
private
√√ 
async
√√ 
Task
√√ $
CreateApplicationAsync
√√ -
(
√√- .
[
ƒƒ 	
NotNull
ƒƒ	 
]
ƒƒ 
string
ƒƒ 
name
ƒƒ 
,
ƒƒ 
[
≈≈ 	
NotNull
≈≈	 
]
≈≈ 
string
≈≈ 
type
≈≈ 
,
≈≈ 
[
∆∆ 	
NotNull
∆∆	 
]
∆∆ 
string
∆∆ 
consentType
∆∆ $
,
∆∆$ %
string
«« 
displayName
«« 
,
«« 
string
»» 
?
»» 
secret
»» 
,
»» 
List
…… 
<
…… 
string
…… 
>
…… 

grantTypes
…… 
,
……  
List
   
<
   
string
   
>
   
scopes
   
,
   
string
ÀÀ 
?
ÀÀ 
	clientUri
ÀÀ 
=
ÀÀ 
null
ÀÀ  
,
ÀÀ  !
string
ÃÃ 
?
ÃÃ 
redirectUri
ÃÃ 
=
ÃÃ 
null
ÃÃ "
,
ÃÃ" #
string
ÕÕ 
?
ÕÕ #
postLogoutRedirectUri
ÕÕ %
=
ÕÕ& '
null
ÕÕ( ,
,
ÕÕ, -
List
ŒŒ 
<
ŒŒ 
string
ŒŒ 
>
ŒŒ 
?
ŒŒ 
permissions
ŒŒ !
=
ŒŒ" #
null
ŒŒ$ (
)
ŒŒ( )
{
œœ 
if
–– 

(
–– 
!
–– 
string
–– 
.
–– 
IsNullOrEmpty
–– !
(
––! "
secret
––" (
)
––( )
&&
––* ,
string
––- 3
.
––3 4
Equals
––4 :
(
––: ;
type
––; ?
,
––? @!
OpenIddictConstants
––A T
.
––T U
ClientTypes
––U `
.
––` a
Public
––a g
,
––g h
StringComparison
——  
.
——  !
OrdinalIgnoreCase
——! 2
)
——2 3
)
——3 4
{
““ 	
throw
”” 
new
”” 
BusinessException
”” '
(
””' (
L
””( )
[
””) *
$str
””* W
]
””W X
)
””X Y
;
””Y Z
}
‘‘ 	
if
÷÷ 

(
÷÷ 
string
÷÷ 
.
÷÷ 
IsNullOrEmpty
÷÷  
(
÷÷  !
secret
÷÷! '
)
÷÷' (
&&
÷÷) +
string
÷÷, 2
.
÷÷2 3
Equals
÷÷3 9
(
÷÷9 :
type
÷÷: >
,
÷÷> ?!
OpenIddictConstants
÷÷@ S
.
÷÷S T
ClientTypes
÷÷T _
.
÷÷_ `
Confidential
÷÷` l
,
÷÷l m
StringComparison
◊◊  
.
◊◊  !
OrdinalIgnoreCase
◊◊! 2
)
◊◊2 3
)
◊◊3 4
{
ÿÿ 	
throw
ŸŸ 
new
ŸŸ 
BusinessException
ŸŸ '
(
ŸŸ' (
L
ŸŸ( )
[
ŸŸ) *
$str
ŸŸ* `
]
ŸŸ` a
)
ŸŸa b
;
ŸŸb c
}
⁄⁄ 	
var
‹‹ 
client
‹‹ 
=
‹‹ 
await
‹‹ .
 _openIddictApplicationRepository
‹‹ ;
.
‹‹; <!
FindByClientIdAsync
‹‹< O
(
‹‹O P
name
‹‹P T
)
‹‹T U
;
‹‹U V
var
ﬁﬁ 
application
ﬁﬁ 
=
ﬁﬁ 
new
ﬁﬁ &
AbpApplicationDescriptor
ﬁﬁ 6
{
ﬁﬁ7 8
ClientId
ﬂﬂ 
=
ﬂﬂ 
name
ﬂﬂ 
,
ﬂﬂ 

ClientType
‡‡ 
=
‡‡ 
type
‡‡ 
,
‡‡ 
ClientSecret
·· 
=
·· 
secret
·· !
,
··! "
ConsentType
‚‚ 
=
‚‚ 
consentType
‚‚ %
,
‚‚% &
DisplayName
„„ 
=
„„ 
displayName
„„ %
,
„„% &
	ClientUri
‰‰ 
=
‰‰ 
	clientUri
‰‰ !
,
‰‰! "
}
ÂÂ 	
;
ÂÂ	 

Check
ÁÁ 
.
ÁÁ 
NotNullOrEmpty
ÁÁ 
(
ÁÁ 

grantTypes
ÁÁ '
,
ÁÁ' (
nameof
ÁÁ) /
(
ÁÁ/ 0

grantTypes
ÁÁ0 :
)
ÁÁ: ;
)
ÁÁ; <
;
ÁÁ< =
Check
ËË 
.
ËË 
NotNullOrEmpty
ËË 
(
ËË 
scopes
ËË #
,
ËË# $
nameof
ËË% +
(
ËË+ ,
scopes
ËË, 2
)
ËË2 3
)
ËË3 4
;
ËË4 5
if
ÍÍ 

(
ÍÍ 
new
ÍÍ 
[
ÍÍ 
]
ÍÍ 
{
ÍÍ !
OpenIddictConstants
ÍÍ '
.
ÍÍ' (

GrantTypes
ÍÍ( 2
.
ÍÍ2 3
AuthorizationCode
ÍÍ3 D
,
ÍÍD E!
OpenIddictConstants
ÍÍF Y
.
ÍÍY Z

GrantTypes
ÍÍZ d
.
ÍÍd e
Implicit
ÍÍe m
}
ÍÍn o
.
ÍÍo p
All
ÍÍp s
(
ÍÍs t

grantTypes
ÎÎ 
.
ÎÎ 
Contains
ÎÎ #
)
ÎÎ# $
)
ÎÎ$ %
{
ÏÏ 	
application
ÌÌ 
.
ÌÌ 
Permissions
ÌÌ #
.
ÌÌ# $
Add
ÌÌ$ '
(
ÌÌ' (!
OpenIddictConstants
ÌÌ( ;
.
ÌÌ; <
Permissions
ÌÌ< G
.
ÌÌG H
ResponseTypes
ÌÌH U
.
ÌÌU V
CodeIdToken
ÌÌV a
)
ÌÌa b
;
ÌÌb c
if
ÔÔ 
(
ÔÔ 
string
ÔÔ 
.
ÔÔ 
Equals
ÔÔ 
(
ÔÔ 
type
ÔÔ "
,
ÔÔ" #!
OpenIddictConstants
ÔÔ$ 7
.
ÔÔ7 8
ClientTypes
ÔÔ8 C
.
ÔÔC D
Public
ÔÔD J
,
ÔÔJ K
StringComparison
ÔÔL \
.
ÔÔ\ ]
OrdinalIgnoreCase
ÔÔ] n
)
ÔÔn o
)
ÔÔo p
{
 
application
ÒÒ 
.
ÒÒ 
Permissions
ÒÒ '
.
ÒÒ' (
Add
ÒÒ( +
(
ÒÒ+ ,!
OpenIddictConstants
ÒÒ, ?
.
ÒÒ? @
Permissions
ÒÒ@ K
.
ÒÒK L
ResponseTypes
ÒÒL Y
.
ÒÒY Z
CodeIdTokenToken
ÒÒZ j
)
ÒÒj k
;
ÒÒk l
application
ÚÚ 
.
ÚÚ 
Permissions
ÚÚ '
.
ÚÚ' (
Add
ÚÚ( +
(
ÚÚ+ ,!
OpenIddictConstants
ÚÚ, ?
.
ÚÚ? @
Permissions
ÚÚ@ K
.
ÚÚK L
ResponseTypes
ÚÚL Y
.
ÚÚY Z
	CodeToken
ÚÚZ c
)
ÚÚc d
;
ÚÚd e
}
ÛÛ 
}
ÙÙ 	
if
ˆˆ 

(
ˆˆ 
!
ˆˆ 
redirectUri
ˆˆ 
.
ˆˆ  
IsNullOrWhiteSpace
ˆˆ +
(
ˆˆ+ ,
)
ˆˆ, -
||
ˆˆ. 0
!
ˆˆ1 2#
postLogoutRedirectUri
ˆˆ2 G
.
ˆˆG H 
IsNullOrWhiteSpace
ˆˆH Z
(
ˆˆZ [
)
ˆˆ[ \
)
ˆˆ\ ]
{
˜˜ 	
application
¯¯ 
.
¯¯ 
Permissions
¯¯ #
.
¯¯# $
Add
¯¯$ '
(
¯¯' (!
OpenIddictConstants
¯¯( ;
.
¯¯; <
Permissions
¯¯< G
.
¯¯G H
	Endpoints
¯¯H Q
.
¯¯Q R
Logout
¯¯R X
)
¯¯X Y
;
¯¯Y Z
}
˘˘ 	
var
˚˚ 
buildInGrantTypes
˚˚ 
=
˚˚ 
new
˚˚  #
[
˚˚# $
]
˚˚$ %
{
˚˚& '!
OpenIddictConstants
¸¸ 
.
¸¸  

GrantTypes
¸¸  *
.
¸¸* +
Implicit
¸¸+ 3
,
¸¸3 4!
OpenIddictConstants
¸¸5 H
.
¸¸H I

GrantTypes
¸¸I S
.
¸¸S T
Password
¸¸T \
,
¸¸\ ]!
OpenIddictConstants
˝˝ 
.
˝˝  

GrantTypes
˝˝  *
.
˝˝* +
AuthorizationCode
˝˝+ <
,
˝˝< =!
OpenIddictConstants
˝˝> Q
.
˝˝Q R

GrantTypes
˝˝R \
.
˝˝\ ]
ClientCredentials
˝˝] n
,
˝˝n o!
OpenIddictConstants
˛˛ 
.
˛˛  

GrantTypes
˛˛  *
.
˛˛* +

DeviceCode
˛˛+ 5
,
˛˛5 6!
OpenIddictConstants
˛˛7 J
.
˛˛J K

GrantTypes
˛˛K U
.
˛˛U V
RefreshToken
˛˛V b
}
ˇˇ 	
;
ˇˇ	 

foreach
ÅÅ 
(
ÅÅ 
var
ÅÅ 
	grantType
ÅÅ 
in
ÅÅ !

grantTypes
ÅÅ" ,
)
ÅÅ, -
{
ÇÇ 	
if
ÉÉ 
(
ÉÉ 
	grantType
ÉÉ 
==
ÉÉ !
OpenIddictConstants
ÉÉ 0
.
ÉÉ0 1

GrantTypes
ÉÉ1 ;
.
ÉÉ; <
AuthorizationCode
ÉÉ< M
)
ÉÉM N
{
ÑÑ 
application
ÖÖ 
.
ÖÖ 
Permissions
ÖÖ '
.
ÖÖ' (
Add
ÖÖ( +
(
ÖÖ+ ,!
OpenIddictConstants
ÖÖ, ?
.
ÖÖ? @
Permissions
ÖÖ@ K
.
ÖÖK L

GrantTypes
ÖÖL V
.
ÖÖV W
AuthorizationCode
ÖÖW h
)
ÖÖh i
;
ÖÖi j
application
ÜÜ 
.
ÜÜ 
Permissions
ÜÜ '
.
ÜÜ' (
Add
ÜÜ( +
(
ÜÜ+ ,!
OpenIddictConstants
ÜÜ, ?
.
ÜÜ? @
Permissions
ÜÜ@ K
.
ÜÜK L
ResponseTypes
ÜÜL Y
.
ÜÜY Z
Code
ÜÜZ ^
)
ÜÜ^ _
;
ÜÜ_ `
}
áá 
if
ââ 
(
ââ 
	grantType
ââ 
==
ââ !
OpenIddictConstants
ââ 0
.
ââ0 1

GrantTypes
ââ1 ;
.
ââ; <
AuthorizationCode
ââ< M
||
ââN P
	grantType
ää 
==
ää !
OpenIddictConstants
ää 0
.
ää0 1

GrantTypes
ää1 ;
.
ää; <
Implicit
ää< D
)
ääD E
{
ãã 
application
åå 
.
åå 
Permissions
åå '
.
åå' (
Add
åå( +
(
åå+ ,!
OpenIddictConstants
åå, ?
.
åå? @
Permissions
åå@ K
.
ååK L
	Endpoints
ååL U
.
ååU V
Authorization
ååV c
)
ååc d
;
ååd e
}
çç 
if
èè 
(
èè 
	grantType
èè 
==
èè !
OpenIddictConstants
èè 0
.
èè0 1

GrantTypes
èè1 ;
.
èè; <
AuthorizationCode
èè< M
||
èèN P
	grantType
êê 
==
êê !
OpenIddictConstants
êê 0
.
êê0 1

GrantTypes
êê1 ;
.
êê; <
ClientCredentials
êê< M
||
êêN P
	grantType
ëë 
==
ëë !
OpenIddictConstants
ëë 0
.
ëë0 1

GrantTypes
ëë1 ;
.
ëë; <
Password
ëë< D
||
ëëE G
	grantType
íí 
==
íí !
OpenIddictConstants
íí 0
.
íí0 1

GrantTypes
íí1 ;
.
íí; <
RefreshToken
íí< H
||
ííI K
	grantType
ìì 
==
ìì !
OpenIddictConstants
ìì 0
.
ìì0 1

GrantTypes
ìì1 ;
.
ìì; <

DeviceCode
ìì< F
)
ììF G
{
îî 
application
ïï 
.
ïï 
Permissions
ïï '
.
ïï' (
Add
ïï( +
(
ïï+ ,!
OpenIddictConstants
ïï, ?
.
ïï? @
Permissions
ïï@ K
.
ïïK L
	Endpoints
ïïL U
.
ïïU V
Token
ïïV [
)
ïï[ \
;
ïï\ ]
application
ññ 
.
ññ 
Permissions
ññ '
.
ññ' (
Add
ññ( +
(
ññ+ ,!
OpenIddictConstants
ññ, ?
.
ññ? @
Permissions
ññ@ K
.
ññK L
	Endpoints
ññL U
.
ññU V

Revocation
ññV `
)
ññ` a
;
ñña b
application
óó 
.
óó 
Permissions
óó '
.
óó' (
Add
óó( +
(
óó+ ,!
OpenIddictConstants
óó, ?
.
óó? @
Permissions
óó@ K
.
óóK L
	Endpoints
óóL U
.
óóU V
Introspection
óóV c
)
óóc d
;
óód e
}
òò 
if
öö 
(
öö 
	grantType
öö 
==
öö !
OpenIddictConstants
öö 0
.
öö0 1

GrantTypes
öö1 ;
.
öö; <
ClientCredentials
öö< M
)
ööM N
{
õõ 
application
úú 
.
úú 
Permissions
úú '
.
úú' (
Add
úú( +
(
úú+ ,!
OpenIddictConstants
úú, ?
.
úú? @
Permissions
úú@ K
.
úúK L

GrantTypes
úúL V
.
úúV W
ClientCredentials
úúW h
)
úúh i
;
úúi j
}
ùù 
if
üü 
(
üü 
	grantType
üü 
==
üü !
OpenIddictConstants
üü 0
.
üü0 1

GrantTypes
üü1 ;
.
üü; <
Implicit
üü< D
)
üüD E
{
†† 
application
°° 
.
°° 
Permissions
°° '
.
°°' (
Add
°°( +
(
°°+ ,!
OpenIddictConstants
°°, ?
.
°°? @
Permissions
°°@ K
.
°°K L

GrantTypes
°°L V
.
°°V W
Implicit
°°W _
)
°°_ `
;
°°` a
}
¢¢ 
if
§§ 
(
§§ 
	grantType
§§ 
==
§§ !
OpenIddictConstants
§§ 0
.
§§0 1

GrantTypes
§§1 ;
.
§§; <
Password
§§< D
)
§§D E
{
•• 
application
¶¶ 
.
¶¶ 
Permissions
¶¶ '
.
¶¶' (
Add
¶¶( +
(
¶¶+ ,!
OpenIddictConstants
¶¶, ?
.
¶¶? @
Permissions
¶¶@ K
.
¶¶K L

GrantTypes
¶¶L V
.
¶¶V W
Password
¶¶W _
)
¶¶_ `
;
¶¶` a
}
ßß 
if
©© 
(
©© 
	grantType
©© 
==
©© !
OpenIddictConstants
©© 0
.
©©0 1

GrantTypes
©©1 ;
.
©©; <
RefreshToken
©©< H
)
©©H I
{
™™ 
application
´´ 
.
´´ 
Permissions
´´ '
.
´´' (
Add
´´( +
(
´´+ ,!
OpenIddictConstants
´´, ?
.
´´? @
Permissions
´´@ K
.
´´K L

GrantTypes
´´L V
.
´´V W
RefreshToken
´´W c
)
´´c d
;
´´d e
}
¨¨ 
if
ÆÆ 
(
ÆÆ 
	grantType
ÆÆ 
==
ÆÆ !
OpenIddictConstants
ÆÆ 0
.
ÆÆ0 1

GrantTypes
ÆÆ1 ;
.
ÆÆ; <

DeviceCode
ÆÆ< F
)
ÆÆF G
{
ØØ 
application
∞∞ 
.
∞∞ 
Permissions
∞∞ '
.
∞∞' (
Add
∞∞( +
(
∞∞+ ,!
OpenIddictConstants
∞∞, ?
.
∞∞? @
Permissions
∞∞@ K
.
∞∞K L

GrantTypes
∞∞L V
.
∞∞V W

DeviceCode
∞∞W a
)
∞∞a b
;
∞∞b c
application
±± 
.
±± 
Permissions
±± '
.
±±' (
Add
±±( +
(
±±+ ,!
OpenIddictConstants
±±, ?
.
±±? @
Permissions
±±@ K
.
±±K L
	Endpoints
±±L U
.
±±U V
Device
±±V \
)
±±\ ]
;
±±] ^
}
≤≤ 
if
¥¥ 
(
¥¥ 
	grantType
¥¥ 
==
¥¥ !
OpenIddictConstants
¥¥ 0
.
¥¥0 1

GrantTypes
¥¥1 ;
.
¥¥; <
Implicit
¥¥< D
)
¥¥D E
{
µµ 
application
∂∂ 
.
∂∂ 
Permissions
∂∂ '
.
∂∂' (
Add
∂∂( +
(
∂∂+ ,!
OpenIddictConstants
∂∂, ?
.
∂∂? @
Permissions
∂∂@ K
.
∂∂K L
ResponseTypes
∂∂L Y
.
∂∂Y Z
IdToken
∂∂Z a
)
∂∂a b
;
∂∂b c
if
∑∑ 
(
∑∑ 
string
∑∑ 
.
∑∑ 
Equals
∑∑ !
(
∑∑! "
type
∑∑" &
,
∑∑& '!
OpenIddictConstants
∑∑( ;
.
∑∑; <
ClientTypes
∑∑< G
.
∑∑G H
Public
∑∑H N
,
∑∑N O
StringComparison
∑∑P `
.
∑∑` a
OrdinalIgnoreCase
∑∑a r
)
∑∑r s
)
∑∑s t
{
∏∏ 
application
ππ 
.
ππ  
Permissions
ππ  +
.
ππ+ ,
Add
ππ, /
(
ππ/ 0!
OpenIddictConstants
ππ0 C
.
ππC D
Permissions
ππD O
.
ππO P
ResponseTypes
ππP ]
.
ππ] ^
IdTokenToken
ππ^ j
)
ππj k
;
ππk l
application
∫∫ 
.
∫∫  
Permissions
∫∫  +
.
∫∫+ ,
Add
∫∫, /
(
∫∫/ 0!
OpenIddictConstants
∫∫0 C
.
∫∫C D
Permissions
∫∫D O
.
∫∫O P
ResponseTypes
∫∫P ]
.
∫∫] ^
Token
∫∫^ c
)
∫∫c d
;
∫∫d e
}
ªª 
}
ºº 
if
ææ 
(
ææ 
!
ææ 
buildInGrantTypes
ææ "
.
ææ" #
Contains
ææ# +
(
ææ+ ,
	grantType
ææ, 5
)
ææ5 6
)
ææ6 7
{
øø 
application
¿¿ 
.
¿¿ 
Permissions
¿¿ '
.
¿¿' (
Add
¿¿( +
(
¿¿+ ,!
OpenIddictConstants
¿¿, ?
.
¿¿? @
Permissions
¿¿@ K
.
¿¿K L
Prefixes
¿¿L T
.
¿¿T U
	GrantType
¿¿U ^
+
¿¿_ `
	grantType
¿¿a j
)
¿¿j k
;
¿¿k l
}
¡¡ 
}
¬¬ 	
var
ƒƒ 
buildInScopes
ƒƒ 
=
ƒƒ 
new
ƒƒ 
[
ƒƒ  
]
ƒƒ  !
{
ƒƒ" #!
OpenIddictConstants
≈≈ 
.
≈≈  
Permissions
≈≈  +
.
≈≈+ ,
Scopes
≈≈, 2
.
≈≈2 3
Address
≈≈3 :
,
≈≈: ;!
OpenIddictConstants
≈≈< O
.
≈≈O P
Permissions
≈≈P [
.
≈≈[ \
Scopes
≈≈\ b
.
≈≈b c
Email
≈≈c h
,
≈≈h i!
OpenIddictConstants
∆∆ 
.
∆∆  
Permissions
∆∆  +
.
∆∆+ ,
Scopes
∆∆, 2
.
∆∆2 3
Phone
∆∆3 8
,
∆∆8 9!
OpenIddictConstants
∆∆: M
.
∆∆M N
Permissions
∆∆N Y
.
∆∆Y Z
Scopes
∆∆Z `
.
∆∆` a
Profile
∆∆a h
,
∆∆h i!
OpenIddictConstants
«« 
.
««  
Permissions
««  +
.
««+ ,
Scopes
««, 2
.
««2 3
Roles
««3 8
}
»» 	
;
»»	 

foreach
   
(
   
var
   
scope
   
in
   
scopes
   $
)
  $ %
{
ÀÀ 	
if
ÃÃ 
(
ÃÃ 
buildInScopes
ÃÃ 
.
ÃÃ 
Contains
ÃÃ &
(
ÃÃ& '
scope
ÃÃ' ,
)
ÃÃ, -
)
ÃÃ- .
{
ÕÕ 
application
ŒŒ 
.
ŒŒ 
Permissions
ŒŒ '
.
ŒŒ' (
Add
ŒŒ( +
(
ŒŒ+ ,
scope
ŒŒ, 1
)
ŒŒ1 2
;
ŒŒ2 3
}
œœ 
else
–– 
{
—— 
application
““ 
.
““ 
Permissions
““ '
.
““' (
Add
““( +
(
““+ ,!
OpenIddictConstants
““, ?
.
““? @
Permissions
““@ K
.
““K L
Prefixes
““L T
.
““T U
Scope
““U Z
+
““[ \
scope
““] b
)
““b c
;
““c d
}
”” 
}
‘‘ 	
if
÷÷ 

(
÷÷ 
redirectUri
÷÷ 
!=
÷÷ 
null
÷÷ 
)
÷÷  
{
◊◊ 	
if
ÿÿ 
(
ÿÿ 
!
ÿÿ 
redirectUri
ÿÿ 
.
ÿÿ 
IsNullOrEmpty
ÿÿ *
(
ÿÿ* +
)
ÿÿ+ ,
)
ÿÿ, -
{
ŸŸ 
if
⁄⁄ 
(
⁄⁄ 
!
⁄⁄ 
Uri
⁄⁄ 
.
⁄⁄ 
	TryCreate
⁄⁄ "
(
⁄⁄" #
redirectUri
⁄⁄# .
,
⁄⁄. /
UriKind
⁄⁄0 7
.
⁄⁄7 8
Absolute
⁄⁄8 @
,
⁄⁄@ A
out
⁄⁄B E
var
⁄⁄F I
uri
⁄⁄J M
)
⁄⁄M N
||
⁄⁄O Q
!
⁄⁄R S
uri
⁄⁄S V
.
⁄⁄V W(
IsWellFormedOriginalString
⁄⁄W q
(
⁄⁄q r
)
⁄⁄r s
)
⁄⁄s t
{
€€ 
throw
‹‹ 
new
‹‹ 
BusinessException
‹‹ /
(
‹‹/ 0
L
‹‹0 1
[
‹‹1 2
$str
‹‹2 F
,
‹‹F G
redirectUri
‹‹H S
]
‹‹S T
)
‹‹T U
;
‹‹U V
}
›› 
if
ﬂﬂ 
(
ﬂﬂ 
application
ﬂﬂ 
.
ﬂﬂ  
RedirectUris
ﬂﬂ  ,
.
ﬂﬂ, -
All
ﬂﬂ- 0
(
ﬂﬂ0 1
x
ﬂﬂ1 2
=>
ﬂﬂ3 5
x
ﬂﬂ6 7
!=
ﬂﬂ8 :
uri
ﬂﬂ; >
)
ﬂﬂ> ?
)
ﬂﬂ? @
{
‡‡ 
application
·· 
.
··  
RedirectUris
··  ,
.
··, -
Add
··- 0
(
··0 1
uri
··1 4
)
··4 5
;
··5 6
}
‚‚ 
}
„„ 
}
‰‰ 	
if
ÊÊ 

(
ÊÊ #
postLogoutRedirectUri
ÊÊ !
!=
ÊÊ" $
null
ÊÊ% )
)
ÊÊ) *
{
ÁÁ 	
if
ËË 
(
ËË 
!
ËË #
postLogoutRedirectUri
ËË &
.
ËË& '
IsNullOrEmpty
ËË' 4
(
ËË4 5
)
ËË5 6
)
ËË6 7
{
ÈÈ 
if
ÍÍ 
(
ÍÍ 
!
ÍÍ 
Uri
ÍÍ 
.
ÍÍ 
	TryCreate
ÍÍ "
(
ÍÍ" ##
postLogoutRedirectUri
ÍÍ# 8
,
ÍÍ8 9
UriKind
ÍÍ: A
.
ÍÍA B
Absolute
ÍÍB J
,
ÍÍJ K
out
ÍÍL O
var
ÍÍP S
uri
ÍÍT W
)
ÍÍW X
||
ÍÍY [
!
ÎÎ 
uri
ÎÎ 
.
ÎÎ (
IsWellFormedOriginalString
ÎÎ 3
(
ÎÎ3 4
)
ÎÎ4 5
)
ÎÎ5 6
{
ÏÏ 
throw
ÌÌ 
new
ÌÌ 
BusinessException
ÌÌ /
(
ÌÌ/ 0
L
ÌÌ0 1
[
ÌÌ1 2
$str
ÌÌ2 P
,
ÌÌP Q#
postLogoutRedirectUri
ÌÌR g
]
ÌÌg h
)
ÌÌh i
;
ÌÌi j
}
ÓÓ 
if
 
(
 
application
 
.
  $
PostLogoutRedirectUris
  6
.
6 7
All
7 :
(
: ;
x
; <
=>
= ?
x
@ A
!=
B D
uri
E H
)
H I
)
I J
{
ÒÒ 
application
ÚÚ 
.
ÚÚ  $
PostLogoutRedirectUris
ÚÚ  6
.
ÚÚ6 7
Add
ÚÚ7 :
(
ÚÚ: ;
uri
ÚÚ; >
)
ÚÚ> ?
;
ÚÚ? @
}
ÛÛ 
}
ÙÙ 
}
ıı 	
if
˜˜ 

(
˜˜ 
permissions
˜˜ 
!=
˜˜ 
null
˜˜ 
)
˜˜  
{
¯¯ 	
await
˘˘ #
_permissionDataSeeder
˘˘ '
.
˘˘' (
	SeedAsync
˘˘( 1
(
˘˘1 2+
ClientPermissionValueProvider
˙˙ -
.
˙˙- .
ProviderName
˙˙. :
,
˙˙: ;
name
˚˚ 
,
˚˚ 
permissions
¸¸ 
,
¸¸ 
null
˝˝ 
)
˛˛ 
;
˛˛ 
}
ˇˇ 	
if
ÅÅ 

(
ÅÅ 
client
ÅÅ 
==
ÅÅ 
null
ÅÅ 
)
ÅÅ 
{
ÇÇ 	
await
ÉÉ !
_applicationManager
ÉÉ %
.
ÉÉ% &
CreateAsync
ÉÉ& 1
(
ÉÉ1 2
application
ÉÉ2 =
)
ÉÉ= >
;
ÉÉ> ?
return
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
if
áá 

(
áá 
!
áá !
HasSameRedirectUris
áá  
(
áá  !
client
áá! '
,
áá' (
application
áá) 4
)
áá4 5
)
áá5 6
{
àà 	
client
ââ 
.
ââ 
RedirectUris
ââ 
=
ââ  !
JsonSerializer
ââ" 0
.
ââ0 1
	Serialize
ââ1 :
(
ââ: ;
application
ââ; F
.
ââF G
RedirectUris
ââG S
.
ââS T
Select
ââT Z
(
ââZ [
q
ââ[ \
=>
ââ] _
q
ââ` a
.
ââa b
ToString
ââb j
(
ââj k
)
ââk l
.
ââl m
TrimEnd
ââm t
(
âât u
$char
ââu x
)
ââx y
)
âây z
)
ââz {
;
ââ{ |
client
ää 
.
ää $
PostLogoutRedirectUris
ää )
=
ää* +
JsonSerializer
ää, :
.
ää: ;
	Serialize
ää; D
(
ääD E
application
ääE P
.
ääP Q$
PostLogoutRedirectUris
ääQ g
.
ääg h
Select
ääh n
(
ään o
q
ääo p
=>
ääq s
q
äät u
.
ääu v
ToString
ääv ~
(
ää~ 
)ää Ä
.ääÄ Å
TrimEndääÅ à
(ääà â
$charääâ å
)ääå ç
)ääç é
)ääé è
;ääè ê
await
åå !
_applicationManager
åå %
.
åå% &
UpdateAsync
åå& 1
(
åå1 2
client
åå2 8
.
åå8 9
ToModel
åå9 @
(
åå@ A
)
ååA B
)
ååB C
;
ååC D
}
çç 	
if
èè 

(
èè 
!
èè 
HasSameScopes
èè 
(
èè 
client
èè !
,
èè! "
application
èè# .
)
èè. /
)
èè/ 0
{
êê 	
client
ëë 
.
ëë 
Permissions
ëë 
=
ëë  
JsonSerializer
ëë! /
.
ëë/ 0
	Serialize
ëë0 9
(
ëë9 :
application
ëë: E
.
ëëE F
Permissions
ëëF Q
.
ëëQ R
Select
ëëR X
(
ëëX Y
q
ëëY Z
=>
ëë[ ]
q
ëë^ _
.
ëë_ `
ToString
ëë` h
(
ëëh i
)
ëëi j
)
ëëj k
)
ëëk l
;
ëël m
await
íí !
_applicationManager
íí %
.
íí% &
UpdateAsync
íí& 1
(
íí1 2
client
íí2 8
.
íí8 9
ToModel
íí9 @
(
íí@ A
)
ííA B
)
ííB C
;
ííC D
}
ìì 	
}
îî 
private
ññ 
bool
ññ !
HasSameRedirectUris
ññ $
(
ññ$ %#
OpenIddictApplication
ññ% :
existingClient
ññ; I
,
ññI J&
AbpApplicationDescriptor
ññK c
application
ññd o
)
ñño p
{
óó 
return
òò 
existingClient
òò 
.
òò 
RedirectUris
òò *
==
òò+ -
JsonSerializer
òò. <
.
òò< =
	Serialize
òò= F
(
òòF G
application
òòG R
.
òòR S
RedirectUris
òòS _
.
òò_ `
Select
òò` f
(
òòf g
q
òòg h
=>
òòi k
q
òòl m
.
òòm n
ToString
òòn v
(
òòv w
)
òòw x
.
òòx y
TrimEndòòy Ä
(òòÄ Å
$charòòÅ Ñ
)òòÑ Ö
)òòÖ Ü
)òòÜ á
;òòá à
}
ôô 
private
õõ 
bool
õõ 
HasSameScopes
õõ 
(
õõ #
OpenIddictApplication
õõ 4
existingClient
õõ5 C
,
õõC D&
AbpApplicationDescriptor
õõE ]
application
õõ^ i
)
õõi j
{
úú 
return
ùù 
existingClient
ùù 
.
ùù 
Permissions
ùù )
==
ùù* ,
JsonSerializer
ùù- ;
.
ùù; <
	Serialize
ùù< E
(
ùùE F
application
ùùF Q
.
ùùQ R
Permissions
ùùR ]
.
ùù] ^
Select
ùù^ d
(
ùùd e
q
ùùe f
=>
ùùg i
q
ùùj k
.
ùùk l
ToString
ùùl t
(
ùùt u
)
ùùu v
.
ùùv w
TrimEnd
ùùw ~
(
ùù~ 
$charùù Ç
)ùùÇ É
)ùùÉ Ñ
)ùùÑ Ö
;ùùÖ Ü
}
ûû 
}üü Ä
J/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/Properties/AssemblyInfo.cs
[ 
assembly 	
:	 
'
InternalsVisibleToAttribute
 %
(% &
$str& @
)@ A
]A B
[ 
assembly 	
:	 
'
InternalsVisibleToAttribute
 %
(% &
$str& <
)< =
]= >≥
`/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/Settings/SwaggerDemoSettingDefinitionProvider.cs
	namespace 	
SwaggerDemo
 
. 
Settings 
; 
public 
class 0
$SwaggerDemoSettingDefinitionProvider 1
:2 3%
SettingDefinitionProvider4 M
{ 
public 

override 
void 
Define 
(  %
ISettingDefinitionContext  9
context: A
)A B
{ 
} 
} ß
O/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/Settings/SwaggerDemoSettings.cs
	namespace 	
SwaggerDemo
 
. 
Settings 
; 
public 
static 
class 
SwaggerDemoSettings '
{ 
private 
const 
string 
Prefix 
=  !
$str" /
;/ 0
}		 ¸
D/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/SwaggerDemoConsts.cs
	namespace 	
SwaggerDemo
 
; 
public 
static 
class 
SwaggerDemoConsts %
{ 
public 

const 
string 
DbTablePrefix %
=& '
$str( -
;- .
public 

const 
string 
DbSchema  
=! "
null# '
;' (
} ˜=
J/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain/SwaggerDemoDomainModule.cs
	namespace 	
SwaggerDemo
 
; 
[ 
	DependsOn 

(
 
typeof 

(
 )
SwaggerDemoDomainSharedModule (
)( )
,) *
typeof 

(
 '
AbpAuditLoggingDomainModule &
)& '
,' (
typeof 

(
 )
AbpBackgroundJobsDomainModule (
)( )
,) *
typeof 

(
 ,
 AbpFeatureManagementDomainModule +
)+ ,
,, -
typeof 

(
 #
AbpIdentityDomainModule "
)" #
,# $
typeof 

(
 %
AbpOpenIddictDomainModule $
)$ %
,% &
typeof 

(
 9
-AbpPermissionManagementDomainOpenIddictModule 8
)8 9
,9 :
typeof 

(
 7
+AbpPermissionManagementDomainIdentityModule 6
)6 7
,7 8
typeof 

(
 ,
 AbpSettingManagementDomainModule +
)+ ,
,, -
typeof 

(
 +
AbpTenantManagementDomainModule *
)* +
,+ ,
typeof 

(
 
AbpEmailingModule 
) 
)   
]   
public!! 
class!! #
SwaggerDemoDomainModule!! $
:!!% &
	AbpModule!!' 0
{"" 
public## 

override## 
void## 
ConfigureServices## *
(##* +'
ServiceConfigurationContext##+ F
context##G N
)##N O
{$$ 
	Configure%% 
<%% "
AbpLocalizationOptions%% (
>%%( )
(%%) *
options%%* 1
=>%%2 4
{&& 	
options'' 
.'' 
	Languages'' 
.'' 
Add'' !
(''! "
new''" %
LanguageInfo''& 2
(''2 3
$str''3 7
,''7 8
$str''9 =
,''= >
$str''? H
)''H I
)''I J
;''J K
options(( 
.(( 
	Languages(( 
.(( 
Add(( !
(((! "
new((" %
LanguageInfo((& 2
(((2 3
$str((3 7
,((7 8
$str((9 =
,((= >
$str((? H
)((H I
)((I J
;((J K
options)) 
.)) 
	Languages)) 
.)) 
Add)) !
())! "
new))" %
LanguageInfo))& 2
())2 3
$str))3 7
,))7 8
$str))9 =
,))= >
$str))? H
)))H I
)))I J
;))J K
options** 
.** 
	Languages** 
.** 
Add** !
(**! "
new**" %
LanguageInfo**& 2
(**2 3
$str**3 :
,**: ;
$str**< C
,**C D
$str**E S
)**S T
)**T U
;**U V
options++ 
.++ 
	Languages++ 
.++ 
Add++ !
(++! "
new++" %
LanguageInfo++& 2
(++2 3
$str++3 7
,++7 8
$str++9 =
,++= >
$str++? G
)++G H
)++H I
;++I J
options,, 
.,, 
	Languages,, 
.,, 
Add,, !
(,,! "
new,," %
LanguageInfo,,& 2
(,,2 3
$str,,3 7
,,,7 8
$str,,9 =
,,,= >
$str,,? I
),,I J
),,J K
;,,K L
options-- 
.-- 
	Languages-- 
.-- 
Add-- !
(--! "
new--" %
LanguageInfo--& 2
(--2 3
$str--3 7
,--7 8
$str--9 =
,--= >
$str--? H
)--H I
)--I J
;--J K
options.. 
... 
	Languages.. 
... 
Add.. !
(..! "
new.." %
LanguageInfo..& 2
(..2 3
$str..3 7
,..7 8
$str..9 =
,..= >
$str..? I
)..I J
)..J K
;..K L
options// 
.// 
	Languages// 
.// 
Add// !
(//! "
new//" %
LanguageInfo//& 2
(//2 3
$str//3 7
,//7 8
$str//9 =
,//= >
$str//? F
)//F G
)//G H
;//H I
options00 
.00 
	Languages00 
.00 
Add00 !
(00! "
new00" %
LanguageInfo00& 2
(002 3
$str003 7
,007 8
$str009 =
,00= >
$str00? I
)00I J
)00J K
;00K L
options11 
.11 
	Languages11 
.11 
Add11 !
(11! "
new11" %
LanguageInfo11& 2
(112 3
$str113 :
,11: ;
$str11< C
,11C D
$str11E P
)11P Q
)11Q R
;11R S
options22 
.22 
	Languages22 
.22 
Add22 !
(22! "
new22" %
LanguageInfo22& 2
(222 3
$str223 7
,227 8
$str229 =
,22= >
$str22? H
)22H I
)22I J
;22J K
options33 
.33 
	Languages33 
.33 
Add33 !
(33! "
new33" %
LanguageInfo33& 2
(332 3
$str333 7
,337 8
$str339 =
,33= >
$str33? G
)33G H
)33H I
;33I J
options44 
.44 
	Languages44 
.44 
Add44 !
(44! "
new44" %
LanguageInfo44& 2
(442 3
$str443 7
,447 8
$str449 =
,44= >
$str44? G
)44G H
)44H I
;44I J
options55 
.55 
	Languages55 
.55 
Add55 !
(55! "
new55" %
LanguageInfo55& 2
(552 3
$str553 <
,55< =
$str55> G
,55G H
$str55I O
)55O P
)55P Q
;55Q R
options66 
.66 
	Languages66 
.66 
Add66 !
(66! "
new66" %
LanguageInfo66& 2
(662 3
$str663 <
,66< =
$str66> G
,66G H
$str66I O
)66O P
)66P Q
;66Q R
options77 
.77 
	Languages77 
.77 
Add77 !
(77! "
new77" %
LanguageInfo77& 2
(772 3
$str773 :
,77: ;
$str77< C
,77C D
$str77E N
)77N O
)77O P
;77P Q
options88 
.88 
	Languages88 
.88 
Add88 !
(88! "
new88" %
LanguageInfo88& 2
(882 3
$str883 7
,887 8
$str889 =
,88= >
$str88? H
)88H I
)88I J
;88J K
}99 	
)99	 

;99
 
	Configure;; 
<;; "
AbpMultiTenancyOptions;; (
>;;( )
(;;) *
options;;* 1
=>;;2 4
{<< 	
options== 
.== 
	IsEnabled== 
=== 
MultiTenancyConsts==  2
.==2 3
	IsEnabled==3 <
;==< =
}>> 	
)>>	 

;>>
 
contextAA 
.AA 
ServicesAA 
.AA 
ReplaceAA  
(AA  !
ServiceDescriptorAA! 2
.AA2 3
	SingletonAA3 <
<AA< =
IEmailSenderAA= I
,AAI J
NullEmailSenderAAK Z
>AAZ [
(AA[ \
)AA\ ]
)AA] ^
;AA^ _
}CC 
}DD 