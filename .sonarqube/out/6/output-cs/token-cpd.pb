�
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
} �
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
} �|
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
AdminEmailDefaultValue	hhj �
)
hh� �
.ii 
WithPropertyii 
(ii '
IdentityDataSeedContributorii 5
.ii5 6%
AdminPasswordPropertyNameii6 O
,iiO P'
IdentityDataSeedContributoriiQ l
.iil m&
AdminPasswordDefaultValue	iim �
)
ii� �
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
�� 
true
�� 
;
�� 
}
�� 
else
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 	
Logger
�� 
.
�� 

LogWarning
�� 
(
�� 
$str
�� O
+
��P Q
e
��R S
.
��S T
Message
��T [
)
��[ \
;
��\ ]
return
�� 
false
�� 
;
�� 
}
�� 	
}
�� 
private
�� 
bool
�� '
DbMigrationsProjectExists
�� *
(
��* +
)
��+ ,
{
�� 
var
�� '
dbMigrationsProjectFolder
�� %
=
��& '5
'GetEntityFrameworkCoreProjectFolderPath
��( O
(
��O P
)
��P Q
;
��Q R
return
�� '
dbMigrationsProjectFolder
�� (
!=
��) +
null
��, 0
;
��0 1
}
�� 
private
�� 
bool
�� $
MigrationsFolderExists
�� '
(
��' (
)
��( )
{
�� 
var
�� '
dbMigrationsProjectFolder
�� %
=
��& '5
'GetEntityFrameworkCoreProjectFolderPath
��( O
(
��O P
)
��P Q
;
��Q R
return
�� '
dbMigrationsProjectFolder
�� (
!=
��) +
null
��, 0
&&
��1 3
	Directory
��4 =
.
��= >
Exists
��> D
(
��D E
Path
��E I
.
��I J
Combine
��J Q
(
��Q R'
dbMigrationsProjectFolder
��R k
,
��k l
$str
��m y
)
��y z
)
��z {
;
��{ |
}
�� 
private
�� 
void
�� !
AddInitialMigration
�� $
(
��$ %
)
��% &
{
�� 
Logger
�� 
.
�� 
LogInformation
�� 
(
�� 
$str
�� =
)
��= >
;
��> ?
string
�� 
argumentPrefix
�� 
;
�� 
string
�� 
fileName
�� 
;
�� 
if
�� 

(
��  
RuntimeInformation
�� 
.
�� 
IsOSPlatform
�� +
(
��+ ,

OSPlatform
��, 6
.
��6 7
OSX
��7 :
)
��: ;
||
��< > 
RuntimeInformation
��? Q
.
��Q R
IsOSPlatform
��R ^
(
��^ _

OSPlatform
��_ i
.
��i j
Linux
��j o
)
��o p
)
��p q
{
�� 	
argumentPrefix
�� 
=
�� 
$str
�� !
;
��! "
fileName
�� 
=
�� 
$str
�� "
;
��" #
}
�� 	
else
�� 
{
�� 	
argumentPrefix
�� 
=
�� 
$str
�� !
;
��! "
fileName
�� 
=
�� 
$str
��  
;
��  !
}
�� 	
var
�� 
procStartInfo
�� 
=
�� 
new
�� 
ProcessStartInfo
��  0
(
��0 1
fileName
��1 9
,
��9 :
$"
�� 
{
�� 
argumentPrefix
�� 
}
�� 
$str
�� I
{
��I J5
'GetEntityFrameworkCoreProjectFolderPath
��J q
(
��q r
)
��r s
}
��s t
$str
��t x
"
��x y
)
�� 	
;
��	 

try
�� 
{
�� 	
Process
�� 
.
�� 
Start
�� 
(
�� 
procStartInfo
�� '
)
��' (
;
��( )
}
�� 	
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 	
throw
�� 
new
�� 
	Exception
�� 
(
��  
$str
��  9
)
��9 :
;
��: ;
}
�� 	
}
�� 
private
�� 
string
�� 
?
�� 5
'GetEntityFrameworkCoreProjectFolderPath
�� ;
(
��; <
)
��< =
{
�� 
var
�� 
slnDirectoryPath
�� 
=
�� &
GetSolutionDirectoryPath
�� 7
(
��7 8
)
��8 9
;
��9 :
if
�� 

(
�� 
slnDirectoryPath
�� 
==
�� 
null
��  $
)
��$ %
{
�� 	
throw
�� 
new
�� 
	Exception
�� 
(
��  
$str
��  <
)
��< =
;
��= >
}
�� 	
var
�� 
srcDirectoryPath
�� 
=
�� 
Path
�� #
.
��# $
Combine
��$ +
(
��+ ,
slnDirectoryPath
��, <
,
��< =
$str
��> C
)
��C D
;
��D E
return
�� 
	Directory
�� 
.
�� 
GetDirectories
�� '
(
��' (
srcDirectoryPath
��( 8
)
��8 9
.
�� 
FirstOrDefault
�� 
(
�� 
d
�� 
=>
��  
d
��! "
.
��" #
EndsWith
��# +
(
��+ ,
$str
��, B
)
��B C
)
��C D
;
��D E
}
�� 
private
�� 
string
�� 
?
�� &
GetSolutionDirectoryPath
�� ,
(
��, -
)
��- .
{
�� 
var
�� 
currentDirectory
�� 
=
�� 
new
�� "
DirectoryInfo
��# 0
(
��0 1
	Directory
��1 :
.
��: ;!
GetCurrentDirectory
��; N
(
��N O
)
��O P
)
��P Q
;
��Q R
while
�� 
(
�� 
currentDirectory
�� 
!=
��  "
null
��# '
&&
��( *
	Directory
��+ 4
.
��4 5
	GetParent
��5 >
(
��> ?
currentDirectory
��? O
.
��O P
FullName
��P X
)
��X Y
!=
��Z \
null
��] a
)
��a b
{
�� 	
currentDirectory
�� 
=
�� 
	Directory
�� (
.
��( )
	GetParent
��) 2
(
��2 3
currentDirectory
��3 C
.
��C D
FullName
��D L
)
��L M
;
��M N
if
�� 
(
�� 
currentDirectory
��  
!=
��! #
null
��$ (
&&
��) +
	Directory
��, 5
.
��5 6
GetFiles
��6 >
(
��> ?
currentDirectory
��? O
.
��O P
FullName
��P X
)
��X Y
.
��Y Z
FirstOrDefault
��Z h
(
��h i
f
��i j
=>
��k m
f
��n o
.
��o p
EndsWith
��p x
(
��x y
$str
��y 
)�� �
)��� �
!=��� �
null��� �
)��� �
{
�� 
return
�� 
currentDirectory
�� '
.
��' (
FullName
��( 0
;
��0 1
}
�� 
}
�� 	
return
�� 
null
�� 
;
�� 
}
�� 
}�� ��
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
�� 
;
�� 
}
�� 	
var
�� 
blazorClientId
�� 
=
�� "
configurationSection
�� 1
[
��1 2
$str
��2 O
]
��O P
;
��P Q
if
�� 

(
�� 
!
�� 
blazorClientId
�� 
.
��  
IsNullOrWhiteSpace
�� .
(
��. /
)
��/ 0
)
��0 1
{
�� 	
var
�� 
blazorRootUrl
�� 
=
�� "
configurationSection
��  4
[
��4 5
$str
��5 Q
]
��Q R
?
��R S
.
��S T
TrimEnd
��T [
(
��[ \
$char
��\ _
)
��_ `
;
��` a
await
�� $
CreateApplicationAsync
�� (
(
��( )
name
�� 
:
�� 
blazorClientId
�� $
!
��$ %
,
��% &
type
�� 
:
�� !
OpenIddictConstants
�� )
.
��) *
ClientTypes
��* 5
.
��5 6
Public
��6 <
,
��< =
consentType
�� 
:
�� !
OpenIddictConstants
�� 0
.
��0 1
ConsentTypes
��1 =
.
��= >
Implicit
��> F
,
��F G
displayName
�� 
:
�� 
$str
�� 1
,
��1 2
secret
�� 
:
�� 
null
�� 
,
�� 

grantTypes
�� 
:
�� 
new
�� 
List
��  $
<
��$ %
string
��% +
>
��+ ,
{
��- .!
OpenIddictConstants
��/ B
.
��B C

GrantTypes
��C M
.
��M N
AuthorizationCode
��N _
,
��_ `
}
��a b
,
��b c
scopes
�� 
:
�� 
commonScopes
�� $
,
��$ %
redirectUri
�� 
:
�� 
$"
�� 
{
��  
blazorRootUrl
��  -
}
��- .
$str
��. L
"
��L M
,
��M N
	clientUri
�� 
:
�� 
blazorRootUrl
�� (
,
��( )#
postLogoutRedirectUri
�� %
:
��% &
$"
��' )
{
��) *
blazorRootUrl
��* 7
}
��7 8
$str
��8 W
"
��W X
)
�� 
;
�� 
}
�� 	
var
�� (
blazorServerTieredClientId
�� &
=
��' ("
configurationSection
��) =
[
��= >
$str
��> g
]
��g h
;
��h i
if
�� 

(
�� 
!
�� (
blazorServerTieredClientId
�� '
.
��' ( 
IsNullOrWhiteSpace
��( :
(
��: ;
)
��; <
)
��< =
{
�� 	
var
�� '
blazorServerTieredRootUrl
�� )
=
��* +"
configurationSection
�� $
[
��$ %
$str
��% M
]
��M N
.
��N O
EnsureEndsWith
��O ]
(
��] ^
$char
��^ a
)
��a b
;
��b c
await
�� $
CreateApplicationAsync
�� (
(
��( )
name
�� 
:
�� (
blazorServerTieredClientId
�� 0
!
��0 1
,
��1 2
type
�� 
:
�� !
OpenIddictConstants
�� )
.
��) *
ClientTypes
��* 5
.
��5 6
Confidential
��6 B
,
��B C
consentType
�� 
:
�� !
OpenIddictConstants
�� 0
.
��0 1
ConsentTypes
��1 =
.
��= >
Implicit
��> F
,
��F G
displayName
�� 
:
�� 
$str
�� 8
,
��8 9
secret
�� 
:
�� "
configurationSection
�� ,
[
��, -
$str
��- Z
]
��Z [
??
��\ ^
$str
��_ h
,
��h i

grantTypes
�� 
:
�� 
new
�� 
List
��  $
<
��$ %
string
��% +
>
��+ ,
{
�� !
OpenIddictConstants
�� '
.
��' (

GrantTypes
��( 2
.
��2 3
AuthorizationCode
��3 D
,
��D E!
OpenIddictConstants
��F Y
.
��Y Z

GrantTypes
��Z d
.
��d e
Implicit
��e m
}
�� 
,
�� 
scopes
�� 
:
�� 
commonScopes
�� $
,
��$ %
redirectUri
�� 
:
�� 
$"
�� 
{
��  '
blazorServerTieredRootUrl
��  9
}
��9 :
$str
��: E
"
��E F
,
��F G
	clientUri
�� 
:
�� '
blazorServerTieredRootUrl
�� 4
,
��4 5#
postLogoutRedirectUri
�� %
:
��% &
$"
��' )
{
��) *'
blazorServerTieredRootUrl
��* C
}
��C D
$str
��D Y
"
��Y Z
)
�� 
;
�� 
}
�� 	
var
�� 
swaggerClientId
�� 
=
�� "
configurationSection
�� 2
[
��2 3
$str
��3 Q
]
��Q R
;
��R S
if
�� 

(
�� 
!
�� 
swaggerClientId
�� 
.
��  
IsNullOrWhiteSpace
�� /
(
��/ 0
)
��0 1
)
��1 2
{
�� 	
var
�� 
swaggerRootUrl
�� 
=
��  "
configurationSection
��! 5
[
��5 6
$str
��6 S
]
��S T
?
��T U
.
��U V
TrimEnd
��V ]
(
��] ^
$char
��^ a
)
��a b
;
��b c
await
�� $
CreateApplicationAsync
�� (
(
��( )
name
�� 
:
�� 
swaggerClientId
�� %
!
��% &
,
��& '
type
�� 
:
�� !
OpenIddictConstants
�� )
.
��) *
ClientTypes
��* 5
.
��5 6
Public
��6 <
,
��< =
consentType
�� 
:
�� !
OpenIddictConstants
�� 0
.
��0 1
ConsentTypes
��1 =
.
��= >
Implicit
��> F
,
��F G
displayName
�� 
:
�� 
$str
�� 2
,
��2 3
secret
�� 
:
�� 
null
�� 
,
�� 

grantTypes
�� 
:
�� 
new
�� 
List
��  $
<
��$ %
string
��% +
>
��+ ,
{
��- .!
OpenIddictConstants
��/ B
.
��B C

GrantTypes
��C M
.
��M N
AuthorizationCode
��N _
,
��_ `
}
��a b
,
��b c
scopes
�� 
:
�� 
commonScopes
�� $
,
��$ %
redirectUri
�� 
:
�� 
$"
�� 
{
��  
swaggerRootUrl
��  .
}
��. /
$str
��/ L
"
��L M
,
��M N
	clientUri
�� 
:
�� 
swaggerRootUrl
�� )
)
�� 
;
�� 
}
�� 	
}
�� 
private
�� 
async
�� 
Task
�� $
CreateApplicationAsync
�� -
(
��- .
[
�� 	
NotNull
��	 
]
�� 
string
�� 
name
�� 
,
�� 
[
�� 	
NotNull
��	 
]
�� 
string
�� 
type
�� 
,
�� 
[
�� 	
NotNull
��	 
]
�� 
string
�� 
consentType
�� $
,
��$ %
string
�� 
displayName
�� 
,
�� 
string
�� 
?
�� 
secret
�� 
,
�� 
List
�� 
<
�� 
string
�� 
>
�� 

grantTypes
�� 
,
��  
List
�� 
<
�� 
string
�� 
>
�� 
scopes
�� 
,
�� 
string
�� 
?
�� 
	clientUri
�� 
=
�� 
null
��  
,
��  !
string
�� 
?
�� 
redirectUri
�� 
=
�� 
null
�� "
,
��" #
string
�� 
?
�� #
postLogoutRedirectUri
�� %
=
��& '
null
��( ,
,
��, -
List
�� 
<
�� 
string
�� 
>
�� 
?
�� 
permissions
�� !
=
��" #
null
��$ (
)
��( )
{
�� 
if
�� 

(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� !
(
��! "
secret
��" (
)
��( )
&&
��* ,
string
��- 3
.
��3 4
Equals
��4 :
(
��: ;
type
��; ?
,
��? @!
OpenIddictConstants
��A T
.
��T U
ClientTypes
��U `
.
��` a
Public
��a g
,
��g h
StringComparison
��  
.
��  !
OrdinalIgnoreCase
��! 2
)
��2 3
)
��3 4
{
�� 	
throw
�� 
new
�� 
BusinessException
�� '
(
��' (
L
��( )
[
��) *
$str
��* W
]
��W X
)
��X Y
;
��Y Z
}
�� 	
if
�� 

(
�� 
string
�� 
.
�� 
IsNullOrEmpty
��  
(
��  !
secret
��! '
)
��' (
&&
��) +
string
��, 2
.
��2 3
Equals
��3 9
(
��9 :
type
��: >
,
��> ?!
OpenIddictConstants
��@ S
.
��S T
ClientTypes
��T _
.
��_ `
Confidential
��` l
,
��l m
StringComparison
��  
.
��  !
OrdinalIgnoreCase
��! 2
)
��2 3
)
��3 4
{
�� 	
throw
�� 
new
�� 
BusinessException
�� '
(
��' (
L
��( )
[
��) *
$str
��* `
]
��` a
)
��a b
;
��b c
}
�� 	
var
�� 
client
�� 
=
�� 
await
�� .
 _openIddictApplicationRepository
�� ;
.
��; <!
FindByClientIdAsync
��< O
(
��O P
name
��P T
)
��T U
;
��U V
var
�� 
application
�� 
=
�� 
new
�� &
AbpApplicationDescriptor
�� 6
{
��7 8
ClientId
�� 
=
�� 
name
�� 
,
�� 

ClientType
�� 
=
�� 
type
�� 
,
�� 
ClientSecret
�� 
=
�� 
secret
�� !
,
��! "
ConsentType
�� 
=
�� 
consentType
�� %
,
��% &
DisplayName
�� 
=
�� 
displayName
�� %
,
��% &
	ClientUri
�� 
=
�� 
	clientUri
�� !
,
��! "
}
�� 	
;
��	 

Check
�� 
.
�� 
NotNullOrEmpty
�� 
(
�� 

grantTypes
�� '
,
��' (
nameof
��) /
(
��/ 0

grantTypes
��0 :
)
��: ;
)
��; <
;
��< =
Check
�� 
.
�� 
NotNullOrEmpty
�� 
(
�� 
scopes
�� #
,
��# $
nameof
��% +
(
��+ ,
scopes
��, 2
)
��2 3
)
��3 4
;
��4 5
if
�� 

(
�� 
new
�� 
[
�� 
]
�� 
{
�� !
OpenIddictConstants
�� '
.
��' (

GrantTypes
��( 2
.
��2 3
AuthorizationCode
��3 D
,
��D E!
OpenIddictConstants
��F Y
.
��Y Z

GrantTypes
��Z d
.
��d e
Implicit
��e m
}
��n o
.
��o p
All
��p s
(
��s t

grantTypes
�� 
.
�� 
Contains
�� #
)
��# $
)
��$ %
{
�� 	
application
�� 
.
�� 
Permissions
�� #
.
��# $
Add
��$ '
(
��' (!
OpenIddictConstants
��( ;
.
��; <
Permissions
��< G
.
��G H
ResponseTypes
��H U
.
��U V
CodeIdToken
��V a
)
��a b
;
��b c
if
�� 
(
�� 
string
�� 
.
�� 
Equals
�� 
(
�� 
type
�� "
,
��" #!
OpenIddictConstants
��$ 7
.
��7 8
ClientTypes
��8 C
.
��C D
Public
��D J
,
��J K
StringComparison
��L \
.
��\ ]
OrdinalIgnoreCase
��] n
)
��n o
)
��o p
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
CodeIdTokenToken
��Z j
)
��j k
;
��k l
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
	CodeToken
��Z c
)
��c d
;
��d e
}
�� 
}
�� 	
if
�� 

(
�� 
!
�� 
redirectUri
�� 
.
��  
IsNullOrWhiteSpace
�� +
(
��+ ,
)
��, -
||
��. 0
!
��1 2#
postLogoutRedirectUri
��2 G
.
��G H 
IsNullOrWhiteSpace
��H Z
(
��Z [
)
��[ \
)
��\ ]
{
�� 	
application
�� 
.
�� 
Permissions
�� #
.
��# $
Add
��$ '
(
��' (!
OpenIddictConstants
��( ;
.
��; <
Permissions
��< G
.
��G H
	Endpoints
��H Q
.
��Q R
Logout
��R X
)
��X Y
;
��Y Z
}
�� 	
var
�� 
buildInGrantTypes
�� 
=
�� 
new
��  #
[
��# $
]
��$ %
{
��& '!
OpenIddictConstants
�� 
.
��  

GrantTypes
��  *
.
��* +
Implicit
��+ 3
,
��3 4!
OpenIddictConstants
��5 H
.
��H I

GrantTypes
��I S
.
��S T
Password
��T \
,
��\ ]!
OpenIddictConstants
�� 
.
��  

GrantTypes
��  *
.
��* +
AuthorizationCode
��+ <
,
��< =!
OpenIddictConstants
��> Q
.
��Q R

GrantTypes
��R \
.
��\ ]
ClientCredentials
��] n
,
��n o!
OpenIddictConstants
�� 
.
��  

GrantTypes
��  *
.
��* +

DeviceCode
��+ 5
,
��5 6!
OpenIddictConstants
��7 J
.
��J K

GrantTypes
��K U
.
��U V
RefreshToken
��V b
}
�� 	
;
��	 

foreach
�� 
(
�� 
var
�� 
	grantType
�� 
in
�� !

grantTypes
��" ,
)
��, -
{
�� 	
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
AuthorizationCode
��< M
)
��M N
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
AuthorizationCode
��W h
)
��h i
;
��i j
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
Code
��Z ^
)
��^ _
;
��_ `
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
AuthorizationCode
��< M
||
��N P
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Implicit
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V
Authorization
��V c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
AuthorizationCode
��< M
||
��N P
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
ClientCredentials
��< M
||
��N P
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Password
��< D
||
��E G
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
RefreshToken
��< H
||
��I K
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <

DeviceCode
��< F
)
��F G
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V
Token
��V [
)
��[ \
;
��\ ]
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V

Revocation
��V `
)
��` a
;
��a b
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V
Introspection
��V c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
ClientCredentials
��< M
)
��M N
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
ClientCredentials
��W h
)
��h i
;
��i j
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Implicit
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
Implicit
��W _
)
��_ `
;
��` a
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Password
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
Password
��W _
)
��_ `
;
��` a
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
RefreshToken
��< H
)
��H I
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W
RefreshToken
��W c
)
��c d
;
��d e
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <

DeviceCode
��< F
)
��F G
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L

GrantTypes
��L V
.
��V W

DeviceCode
��W a
)
��a b
;
��b c
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
	Endpoints
��L U
.
��U V
Device
��V \
)
��\ ]
;
��] ^
}
�� 
if
�� 
(
�� 
	grantType
�� 
==
�� !
OpenIddictConstants
�� 0
.
��0 1

GrantTypes
��1 ;
.
��; <
Implicit
��< D
)
��D E
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
ResponseTypes
��L Y
.
��Y Z
IdToken
��Z a
)
��a b
;
��b c
if
�� 
(
�� 
string
�� 
.
�� 
Equals
�� !
(
��! "
type
��" &
,
��& '!
OpenIddictConstants
��( ;
.
��; <
ClientTypes
��< G
.
��G H
Public
��H N
,
��N O
StringComparison
��P `
.
��` a
OrdinalIgnoreCase
��a r
)
��r s
)
��s t
{
�� 
application
�� 
.
��  
Permissions
��  +
.
��+ ,
Add
��, /
(
��/ 0!
OpenIddictConstants
��0 C
.
��C D
Permissions
��D O
.
��O P
ResponseTypes
��P ]
.
��] ^
IdTokenToken
��^ j
)
��j k
;
��k l
application
�� 
.
��  
Permissions
��  +
.
��+ ,
Add
��, /
(
��/ 0!
OpenIddictConstants
��0 C
.
��C D
Permissions
��D O
.
��O P
ResponseTypes
��P ]
.
��] ^
Token
��^ c
)
��c d
;
��d e
}
�� 
}
�� 
if
�� 
(
�� 
!
�� 
buildInGrantTypes
�� "
.
��" #
Contains
��# +
(
��+ ,
	grantType
��, 5
)
��5 6
)
��6 7
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
Prefixes
��L T
.
��T U
	GrantType
��U ^
+
��_ `
	grantType
��a j
)
��j k
;
��k l
}
�� 
}
�� 	
var
�� 
buildInScopes
�� 
=
�� 
new
�� 
[
��  
]
��  !
{
��" #!
OpenIddictConstants
�� 
.
��  
Permissions
��  +
.
��+ ,
Scopes
��, 2
.
��2 3
Address
��3 :
,
��: ;!
OpenIddictConstants
��< O
.
��O P
Permissions
��P [
.
��[ \
Scopes
��\ b
.
��b c
Email
��c h
,
��h i!
OpenIddictConstants
�� 
.
��  
Permissions
��  +
.
��+ ,
Scopes
��, 2
.
��2 3
Phone
��3 8
,
��8 9!
OpenIddictConstants
��: M
.
��M N
Permissions
��N Y
.
��Y Z
Scopes
��Z `
.
��` a
Profile
��a h
,
��h i!
OpenIddictConstants
�� 
.
��  
Permissions
��  +
.
��+ ,
Scopes
��, 2
.
��2 3
Roles
��3 8
}
�� 	
;
��	 

foreach
�� 
(
�� 
var
�� 
scope
�� 
in
�� 
scopes
�� $
)
��$ %
{
�� 	
if
�� 
(
�� 
buildInScopes
�� 
.
�� 
Contains
�� &
(
��& '
scope
��' ,
)
��, -
)
��- .
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,
scope
��, 1
)
��1 2
;
��2 3
}
�� 
else
�� 
{
�� 
application
�� 
.
�� 
Permissions
�� '
.
��' (
Add
��( +
(
��+ ,!
OpenIddictConstants
��, ?
.
��? @
Permissions
��@ K
.
��K L
Prefixes
��L T
.
��T U
Scope
��U Z
+
��[ \
scope
��] b
)
��b c
;
��c d
}
�� 
}
�� 	
if
�� 

(
�� 
redirectUri
�� 
!=
�� 
null
�� 
)
��  
{
�� 	
if
�� 
(
�� 
!
�� 
redirectUri
�� 
.
�� 
IsNullOrEmpty
�� *
(
��* +
)
��+ ,
)
��, -
{
�� 
if
�� 
(
�� 
!
�� 
Uri
�� 
.
�� 
	TryCreate
�� "
(
��" #
redirectUri
��# .
,
��. /
UriKind
��0 7
.
��7 8
Absolute
��8 @
,
��@ A
out
��B E
var
��F I
uri
��J M
)
��M N
||
��O Q
!
��R S
uri
��S V
.
��V W(
IsWellFormedOriginalString
��W q
(
��q r
)
��r s
)
��s t
{
�� 
throw
�� 
new
�� 
BusinessException
�� /
(
��/ 0
L
��0 1
[
��1 2
$str
��2 F
,
��F G
redirectUri
��H S
]
��S T
)
��T U
;
��U V
}
�� 
if
�� 
(
�� 
application
�� 
.
��  
RedirectUris
��  ,
.
��, -
All
��- 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
!=
��8 :
uri
��; >
)
��> ?
)
��? @
{
�� 
application
�� 
.
��  
RedirectUris
��  ,
.
��, -
Add
��- 0
(
��0 1
uri
��1 4
)
��4 5
;
��5 6
}
�� 
}
�� 
}
�� 	
if
�� 

(
�� #
postLogoutRedirectUri
�� !
!=
��" $
null
��% )
)
��) *
{
�� 	
if
�� 
(
�� 
!
�� #
postLogoutRedirectUri
�� &
.
��& '
IsNullOrEmpty
��' 4
(
��4 5
)
��5 6
)
��6 7
{
�� 
if
�� 
(
�� 
!
�� 
Uri
�� 
.
�� 
	TryCreate
�� "
(
��" ##
postLogoutRedirectUri
��# 8
,
��8 9
UriKind
��: A
.
��A B
Absolute
��B J
,
��J K
out
��L O
var
��P S
uri
��T W
)
��W X
||
��Y [
!
�� 
uri
�� 
.
�� (
IsWellFormedOriginalString
�� 3
(
��3 4
)
��4 5
)
��5 6
{
�� 
throw
�� 
new
�� 
BusinessException
�� /
(
��/ 0
L
��0 1
[
��1 2
$str
��2 P
,
��P Q#
postLogoutRedirectUri
��R g
]
��g h
)
��h i
;
��i j
}
�� 
if
�� 
(
�� 
application
�� 
.
��  $
PostLogoutRedirectUris
��  6
.
��6 7
All
��7 :
(
��: ;
x
��; <
=>
��= ?
x
��@ A
!=
��B D
uri
��E H
)
��H I
)
��I J
{
�� 
application
�� 
.
��  $
PostLogoutRedirectUris
��  6
.
��6 7
Add
��7 :
(
��: ;
uri
��; >
)
��> ?
;
��? @
}
�� 
}
�� 
}
�� 	
if
�� 

(
�� 
permissions
�� 
!=
�� 
null
�� 
)
��  
{
�� 	
await
�� #
_permissionDataSeeder
�� '
.
��' (
	SeedAsync
��( 1
(
��1 2+
ClientPermissionValueProvider
�� -
.
��- .
ProviderName
��. :
,
��: ;
name
�� 
,
�� 
permissions
�� 
,
�� 
null
�� 
)
�� 
;
�� 
}
�� 	
if
�� 

(
�� 
client
�� 
==
�� 
null
�� 
)
�� 
{
�� 	
await
�� !
_applicationManager
�� %
.
��% &
CreateAsync
��& 1
(
��1 2
application
��2 =
)
��= >
;
��> ?
return
�� 
;
�� 
}
�� 	
if
�� 

(
�� 
!
�� !
HasSameRedirectUris
��  
(
��  !
client
��! '
,
��' (
application
��) 4
)
��4 5
)
��5 6
{
�� 	
client
�� 
.
�� 
RedirectUris
�� 
=
��  !
JsonSerializer
��" 0
.
��0 1
	Serialize
��1 :
(
��: ;
application
��; F
.
��F G
RedirectUris
��G S
.
��S T
Select
��T Z
(
��Z [
q
��[ \
=>
��] _
q
��` a
.
��a b
ToString
��b j
(
��j k
)
��k l
.
��l m
TrimEnd
��m t
(
��t u
$char
��u x
)
��x y
)
��y z
)
��z {
;
��{ |
client
�� 
.
�� $
PostLogoutRedirectUris
�� )
=
��* +
JsonSerializer
��, :
.
��: ;
	Serialize
��; D
(
��D E
application
��E P
.
��P Q$
PostLogoutRedirectUris
��Q g
.
��g h
Select
��h n
(
��n o
q
��o p
=>
��q s
q
��t u
.
��u v
ToString
��v ~
(
��~ 
)�� �
.��� �
TrimEnd��� �
(��� �
$char��� �
)��� �
)��� �
)��� �
;��� �
await
�� !
_applicationManager
�� %
.
��% &
UpdateAsync
��& 1
(
��1 2
client
��2 8
.
��8 9
ToModel
��9 @
(
��@ A
)
��A B
)
��B C
;
��C D
}
�� 	
if
�� 

(
�� 
!
�� 
HasSameScopes
�� 
(
�� 
client
�� !
,
��! "
application
��# .
)
��. /
)
��/ 0
{
�� 	
client
�� 
.
�� 
Permissions
�� 
=
��  
JsonSerializer
��! /
.
��/ 0
	Serialize
��0 9
(
��9 :
application
��: E
.
��E F
Permissions
��F Q
.
��Q R
Select
��R X
(
��X Y
q
��Y Z
=>
��[ ]
q
��^ _
.
��_ `
ToString
��` h
(
��h i
)
��i j
)
��j k
)
��k l
;
��l m
await
�� !
_applicationManager
�� %
.
��% &
UpdateAsync
��& 1
(
��1 2
client
��2 8
.
��8 9
ToModel
��9 @
(
��@ A
)
��A B
)
��B C
;
��C D
}
�� 	
}
�� 
private
�� 
bool
�� !
HasSameRedirectUris
�� $
(
��$ %#
OpenIddictApplication
��% :
existingClient
��; I
,
��I J&
AbpApplicationDescriptor
��K c
application
��d o
)
��o p
{
�� 
return
�� 
existingClient
�� 
.
�� 
RedirectUris
�� *
==
��+ -
JsonSerializer
��. <
.
��< =
	Serialize
��= F
(
��F G
application
��G R
.
��R S
RedirectUris
��S _
.
��_ `
Select
��` f
(
��f g
q
��g h
=>
��i k
q
��l m
.
��m n
ToString
��n v
(
��v w
)
��w x
.
��x y
TrimEnd��y �
(��� �
$char��� �
)��� �
)��� �
)��� �
;��� �
}
�� 
private
�� 
bool
�� 
HasSameScopes
�� 
(
�� #
OpenIddictApplication
�� 4
existingClient
��5 C
,
��C D&
AbpApplicationDescriptor
��E ]
application
��^ i
)
��i j
{
�� 
return
�� 
existingClient
�� 
.
�� 
Permissions
�� )
==
��* ,
JsonSerializer
��- ;
.
��; <
	Serialize
��< E
(
��E F
application
��F Q
.
��Q R
Permissions
��R ]
.
��] ^
Select
��^ d
(
��d e
q
��e f
=>
��g i
q
��j k
.
��k l
ToString
��l t
(
��t u
)
��u v
.
��v w
TrimEnd
��w ~
(
��~ 
$char�� �
)��� �
)��� �
)��� �
;��� �
}
�� 
}�� �
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
]= >�
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
} �
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
}		 �
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
} �=
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