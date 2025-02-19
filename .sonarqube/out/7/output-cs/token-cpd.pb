µ

Ç/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/EntityFrameworkCore/EntityFrameworkCoreSwaggerDemoDbSchemaMigrator.cs
	namespace 	
SwaggerDemo
 
. 
EntityFrameworkCore )
;) *
public

 
class

 :
.EntityFrameworkCoreSwaggerDemoDbSchemaMigrator

 ;
: (
ISwaggerDemoDbSchemaMigrator "
," # 
ITransientDependency$ 8
{ 
private 
readonly 
IServiceProvider %
_serviceProvider& 6
;6 7
public 
:
.EntityFrameworkCoreSwaggerDemoDbSchemaMigrator 9
(9 :
IServiceProvider 
serviceProvider (
)( )
{ 
_serviceProvider 
= 
serviceProvider *
;* +
} 
public 

async 
Task 
MigrateAsync "
(" #
)# $
{ 
await 
_serviceProvider 
. 
GetRequiredService 
<   
SwaggerDemoDbContext  4
>4 5
(5 6
)6 7
. 
Database 
.   
MigrateAsync   
(   
)   
;   
}!! 
}"" Ö%
h/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/EntityFrameworkCore/SwaggerDemoDbContext.cs
	namespace 	
SwaggerDemo
 
. 
EntityFrameworkCore )
;) *
[ 
ReplaceDbContext 
( 
typeof 
( 
IIdentityDbContext +
)+ ,
), -
]- .
[ 
ReplaceDbContext 
( 
typeof 
( &
ITenantManagementDbContext 3
)3 4
)4 5
]5 6
[  
ConnectionStringName 
( 
$str 
)  
]  !
public 
class  
SwaggerDemoDbContext !
:" #
AbpDbContext 
<  
SwaggerDemoDbContext %
>% &
,& '
IIdentityDbContext 
, &
ITenantManagementDbContext 
{ 
public** 

DbSet** 
<** 
IdentityUser** 
>** 
Users** $
{**% &
get**' *
;*** +
set**, /
;**/ 0
}**1 2
public++ 

DbSet++ 
<++ 
IdentityRole++ 
>++ 
Roles++ $
{++% &
get++' *
;++* +
set++, /
;++/ 0
}++1 2
public,, 

DbSet,, 
<,, 
IdentityClaimType,, "
>,," #

ClaimTypes,,$ .
{,,/ 0
get,,1 4
;,,4 5
set,,6 9
;,,9 :
},,; <
public-- 

DbSet-- 
<-- 
OrganizationUnit-- !
>--! "
OrganizationUnits--# 4
{--5 6
get--7 :
;--: ;
set--< ?
;--? @
}--A B
public.. 

DbSet.. 
<.. 
IdentitySecurityLog.. $
>..$ %
SecurityLogs..& 2
{..3 4
get..5 8
;..8 9
set..: =
;..= >
}..? @
public// 

DbSet// 
<// 
IdentityLinkUser// !
>//! "
	LinkUsers//# ,
{//- .
get/// 2
;//2 3
set//4 7
;//7 8
}//9 :
public00 

DbSet00 
<00 "
IdentityUserDelegation00 '
>00' (
UserDelegations00) 8
{009 :
get00; >
;00> ?
set00@ C
;00C D
}00E F
public11 

DbSet11 
<11 
IdentitySession11  
>11  !
Sessions11" *
{11+ ,
get11- 0
;110 1
set112 5
;115 6
}117 8
public33 

DbSet33 
<33 
Tenant33 
>33 
Tenants33  
{33! "
get33# &
;33& '
set33( +
;33+ ,
}33- .
public44 

DbSet44 
<44 "
TenantConnectionString44 '
>44' (#
TenantConnectionStrings44) @
{44A B
get44C F
;44F G
set44H K
;44K L
}44M N
public88 
 
SwaggerDemoDbContext88 
(88  
DbContextOptions88  0
<880 1 
SwaggerDemoDbContext881 E
>88E F
options88G N
)88N O
:99 	
base99
 
(99 
options99 
)99 
{:: 
}<< 
	protected>> 
override>> 
void>> 
OnModelCreating>> +
(>>+ ,
ModelBuilder>>, 8
builder>>9 @
)>>@ A
{?? 
base@@ 
.@@ 
OnModelCreating@@ 
(@@ 
builder@@ $
)@@$ %
;@@% &
builderDD 
.DD )
ConfigurePermissionManagementDD -
(DD- .
)DD. /
;DD/ 0
builderEE 
.EE &
ConfigureSettingManagementEE *
(EE* +
)EE+ ,
;EE, -
builderFF 
.FF #
ConfigureBackgroundJobsFF '
(FF' (
)FF( )
;FF) *
builderGG 
.GG !
ConfigureAuditLoggingGG %
(GG% &
)GG& '
;GG' (
builderHH 
.HH 
ConfigureIdentityHH !
(HH! "
)HH" #
;HH# $
builderII 
.II 
ConfigureOpenIddictII #
(II# $
)II$ %
;II% &
builderJJ 
.JJ &
ConfigureFeatureManagementJJ *
(JJ* +
)JJ+ ,
;JJ, -
builderKK 
.KK %
ConfigureTenantManagementKK )
(KK) *
)KK* +
;KK+ ,
}UU 
}VV ⁄
o/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/EntityFrameworkCore/SwaggerDemoDbContextFactory.cs
	namespace 	
SwaggerDemo
 
. 
EntityFrameworkCore )
;) *
public 
class '
SwaggerDemoDbContextFactory (
:) *'
IDesignTimeDbContextFactory+ F
<F G 
SwaggerDemoDbContextG [
>[ \
{ 
public 
 
SwaggerDemoDbContext 
CreateDbContext  /
(/ 0
string0 6
[6 7
]7 8
args9 =
)= >
{ 4
(SwaggerDemoEfCoreEntityExtensionMappings 0
.0 1
	Configure1 :
(: ;
); <
;< =
var 
configuration 
= 
BuildConfiguration .
(. /
)/ 0
;0 1
var 
builder 
= 
new #
DbContextOptionsBuilder 1
<1 2 
SwaggerDemoDbContext2 F
>F G
(G H
)H I
. 
UseSqlServer 
( 
configuration '
.' (
GetConnectionString( ;
(; <
$str< E
)E F
)F G
;G H
return 
new  
SwaggerDemoDbContext '
(' (
builder( /
./ 0
Options0 7
)7 8
;8 9
} 
private 
static 
IConfigurationRoot %
BuildConfiguration& 8
(8 9
)9 :
{ 
var 
builder 
= 
new  
ConfigurationBuilder .
(. /
)/ 0
. 
SetBasePath 
( 
Path 
. 
Combine %
(% &
	Directory& /
./ 0
GetCurrentDirectory0 C
(C D
)D E
,E F
$strG c
)c d
)d e
. 
AddJsonFile 
( 
$str +
,+ ,
optional- 5
:5 6
false7 <
)< =
;= >
return 
builder 
. 
Build 
( 
) 
; 
}   
}!! û	
|/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/EntityFrameworkCore/SwaggerDemoEfCoreEntityExtensionMappings.cs
	namespace 	
SwaggerDemo
 
. 
EntityFrameworkCore )
;) *
public 
static 
class 4
(SwaggerDemoEfCoreEntityExtensionMappings <
{		 
private

 
static

 
readonly

 
OneTimeRunner

 )
OneTimeRunner

* 7
=

8 9
new

: =
OneTimeRunner

> K
(

K L
)

L M
;

M N
public 

static 
void 
	Configure  
(  !
)! "
{ 0
$SwaggerDemoGlobalFeatureConfigurator ,
., -
	Configure- 6
(6 7
)7 8
;8 92
&SwaggerDemoModuleExtensionConfigurator .
.. /
	Configure/ 8
(8 9
)9 :
;: ;
OneTimeRunner 
. 
Run 
( 
( 
) 
=> 
{ 	
}** 	
)**	 

;**
 
}++ 
},, ó
x/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/EntityFrameworkCore/SwaggerDemoEntityFrameworkCoreModule.cs
	namespace 	
SwaggerDemo
 
. 
EntityFrameworkCore )
;) *
[ 
	DependsOn 

(
 
typeof 

(
 #
SwaggerDemoDomainModule "
)" #
,# $
typeof 

(
 0
$AbpIdentityEntityFrameworkCoreModule /
)/ 0
,0 1
typeof 

(
 2
&AbpOpenIddictEntityFrameworkCoreModule 1
)1 2
,2 3
typeof 

(
 <
0AbpPermissionManagementEntityFrameworkCoreModule ;
); <
,< =
typeof 

(
 9
-AbpSettingManagementEntityFrameworkCoreModule 8
)8 9
,9 :
typeof 

(
 1
%AbpEntityFrameworkCoreSqlServerModule 0
)0 1
,1 2
typeof 

(
 6
*AbpBackgroundJobsEntityFrameworkCoreModule 5
)5 6
,6 7
typeof 

(
 4
(AbpAuditLoggingEntityFrameworkCoreModule 3
)3 4
,4 5
typeof 

(
 8
,AbpTenantManagementEntityFrameworkCoreModule 7
)7 8
,8 9
typeof 

(
 9
-AbpFeatureManagementEntityFrameworkCoreModule 8
)8 9
) 
] 
public 
class 0
$SwaggerDemoEntityFrameworkCoreModule 1
:2 3
	AbpModule4 =
{ 
public   

override   
void    
PreConfigureServices   -
(  - .'
ServiceConfigurationContext  . I
context  J Q
)  Q R
{!! 4
(SwaggerDemoEfCoreEntityExtensionMappings"" 0
.""0 1
	Configure""1 :
("": ;
)""; <
;""< =
}## 
public%% 

override%% 
void%% 
ConfigureServices%% *
(%%* +'
ServiceConfigurationContext%%+ F
context%%G N
)%%N O
{&& 
context'' 
.'' 
Services'' 
.'' 
AddAbpDbContext'' (
<''( ) 
SwaggerDemoDbContext'') =
>''= >
(''> ?
options''? F
=>''G I
{(( 	
options++ 
.++ "
AddDefaultRepositories++ *
(++* +
includeAllEntities+++ =
:++= >
true++? C
)++C D
;++D E
},, 	
),,	 

;,,
 
	Configure.. 
<.. 
AbpDbContextOptions.. %
>..% &
(..& '
options..' .
=>../ 1
{// 	
options22 
.22 
UseSqlServer22  
(22  !
)22! "
;22" #
}33 	
)33	 

;33
 
}55 
}66 ˜Ã
a/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/Migrations/20240912065503_Initial.cs
	namespace 	
SwaggerDemo
 
. 

Migrations  
{ 
public		 

partial		 
class		 
Initial		  
:		! "
	Migration		# ,
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str $
,$ %
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
ApplicationName #
=$ %
table& +
.+ ,
Column, 2
<2 3
string3 9
>9 :
(: ;
type; ?
:? @
$strA O
,O P
	maxLengthQ Z
:Z [
$num\ ^
,^ _
nullable` h
:h i
truej n
)n o
,o p
UserId 
= 
table "
." #
Column# )
<) *
Guid* .
>. /
(/ 0
type0 4
:4 5
$str6 H
,H I
nullableJ R
:R S
trueT X
)X Y
,Y Z
UserName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
	maxLengthK T
:T U
$numV Y
,Y Z
nullable[ c
:c d
truee i
)i j
,j k
TenantId 
= 
table $
.$ %
Column% +
<+ ,
Guid, 0
>0 1
(1 2
type2 6
:6 7
$str8 J
,J K
nullableL T
:T U
trueV Z
)Z [
,[ \

TenantName 
=  
table! &
.& '
Column' -
<- .
string. 4
>4 5
(5 6
type6 :
:: ;
$str< J
,J K
	maxLengthL U
:U V
$numW Y
,Y Z
nullable[ c
:c d
truee i
)i j
,j k
ImpersonatorUserId &
=' (
table) .
.. /
Column/ 5
<5 6
Guid6 :
>: ;
(; <
type< @
:@ A
$strB T
,T U
nullableV ^
:^ _
true` d
)d e
,e f 
ImpersonatorUserName (
=) *
table+ 0
.0 1
Column1 7
<7 8
string8 >
>> ?
(? @
type@ D
:D E
$strF U
,U V
	maxLengthW `
:` a
$numb e
,e f
nullableg o
:o p
trueq u
)u v
,v w 
ImpersonatorTenantId (
=) *
table+ 0
.0 1
Column1 7
<7 8
Guid8 <
>< =
(= >
type> B
:B C
$strD V
,V W
nullableX `
:` a
trueb f
)f g
,g h"
ImpersonatorTenantName *
=+ ,
table- 2
.2 3
Column3 9
<9 :
string: @
>@ A
(A B
typeB F
:F G
$strH V
,V W
	maxLengthX a
:a b
$numc e
,e f
nullableg o
:o p
trueq u
)u v
,v w
ExecutionTime !
=" #
table$ )
.) *
Column* 0
<0 1
DateTime1 9
>9 :
(: ;
type; ?
:? @
$strA L
,L M
nullableN V
:V W
falseX ]
)] ^
,^ _
ExecutionDuration %
=& '
table( -
.- .
Column. 4
<4 5
int5 8
>8 9
(9 :
type: >
:> ?
$str@ E
,E F
nullableG O
:O P
falseQ V
)V W
,W X
ClientIpAddress #
=$ %
table& +
.+ ,
Column, 2
<2 3
string3 9
>9 :
(: ;
type; ?
:? @
$strA O
,O P
	maxLengthQ Z
:Z [
$num\ ^
,^ _
nullable` h
:h i
truej n
)n o
,o p

ClientName 
=  
table! &
.& '
Column' -
<- .
string. 4
>4 5
(5 6
type6 :
:: ;
$str< K
,K L
	maxLengthM V
:V W
$numX [
,[ \
nullable] e
:e f
trueg k
)k l
,l m
ClientId   
=   
table   $
.  $ %
Column  % +
<  + ,
string  , 2
>  2 3
(  3 4
type  4 8
:  8 9
$str  : H
,  H I
	maxLength  J S
:  S T
$num  U W
,  W X
nullable  Y a
:  a b
true  c g
)  g h
,  h i
CorrelationId!! !
=!!" #
table!!$ )
.!!) *
Column!!* 0
<!!0 1
string!!1 7
>!!7 8
(!!8 9
type!!9 =
:!!= >
$str!!? M
,!!M N
	maxLength!!O X
:!!X Y
$num!!Z \
,!!\ ]
nullable!!^ f
:!!f g
true!!h l
)!!l m
,!!m n
BrowserInfo"" 
=""  !
table""" '
.""' (
Column""( .
<"". /
string""/ 5
>""5 6
(""6 7
type""7 ;
:""; <
$str""= L
,""L M
	maxLength""N W
:""W X
$num""Y \
,""\ ]
nullable""^ f
:""f g
true""h l
)""l m
,""m n

HttpMethod## 
=##  
table##! &
.##& '
Column##' -
<##- .
string##. 4
>##4 5
(##5 6
type##6 :
:##: ;
$str##< J
,##J K
	maxLength##L U
:##U V
$num##W Y
,##Y Z
nullable##[ c
:##c d
true##e i
)##i j
,##j k
Url$$ 
=$$ 
table$$ 
.$$  
Column$$  &
<$$& '
string$$' -
>$$- .
($$. /
type$$/ 3
:$$3 4
$str$$5 D
,$$D E
	maxLength$$F O
:$$O P
$num$$Q T
,$$T U
nullable$$V ^
:$$^ _
true$$` d
)$$d e
,$$e f

Exceptions%% 
=%%  
table%%! &
.%%& '
Column%%' -
<%%- .
string%%. 4
>%%4 5
(%%5 6
type%%6 :
:%%: ;
$str%%< K
,%%K L
nullable%%M U
:%%U V
true%%W [
)%%[ \
,%%\ ]
Comments&& 
=&& 
table&& $
.&&$ %
Column&&% +
<&&+ ,
string&&, 2
>&&2 3
(&&3 4
type&&4 8
:&&8 9
$str&&: I
,&&I J
	maxLength&&K T
:&&T U
$num&&V Y
,&&Y Z
nullable&&[ c
:&&c d
true&&e i
)&&i j
,&&j k
HttpStatusCode'' "
=''# $
table''% *
.''* +
Column''+ 1
<''1 2
int''2 5
>''5 6
(''6 7
type''7 ;
:''; <
$str''= B
,''B C
nullable''D L
:''L M
true''N R
)''R S
,''S T
ExtraProperties(( #
=(($ %
table((& +
.((+ ,
Column((, 2
<((2 3
string((3 9
>((9 :
(((: ;
type((; ?
:((? @
$str((A P
,((P Q
nullable((R Z
:((Z [
false((\ a
)((a b
,((b c
ConcurrencyStamp)) $
=))% &
table))' ,
.)), -
Column))- 3
<))3 4
string))4 :
>)): ;
()); <
type))< @
:))@ A
$str))B P
,))P Q
	maxLength))R [
:))[ \
$num))] _
,))_ `
nullable))a i
:))i j
false))k p
)))p q
}** 
,** 
constraints++ 
:++ 
table++ "
=>++# %
{,, 
table-- 
.-- 

PrimaryKey-- $
(--$ %
$str--% 6
,--6 7
x--8 9
=>--: <
x--= >
.--> ?
Id--? A
)--A B
;--B C
}.. 
).. 
;.. 
migrationBuilder00 
.00 
CreateTable00 (
(00( )
name11 
:11 
$str11 )
,11) *
columns22 
:22 
table22 
=>22 !
new22" %
{33 
Id44 
=44 
table44 
.44 
Column44 %
<44% &
Guid44& *
>44* +
(44+ ,
type44, 0
:440 1
$str442 D
,44D E
nullable44F N
:44N O
false44P U
)44U V
,44V W
JobName55 
=55 
table55 #
.55# $
Column55$ *
<55* +
string55+ 1
>551 2
(552 3
type553 7
:557 8
$str559 H
,55H I
	maxLength55J S
:55S T
$num55U X
,55X Y
nullable55Z b
:55b c
false55d i
)55i j
,55j k
JobArgs66 
=66 
table66 #
.66# $
Column66$ *
<66* +
string66+ 1
>661 2
(662 3
type663 7
:667 8
$str669 H
,66H I
	maxLength66J S
:66S T
$num66U \
,66\ ]
nullable66^ f
:66f g
false66h m
)66m n
,66n o
TryCount77 
=77 
table77 $
.77$ %
Column77% +
<77+ ,
short77, 1
>771 2
(772 3
type773 7
:777 8
$str779 C
,77C D
nullable77E M
:77M N
false77O T
,77T U
defaultValue77V b
:77b c
(77d e
short77e j
)77j k
$num77k l
)77l m
,77m n
CreationTime88  
=88! "
table88# (
.88( )
Column88) /
<88/ 0
DateTime880 8
>888 9
(889 :
type88: >
:88> ?
$str88@ K
,88K L
nullable88M U
:88U V
false88W \
)88\ ]
,88] ^
NextTryTime99 
=99  !
table99" '
.99' (
Column99( .
<99. /
DateTime99/ 7
>997 8
(998 9
type999 =
:99= >
$str99? J
,99J K
nullable99L T
:99T U
false99V [
)99[ \
,99\ ]
LastTryTime:: 
=::  !
table::" '
.::' (
Column::( .
<::. /
DateTime::/ 7
>::7 8
(::8 9
type::9 =
:::= >
$str::? J
,::J K
nullable::L T
:::T U
true::V Z
)::Z [
,::[ \
IsAbandoned;; 
=;;  !
table;;" '
.;;' (
Column;;( .
<;;. /
bool;;/ 3
>;;3 4
(;;4 5
type;;5 9
:;;9 :
$str;;; @
,;;@ A
nullable;;B J
:;;J K
false;;L Q
,;;Q R
defaultValue;;S _
:;;_ `
false;;a f
);;f g
,;;g h
Priority<< 
=<< 
table<< $
.<<$ %
Column<<% +
<<<+ ,
byte<<, 0
><<0 1
(<<1 2
type<<2 6
:<<6 7
$str<<8 A
,<<A B
nullable<<C K
:<<K L
false<<M R
,<<R S
defaultValue<<T `
:<<` a
(<<b c
byte<<c g
)<<g h
$num<<h j
)<<j k
,<<k l
ExtraProperties== #
===$ %
table==& +
.==+ ,
Column==, 2
<==2 3
string==3 9
>==9 :
(==: ;
type==; ?
:==? @
$str==A P
,==P Q
nullable==R Z
:==Z [
false==\ a
)==a b
,==b c
ConcurrencyStamp>> $
=>>% &
table>>' ,
.>>, -
Column>>- 3
<>>3 4
string>>4 :
>>>: ;
(>>; <
type>>< @
:>>@ A
$str>>B P
,>>P Q
	maxLength>>R [
:>>[ \
$num>>] _
,>>_ `
nullable>>a i
:>>i j
false>>k p
)>>p q
}?? 
,?? 
constraints@@ 
:@@ 
table@@ "
=>@@# %
{AA 
tableBB 
.BB 

PrimaryKeyBB $
(BB$ %
$strBB% ;
,BB; <
xBB= >
=>BB? A
xBBB C
.BBC D
IdBBD F
)BBF G
;BBG H
}CC 
)CC 
;CC 
migrationBuilderEE 
.EE 
CreateTableEE (
(EE( )
nameFF 
:FF 
$strFF %
,FF% &
columnsGG 
:GG 
tableGG 
=>GG !
newGG" %
{HH 
IdII 
=II 
tableII 
.II 
ColumnII %
<II% &
GuidII& *
>II* +
(II+ ,
typeII, 0
:II0 1
$strII2 D
,IID E
nullableIIF N
:IIN O
falseIIP U
)IIU V
,IIV W
NameJJ 
=JJ 
tableJJ  
.JJ  !
ColumnJJ! '
<JJ' (
stringJJ( .
>JJ. /
(JJ/ 0
typeJJ0 4
:JJ4 5
$strJJ6 E
,JJE F
	maxLengthJJG P
:JJP Q
$numJJR U
,JJU V
nullableJJW _
:JJ_ `
falseJJa f
)JJf g
,JJg h
RequiredKK 
=KK 
tableKK $
.KK$ %
ColumnKK% +
<KK+ ,
boolKK, 0
>KK0 1
(KK1 2
typeKK2 6
:KK6 7
$strKK8 =
,KK= >
nullableKK? G
:KKG H
falseKKI N
)KKN O
,KKO P
IsStaticLL 
=LL 
tableLL $
.LL$ %
ColumnLL% +
<LL+ ,
boolLL, 0
>LL0 1
(LL1 2
typeLL2 6
:LL6 7
$strLL8 =
,LL= >
nullableLL? G
:LLG H
falseLLI N
)LLN O
,LLO P
RegexMM 
=MM 
tableMM !
.MM! "
ColumnMM" (
<MM( )
stringMM) /
>MM/ 0
(MM0 1
typeMM1 5
:MM5 6
$strMM7 F
,MMF G
	maxLengthMMH Q
:MMQ R
$numMMS V
,MMV W
nullableMMX `
:MM` a
trueMMb f
)MMf g
,MMg h
RegexDescriptionNN $
=NN% &
tableNN' ,
.NN, -
ColumnNN- 3
<NN3 4
stringNN4 :
>NN: ;
(NN; <
typeNN< @
:NN@ A
$strNNB Q
,NNQ R
	maxLengthNNS \
:NN\ ]
$numNN^ a
,NNa b
nullableNNc k
:NNk l
trueNNm q
)NNq r
,NNr s
DescriptionOO 
=OO  !
tableOO" '
.OO' (
ColumnOO( .
<OO. /
stringOO/ 5
>OO5 6
(OO6 7
typeOO7 ;
:OO; <
$strOO= L
,OOL M
	maxLengthOON W
:OOW X
$numOOY \
,OO\ ]
nullableOO^ f
:OOf g
trueOOh l
)OOl m
,OOm n
	ValueTypePP 
=PP 
tablePP  %
.PP% &
ColumnPP& ,
<PP, -
intPP- 0
>PP0 1
(PP1 2
typePP2 6
:PP6 7
$strPP8 =
,PP= >
nullablePP? G
:PPG H
falsePPI N
)PPN O
,PPO P
ExtraPropertiesQQ #
=QQ$ %
tableQQ& +
.QQ+ ,
ColumnQQ, 2
<QQ2 3
stringQQ3 9
>QQ9 :
(QQ: ;
typeQQ; ?
:QQ? @
$strQQA P
,QQP Q
nullableQQR Z
:QQZ [
falseQQ\ a
)QQa b
,QQb c
ConcurrencyStampRR $
=RR% &
tableRR' ,
.RR, -
ColumnRR- 3
<RR3 4
stringRR4 :
>RR: ;
(RR; <
typeRR< @
:RR@ A
$strRRB P
,RRP Q
	maxLengthRRR [
:RR[ \
$numRR] _
,RR_ `
nullableRRa i
:RRi j
falseRRk p
)RRp q
}SS 
,SS 
constraintsTT 
:TT 
tableTT "
=>TT# %
{UU 
tableVV 
.VV 

PrimaryKeyVV $
(VV$ %
$strVV% 7
,VV7 8
xVV9 :
=>VV; =
xVV> ?
.VV? @
IdVV@ B
)VVB C
;VVC D
}WW 
)WW 
;WW 
migrationBuilderYY 
.YY 
CreateTableYY (
(YY( )
nameZZ 
:ZZ 
$strZZ (
,ZZ( )
columns[[ 
:[[ 
table[[ 
=>[[ !
new[[" %
{\\ 
Id]] 
=]] 
table]] 
.]] 
Column]] %
<]]% &
Guid]]& *
>]]* +
(]]+ ,
type]], 0
:]]0 1
$str]]2 D
,]]D E
nullable]]F N
:]]N O
false]]P U
)]]U V
,]]V W
Name^^ 
=^^ 
table^^  
.^^  !
Column^^! '
<^^' (
string^^( .
>^^. /
(^^/ 0
type^^0 4
:^^4 5
$str^^6 E
,^^E F
	maxLength^^G P
:^^P Q
$num^^R U
,^^U V
nullable^^W _
:^^_ `
false^^a f
)^^f g
,^^g h
DisplayName__ 
=__  !
table__" '
.__' (
Column__( .
<__. /
string__/ 5
>__5 6
(__6 7
type__7 ;
:__; <
$str__= L
,__L M
	maxLength__N W
:__W X
$num__Y \
,__\ ]
nullable__^ f
:__f g
false__h m
)__m n
,__n o
ExtraProperties`` #
=``$ %
table``& +
.``+ ,
Column``, 2
<``2 3
string``3 9
>``9 :
(``: ;
type``; ?
:``? @
$str``A P
,``P Q
nullable``R Z
:``Z [
true``\ `
)``` a
}aa 
,aa 
constraintsbb 
:bb 
tablebb "
=>bb# %
{cc 
tabledd 
.dd 

PrimaryKeydd $
(dd$ %
$strdd% :
,dd: ;
xdd< =
=>dd> @
xddA B
.ddB C
IdddC E
)ddE F
;ddF G
}ee 
)ee 
;ee 
migrationBuildergg 
.gg 
CreateTablegg (
(gg( )
namehh 
:hh 
$strhh #
,hh# $
columnsii 
:ii 
tableii 
=>ii !
newii" %
{jj 
Idkk 
=kk 
tablekk 
.kk 
Columnkk %
<kk% &
Guidkk& *
>kk* +
(kk+ ,
typekk, 0
:kk0 1
$strkk2 D
,kkD E
nullablekkF N
:kkN O
falsekkP U
)kkU V
,kkV W
	GroupNamell 
=ll 
tablell  %
.ll% &
Columnll& ,
<ll, -
stringll- 3
>ll3 4
(ll4 5
typell5 9
:ll9 :
$strll; J
,llJ K
	maxLengthllL U
:llU V
$numllW Z
,llZ [
nullablell\ d
:lld e
falsellf k
)llk l
,lll m
Namemm 
=mm 
tablemm  
.mm  !
Columnmm! '
<mm' (
stringmm( .
>mm. /
(mm/ 0
typemm0 4
:mm4 5
$strmm6 E
,mmE F
	maxLengthmmG P
:mmP Q
$nummmR U
,mmU V
nullablemmW _
:mm_ `
falsemma f
)mmf g
,mmg h

ParentNamenn 
=nn  
tablenn! &
.nn& '
Columnnn' -
<nn- .
stringnn. 4
>nn4 5
(nn5 6
typenn6 :
:nn: ;
$strnn< K
,nnK L
	maxLengthnnM V
:nnV W
$numnnX [
,nn[ \
nullablenn] e
:nne f
truenng k
)nnk l
,nnl m
DisplayNameoo 
=oo  !
tableoo" '
.oo' (
Columnoo( .
<oo. /
stringoo/ 5
>oo5 6
(oo6 7
typeoo7 ;
:oo; <
$stroo= L
,ooL M
	maxLengthooN W
:ooW X
$numooY \
,oo\ ]
nullableoo^ f
:oof g
falseooh m
)oom n
,oon o
Descriptionpp 
=pp  !
tablepp" '
.pp' (
Columnpp( .
<pp. /
stringpp/ 5
>pp5 6
(pp6 7
typepp7 ;
:pp; <
$strpp= L
,ppL M
	maxLengthppN W
:ppW X
$numppY \
,pp\ ]
nullablepp^ f
:ppf g
truepph l
)ppl m
,ppm n
DefaultValueqq  
=qq! "
tableqq# (
.qq( )
Columnqq) /
<qq/ 0
stringqq0 6
>qq6 7
(qq7 8
typeqq8 <
:qq< =
$strqq> M
,qqM N
	maxLengthqqO X
:qqX Y
$numqqZ ]
,qq] ^
nullableqq_ g
:qqg h
trueqqi m
)qqm n
,qqn o
IsVisibleToClientsrr &
=rr' (
tablerr) .
.rr. /
Columnrr/ 5
<rr5 6
boolrr6 :
>rr: ;
(rr; <
typerr< @
:rr@ A
$strrrB G
,rrG H
nullablerrI Q
:rrQ R
falserrS X
)rrX Y
,rrY Z
IsAvailableToHostss %
=ss& '
tabless( -
.ss- .
Columnss. 4
<ss4 5
boolss5 9
>ss9 :
(ss: ;
typess; ?
:ss? @
$strssA F
,ssF G
nullablessH P
:ssP Q
falsessR W
)ssW X
,ssX Y
AllowedProviderstt $
=tt% &
tablett' ,
.tt, -
Columntt- 3
<tt3 4
stringtt4 :
>tt: ;
(tt; <
typett< @
:tt@ A
$strttB Q
,ttQ R
	maxLengthttS \
:tt\ ]
$numtt^ a
,tta b
nullablettc k
:ttk l
truettm q
)ttq r
,ttr s
	ValueTypeuu 
=uu 
tableuu  %
.uu% &
Columnuu& ,
<uu, -
stringuu- 3
>uu3 4
(uu4 5
typeuu5 9
:uu9 :
$struu; K
,uuK L
	maxLengthuuM V
:uuV W
$numuuX \
,uu\ ]
nullableuu^ f
:uuf g
trueuuh l
)uul m
,uum n
ExtraPropertiesvv #
=vv$ %
tablevv& +
.vv+ ,
Columnvv, 2
<vv2 3
stringvv3 9
>vv9 :
(vv: ;
typevv; ?
:vv? @
$strvvA P
,vvP Q
nullablevvR Z
:vvZ [
truevv\ `
)vv` a
}ww 
,ww 
constraintsxx 
:xx 
tablexx "
=>xx# %
{yy 
tablezz 
.zz 

PrimaryKeyzz $
(zz$ %
$strzz% 5
,zz5 6
xzz7 8
=>zz9 ;
xzz< =
.zz= >
Idzz> @
)zz@ A
;zzA B
}{{ 
){{ 
;{{ 
migrationBuilder}} 
.}} 
CreateTable}} (
(}}( )
name~~ 
:~~ 
$str~~ (
,~~( )
columns 
: 
table 
=> !
new" %
{
ÄÄ 
Id
ÅÅ 
=
ÅÅ 
table
ÅÅ 
.
ÅÅ 
Column
ÅÅ %
<
ÅÅ% &
Guid
ÅÅ& *
>
ÅÅ* +
(
ÅÅ+ ,
type
ÅÅ, 0
:
ÅÅ0 1
$str
ÅÅ2 D
,
ÅÅD E
nullable
ÅÅF N
:
ÅÅN O
false
ÅÅP U
)
ÅÅU V
,
ÅÅV W
Name
ÇÇ 
=
ÇÇ 
table
ÇÇ  
.
ÇÇ  !
Column
ÇÇ! '
<
ÇÇ' (
string
ÇÇ( .
>
ÇÇ. /
(
ÇÇ/ 0
type
ÇÇ0 4
:
ÇÇ4 5
$str
ÇÇ6 E
,
ÇÇE F
	maxLength
ÇÇG P
:
ÇÇP Q
$num
ÇÇR U
,
ÇÇU V
nullable
ÇÇW _
:
ÇÇ_ `
false
ÇÇa f
)
ÇÇf g
,
ÇÇg h
Value
ÉÉ 
=
ÉÉ 
table
ÉÉ !
.
ÉÉ! "
Column
ÉÉ" (
<
ÉÉ( )
string
ÉÉ) /
>
ÉÉ/ 0
(
ÉÉ0 1
type
ÉÉ1 5
:
ÉÉ5 6
$str
ÉÉ7 F
,
ÉÉF G
	maxLength
ÉÉH Q
:
ÉÉQ R
$num
ÉÉS V
,
ÉÉV W
nullable
ÉÉX `
:
ÉÉ` a
false
ÉÉb g
)
ÉÉg h
,
ÉÉh i
ProviderName
ÑÑ  
=
ÑÑ! "
table
ÑÑ# (
.
ÑÑ( )
Column
ÑÑ) /
<
ÑÑ/ 0
string
ÑÑ0 6
>
ÑÑ6 7
(
ÑÑ7 8
type
ÑÑ8 <
:
ÑÑ< =
$str
ÑÑ> L
,
ÑÑL M
	maxLength
ÑÑN W
:
ÑÑW X
$num
ÑÑY [
,
ÑÑ[ \
nullable
ÑÑ] e
:
ÑÑe f
true
ÑÑg k
)
ÑÑk l
,
ÑÑl m
ProviderKey
ÖÖ 
=
ÖÖ  !
table
ÖÖ" '
.
ÖÖ' (
Column
ÖÖ( .
<
ÖÖ. /
string
ÖÖ/ 5
>
ÖÖ5 6
(
ÖÖ6 7
type
ÖÖ7 ;
:
ÖÖ; <
$str
ÖÖ= K
,
ÖÖK L
	maxLength
ÖÖM V
:
ÖÖV W
$num
ÖÖX Z
,
ÖÖZ [
nullable
ÖÖ\ d
:
ÖÖd e
true
ÖÖf j
)
ÖÖj k
}
ÜÜ 
,
ÜÜ 
constraints
áá 
:
áá 
table
áá "
=>
áá# %
{
àà 
table
ââ 
.
ââ 

PrimaryKey
ââ $
(
ââ$ %
$str
ââ% :
,
ââ: ;
x
ââ< =
=>
ââ> @
x
ââA B
.
ââB C
Id
ââC E
)
ââE F
;
ââF G
}
ää 
)
ää 
;
ää 
migrationBuilder
åå 
.
åå 
CreateTable
åå (
(
åå( )
name
çç 
:
çç 
$str
çç $
,
çç$ %
columns
éé 
:
éé 
table
éé 
=>
éé !
new
éé" %
{
èè 
Id
êê 
=
êê 
table
êê 
.
êê 
Column
êê %
<
êê% &
Guid
êê& *
>
êê* +
(
êê+ ,
type
êê, 0
:
êê0 1
$str
êê2 D
,
êêD E
nullable
êêF N
:
êêN O
false
êêP U
)
êêU V
,
êêV W
SourceUserId
ëë  
=
ëë! "
table
ëë# (
.
ëë( )
Column
ëë) /
<
ëë/ 0
Guid
ëë0 4
>
ëë4 5
(
ëë5 6
type
ëë6 :
:
ëë: ;
$str
ëë< N
,
ëëN O
nullable
ëëP X
:
ëëX Y
false
ëëZ _
)
ëë_ `
,
ëë` a
SourceTenantId
íí "
=
íí# $
table
íí% *
.
íí* +
Column
íí+ 1
<
íí1 2
Guid
íí2 6
>
íí6 7
(
íí7 8
type
íí8 <
:
íí< =
$str
íí> P
,
ííP Q
nullable
ííR Z
:
ííZ [
true
íí\ `
)
íí` a
,
íía b
TargetUserId
ìì  
=
ìì! "
table
ìì# (
.
ìì( )
Column
ìì) /
<
ìì/ 0
Guid
ìì0 4
>
ìì4 5
(
ìì5 6
type
ìì6 :
:
ìì: ;
$str
ìì< N
,
ììN O
nullable
ììP X
:
ììX Y
false
ììZ _
)
ìì_ `
,
ìì` a
TargetTenantId
îî "
=
îî# $
table
îî% *
.
îî* +
Column
îî+ 1
<
îî1 2
Guid
îî2 6
>
îî6 7
(
îî7 8
type
îî8 <
:
îî< =
$str
îî> P
,
îîP Q
nullable
îîR Z
:
îîZ [
true
îî\ `
)
îî` a
}
ïï 
,
ïï 
constraints
ññ 
:
ññ 
table
ññ "
=>
ññ# %
{
óó 
table
òò 
.
òò 

PrimaryKey
òò $
(
òò$ %
$str
òò% 6
,
òò6 7
x
òò8 9
=>
òò: <
x
òò= >
.
òò> ?
Id
òò? A
)
òòA B
;
òòB C
}
ôô 
)
ôô 
;
ôô 
migrationBuilder
õõ 
.
õõ 
CreateTable
õõ (
(
õõ( )
name
úú 
:
úú 
$str
úú ,
,
úú, -
columns
ùù 
:
ùù 
table
ùù 
=>
ùù !
new
ùù" %
{
ûû 
Id
üü 
=
üü 
table
üü 
.
üü 
Column
üü %
<
üü% &
Guid
üü& *
>
üü* +
(
üü+ ,
type
üü, 0
:
üü0 1
$str
üü2 D
,
üüD E
nullable
üüF N
:
üüN O
false
üüP U
)
üüU V
,
üüV W
TenantId
†† 
=
†† 
table
†† $
.
††$ %
Column
††% +
<
††+ ,
Guid
††, 0
>
††0 1
(
††1 2
type
††2 6
:
††6 7
$str
††8 J
,
††J K
nullable
††L T
:
††T U
true
††V Z
)
††Z [
,
††[ \
ParentId
°° 
=
°° 
table
°° $
.
°°$ %
Column
°°% +
<
°°+ ,
Guid
°°, 0
>
°°0 1
(
°°1 2
type
°°2 6
:
°°6 7
$str
°°8 J
,
°°J K
nullable
°°L T
:
°°T U
true
°°V Z
)
°°Z [
,
°°[ \
Code
¢¢ 
=
¢¢ 
table
¢¢  
.
¢¢  !
Column
¢¢! '
<
¢¢' (
string
¢¢( .
>
¢¢. /
(
¢¢/ 0
type
¢¢0 4
:
¢¢4 5
$str
¢¢6 D
,
¢¢D E
	maxLength
¢¢F O
:
¢¢O P
$num
¢¢Q S
,
¢¢S T
nullable
¢¢U ]
:
¢¢] ^
false
¢¢_ d
)
¢¢d e
,
¢¢e f
DisplayName
££ 
=
££  !
table
££" '
.
££' (
Column
££( .
<
££. /
string
££/ 5
>
££5 6
(
££6 7
type
££7 ;
:
££; <
$str
££= L
,
££L M
	maxLength
££N W
:
££W X
$num
££Y \
,
££\ ]
nullable
££^ f
:
££f g
false
££h m
)
££m n
,
££n o
EntityVersion
§§ !
=
§§" #
table
§§$ )
.
§§) *
Column
§§* 0
<
§§0 1
int
§§1 4
>
§§4 5
(
§§5 6
type
§§6 :
:
§§: ;
$str
§§< A
,
§§A B
nullable
§§C K
:
§§K L
false
§§M R
)
§§R S
,
§§S T
ExtraProperties
•• #
=
••$ %
table
••& +
.
••+ ,
Column
••, 2
<
••2 3
string
••3 9
>
••9 :
(
••: ;
type
••; ?
:
••? @
$str
••A P
,
••P Q
nullable
••R Z
:
••Z [
false
••\ a
)
••a b
,
••b c
ConcurrencyStamp
¶¶ $
=
¶¶% &
table
¶¶' ,
.
¶¶, -
Column
¶¶- 3
<
¶¶3 4
string
¶¶4 :
>
¶¶: ;
(
¶¶; <
type
¶¶< @
:
¶¶@ A
$str
¶¶B P
,
¶¶P Q
	maxLength
¶¶R [
:
¶¶[ \
$num
¶¶] _
,
¶¶_ `
nullable
¶¶a i
:
¶¶i j
false
¶¶k p
)
¶¶p q
,
¶¶q r
CreationTime
ßß  
=
ßß! "
table
ßß# (
.
ßß( )
Column
ßß) /
<
ßß/ 0
DateTime
ßß0 8
>
ßß8 9
(
ßß9 :
type
ßß: >
:
ßß> ?
$str
ßß@ K
,
ßßK L
nullable
ßßM U
:
ßßU V
false
ßßW \
)
ßß\ ]
,
ßß] ^
	CreatorId
®® 
=
®® 
table
®®  %
.
®®% &
Column
®®& ,
<
®®, -
Guid
®®- 1
>
®®1 2
(
®®2 3
type
®®3 7
:
®®7 8
$str
®®9 K
,
®®K L
nullable
®®M U
:
®®U V
true
®®W [
)
®®[ \
,
®®\ ]"
LastModificationTime
©© (
=
©©) *
table
©©+ 0
.
©©0 1
Column
©©1 7
<
©©7 8
DateTime
©©8 @
>
©©@ A
(
©©A B
type
©©B F
:
©©F G
$str
©©H S
,
©©S T
nullable
©©U ]
:
©©] ^
true
©©_ c
)
©©c d
,
©©d e
LastModifierId
™™ "
=
™™# $
table
™™% *
.
™™* +
Column
™™+ 1
<
™™1 2
Guid
™™2 6
>
™™6 7
(
™™7 8
type
™™8 <
:
™™< =
$str
™™> P
,
™™P Q
nullable
™™R Z
:
™™Z [
true
™™\ `
)
™™` a
,
™™a b
	IsDeleted
´´ 
=
´´ 
table
´´  %
.
´´% &
Column
´´& ,
<
´´, -
bool
´´- 1
>
´´1 2
(
´´2 3
type
´´3 7
:
´´7 8
$str
´´9 >
,
´´> ?
nullable
´´@ H
:
´´H I
false
´´J O
,
´´O P
defaultValue
´´Q ]
:
´´] ^
false
´´_ d
)
´´d e
,
´´e f
	DeleterId
¨¨ 
=
¨¨ 
table
¨¨  %
.
¨¨% &
Column
¨¨& ,
<
¨¨, -
Guid
¨¨- 1
>
¨¨1 2
(
¨¨2 3
type
¨¨3 7
:
¨¨7 8
$str
¨¨9 K
,
¨¨K L
nullable
¨¨M U
:
¨¨U V
true
¨¨W [
)
¨¨[ \
,
¨¨\ ]
DeletionTime
≠≠  
=
≠≠! "
table
≠≠# (
.
≠≠( )
Column
≠≠) /
<
≠≠/ 0
DateTime
≠≠0 8
>
≠≠8 9
(
≠≠9 :
type
≠≠: >
:
≠≠> ?
$str
≠≠@ K
,
≠≠K L
nullable
≠≠M U
:
≠≠U V
true
≠≠W [
)
≠≠[ \
}
ÆÆ 
,
ÆÆ 
constraints
ØØ 
:
ØØ 
table
ØØ "
=>
ØØ# %
{
∞∞ 
table
±± 
.
±± 

PrimaryKey
±± $
(
±±$ %
$str
±±% >
,
±±> ?
x
±±@ A
=>
±±B D
x
±±E F
.
±±F G
Id
±±G I
)
±±I J
;
±±J K
table
≤≤ 
.
≤≤ 

ForeignKey
≤≤ $
(
≤≤$ %
name
≥≥ 
:
≥≥ 
$str
≥≥ U
,
≥≥U V
column
¥¥ 
:
¥¥ 
x
¥¥  !
=>
¥¥" $
x
¥¥% &
.
¥¥& '
ParentId
¥¥' /
,
¥¥/ 0
principalTable
µµ &
:
µµ& '
$str
µµ( >
,
µµ> ?
principalColumn
∂∂ '
:
∂∂' (
$str
∂∂) -
)
∂∂- .
;
∂∂. /
}
∑∑ 
)
∑∑ 
;
∑∑ 
migrationBuilder
ππ 
.
ππ 
CreateTable
ππ (
(
ππ( )
name
∫∫ 
:
∫∫ 
$str
∫∫ +
,
∫∫+ ,
columns
ªª 
:
ªª 
table
ªª 
=>
ªª !
new
ªª" %
{
ºº 
Id
ΩΩ 
=
ΩΩ 
table
ΩΩ 
.
ΩΩ 
Column
ΩΩ %
<
ΩΩ% &
Guid
ΩΩ& *
>
ΩΩ* +
(
ΩΩ+ ,
type
ΩΩ, 0
:
ΩΩ0 1
$str
ΩΩ2 D
,
ΩΩD E
nullable
ΩΩF N
:
ΩΩN O
false
ΩΩP U
)
ΩΩU V
,
ΩΩV W
TenantId
ææ 
=
ææ 
table
ææ $
.
ææ$ %
Column
ææ% +
<
ææ+ ,
Guid
ææ, 0
>
ææ0 1
(
ææ1 2
type
ææ2 6
:
ææ6 7
$str
ææ8 J
,
ææJ K
nullable
ææL T
:
ææT U
true
ææV Z
)
ææZ [
,
ææ[ \
Name
øø 
=
øø 
table
øø  
.
øø  !
Column
øø! '
<
øø' (
string
øø( .
>
øø. /
(
øø/ 0
type
øø0 4
:
øø4 5
$str
øø6 E
,
øøE F
	maxLength
øøG P
:
øøP Q
$num
øøR U
,
øøU V
nullable
øøW _
:
øø_ `
false
øøa f
)
øøf g
,
øøg h
ProviderName
¿¿  
=
¿¿! "
table
¿¿# (
.
¿¿( )
Column
¿¿) /
<
¿¿/ 0
string
¿¿0 6
>
¿¿6 7
(
¿¿7 8
type
¿¿8 <
:
¿¿< =
$str
¿¿> L
,
¿¿L M
	maxLength
¿¿N W
:
¿¿W X
$num
¿¿Y [
,
¿¿[ \
nullable
¿¿] e
:
¿¿e f
false
¿¿g l
)
¿¿l m
,
¿¿m n
ProviderKey
¡¡ 
=
¡¡  !
table
¡¡" '
.
¡¡' (
Column
¡¡( .
<
¡¡. /
string
¡¡/ 5
>
¡¡5 6
(
¡¡6 7
type
¡¡7 ;
:
¡¡; <
$str
¡¡= K
,
¡¡K L
	maxLength
¡¡M V
:
¡¡V W
$num
¡¡X Z
,
¡¡Z [
nullable
¡¡\ d
:
¡¡d e
false
¡¡f k
)
¡¡k l
}
¬¬ 
,
¬¬ 
constraints
√√ 
:
√√ 
table
√√ "
=>
√√# %
{
ƒƒ 
table
≈≈ 
.
≈≈ 

PrimaryKey
≈≈ $
(
≈≈$ %
$str
≈≈% =
,
≈≈= >
x
≈≈? @
=>
≈≈A C
x
≈≈D E
.
≈≈E F
Id
≈≈F H
)
≈≈H I
;
≈≈I J
}
∆∆ 
)
∆∆ 
;
∆∆ 
migrationBuilder
»» 
.
»» 
CreateTable
»» (
(
»»( )
name
…… 
:
…… 
$str
…… +
,
……+ ,
columns
   
:
   
table
   
=>
   !
new
  " %
{
ÀÀ 
Id
ÃÃ 
=
ÃÃ 
table
ÃÃ 
.
ÃÃ 
Column
ÃÃ %
<
ÃÃ% &
Guid
ÃÃ& *
>
ÃÃ* +
(
ÃÃ+ ,
type
ÃÃ, 0
:
ÃÃ0 1
$str
ÃÃ2 D
,
ÃÃD E
nullable
ÃÃF N
:
ÃÃN O
false
ÃÃP U
)
ÃÃU V
,
ÃÃV W
Name
ÕÕ 
=
ÕÕ 
table
ÕÕ  
.
ÕÕ  !
Column
ÕÕ! '
<
ÕÕ' (
string
ÕÕ( .
>
ÕÕ. /
(
ÕÕ/ 0
type
ÕÕ0 4
:
ÕÕ4 5
$str
ÕÕ6 E
,
ÕÕE F
	maxLength
ÕÕG P
:
ÕÕP Q
$num
ÕÕR U
,
ÕÕU V
nullable
ÕÕW _
:
ÕÕ_ `
false
ÕÕa f
)
ÕÕf g
,
ÕÕg h
DisplayName
ŒŒ 
=
ŒŒ  !
table
ŒŒ" '
.
ŒŒ' (
Column
ŒŒ( .
<
ŒŒ. /
string
ŒŒ/ 5
>
ŒŒ5 6
(
ŒŒ6 7
type
ŒŒ7 ;
:
ŒŒ; <
$str
ŒŒ= L
,
ŒŒL M
	maxLength
ŒŒN W
:
ŒŒW X
$num
ŒŒY \
,
ŒŒ\ ]
nullable
ŒŒ^ f
:
ŒŒf g
false
ŒŒh m
)
ŒŒm n
,
ŒŒn o
ExtraProperties
œœ #
=
œœ$ %
table
œœ& +
.
œœ+ ,
Column
œœ, 2
<
œœ2 3
string
œœ3 9
>
œœ9 :
(
œœ: ;
type
œœ; ?
:
œœ? @
$str
œœA P
,
œœP Q
nullable
œœR Z
:
œœZ [
true
œœ\ `
)
œœ` a
}
–– 
,
–– 
constraints
—— 
:
—— 
table
—— "
=>
——# %
{
““ 
table
”” 
.
”” 

PrimaryKey
”” $
(
””$ %
$str
””% =
,
””= >
x
””? @
=>
””A C
x
””D E
.
””E F
Id
””F H
)
””H I
;
””I J
}
‘‘ 
)
‘‘ 
;
‘‘ 
migrationBuilder
÷÷ 
.
÷÷ 
CreateTable
÷÷ (
(
÷÷( )
name
◊◊ 
:
◊◊ 
$str
◊◊ &
,
◊◊& '
columns
ÿÿ 
:
ÿÿ 
table
ÿÿ 
=>
ÿÿ !
new
ÿÿ" %
{
ŸŸ 
Id
⁄⁄ 
=
⁄⁄ 
table
⁄⁄ 
.
⁄⁄ 
Column
⁄⁄ %
<
⁄⁄% &
Guid
⁄⁄& *
>
⁄⁄* +
(
⁄⁄+ ,
type
⁄⁄, 0
:
⁄⁄0 1
$str
⁄⁄2 D
,
⁄⁄D E
nullable
⁄⁄F N
:
⁄⁄N O
false
⁄⁄P U
)
⁄⁄U V
,
⁄⁄V W
	GroupName
€€ 
=
€€ 
table
€€  %
.
€€% &
Column
€€& ,
<
€€, -
string
€€- 3
>
€€3 4
(
€€4 5
type
€€5 9
:
€€9 :
$str
€€; J
,
€€J K
	maxLength
€€L U
:
€€U V
$num
€€W Z
,
€€Z [
nullable
€€\ d
:
€€d e
false
€€f k
)
€€k l
,
€€l m
Name
‹‹ 
=
‹‹ 
table
‹‹  
.
‹‹  !
Column
‹‹! '
<
‹‹' (
string
‹‹( .
>
‹‹. /
(
‹‹/ 0
type
‹‹0 4
:
‹‹4 5
$str
‹‹6 E
,
‹‹E F
	maxLength
‹‹G P
:
‹‹P Q
$num
‹‹R U
,
‹‹U V
nullable
‹‹W _
:
‹‹_ `
false
‹‹a f
)
‹‹f g
,
‹‹g h

ParentName
›› 
=
››  
table
››! &
.
››& '
Column
››' -
<
››- .
string
››. 4
>
››4 5
(
››5 6
type
››6 :
:
››: ;
$str
››< K
,
››K L
	maxLength
››M V
:
››V W
$num
››X [
,
››[ \
nullable
››] e
:
››e f
true
››g k
)
››k l
,
››l m
DisplayName
ﬁﬁ 
=
ﬁﬁ  !
table
ﬁﬁ" '
.
ﬁﬁ' (
Column
ﬁﬁ( .
<
ﬁﬁ. /
string
ﬁﬁ/ 5
>
ﬁﬁ5 6
(
ﬁﬁ6 7
type
ﬁﬁ7 ;
:
ﬁﬁ; <
$str
ﬁﬁ= L
,
ﬁﬁL M
	maxLength
ﬁﬁN W
:
ﬁﬁW X
$num
ﬁﬁY \
,
ﬁﬁ\ ]
nullable
ﬁﬁ^ f
:
ﬁﬁf g
false
ﬁﬁh m
)
ﬁﬁm n
,
ﬁﬁn o
	IsEnabled
ﬂﬂ 
=
ﬂﬂ 
table
ﬂﬂ  %
.
ﬂﬂ% &
Column
ﬂﬂ& ,
<
ﬂﬂ, -
bool
ﬂﬂ- 1
>
ﬂﬂ1 2
(
ﬂﬂ2 3
type
ﬂﬂ3 7
:
ﬂﬂ7 8
$str
ﬂﬂ9 >
,
ﬂﬂ> ?
nullable
ﬂﬂ@ H
:
ﬂﬂH I
false
ﬂﬂJ O
)
ﬂﬂO P
,
ﬂﬂP Q
MultiTenancySide
‡‡ $
=
‡‡% &
table
‡‡' ,
.
‡‡, -
Column
‡‡- 3
<
‡‡3 4
byte
‡‡4 8
>
‡‡8 9
(
‡‡9 :
type
‡‡: >
:
‡‡> ?
$str
‡‡@ I
,
‡‡I J
nullable
‡‡K S
:
‡‡S T
false
‡‡U Z
)
‡‡Z [
,
‡‡[ \
	Providers
·· 
=
·· 
table
··  %
.
··% &
Column
··& ,
<
··, -
string
··- 3
>
··3 4
(
··4 5
type
··5 9
:
··9 :
$str
··; J
,
··J K
	maxLength
··L U
:
··U V
$num
··W Z
,
··Z [
nullable
··\ d
:
··d e
true
··f j
)
··j k
,
··k l
StateCheckers
‚‚ !
=
‚‚" #
table
‚‚$ )
.
‚‚) *
Column
‚‚* 0
<
‚‚0 1
string
‚‚1 7
>
‚‚7 8
(
‚‚8 9
type
‚‚9 =
:
‚‚= >
$str
‚‚? N
,
‚‚N O
	maxLength
‚‚P Y
:
‚‚Y Z
$num
‚‚[ ^
,
‚‚^ _
nullable
‚‚` h
:
‚‚h i
true
‚‚j n
)
‚‚n o
,
‚‚o p
ExtraProperties
„„ #
=
„„$ %
table
„„& +
.
„„+ ,
Column
„„, 2
<
„„2 3
string
„„3 9
>
„„9 :
(
„„: ;
type
„„; ?
:
„„? @
$str
„„A P
,
„„P Q
nullable
„„R Z
:
„„Z [
true
„„\ `
)
„„` a
}
‰‰ 
,
‰‰ 
constraints
ÂÂ 
:
ÂÂ 
table
ÂÂ "
=>
ÂÂ# %
{
ÊÊ 
table
ÁÁ 
.
ÁÁ 

PrimaryKey
ÁÁ $
(
ÁÁ$ %
$str
ÁÁ% 8
,
ÁÁ8 9
x
ÁÁ: ;
=>
ÁÁ< >
x
ÁÁ? @
.
ÁÁ@ A
Id
ÁÁA C
)
ÁÁC D
;
ÁÁD E
}
ËË 
)
ËË 
;
ËË 
migrationBuilder
ÍÍ 
.
ÍÍ 
CreateTable
ÍÍ (
(
ÍÍ( )
name
ÎÎ 
:
ÎÎ 
$str
ÎÎ  
,
ÎÎ  !
columns
ÏÏ 
:
ÏÏ 
table
ÏÏ 
=>
ÏÏ !
new
ÏÏ" %
{
ÌÌ 
Id
ÓÓ 
=
ÓÓ 
table
ÓÓ 
.
ÓÓ 
Column
ÓÓ %
<
ÓÓ% &
Guid
ÓÓ& *
>
ÓÓ* +
(
ÓÓ+ ,
type
ÓÓ, 0
:
ÓÓ0 1
$str
ÓÓ2 D
,
ÓÓD E
nullable
ÓÓF N
:
ÓÓN O
false
ÓÓP U
)
ÓÓU V
,
ÓÓV W
TenantId
ÔÔ 
=
ÔÔ 
table
ÔÔ $
.
ÔÔ$ %
Column
ÔÔ% +
<
ÔÔ+ ,
Guid
ÔÔ, 0
>
ÔÔ0 1
(
ÔÔ1 2
type
ÔÔ2 6
:
ÔÔ6 7
$str
ÔÔ8 J
,
ÔÔJ K
nullable
ÔÔL T
:
ÔÔT U
true
ÔÔV Z
)
ÔÔZ [
,
ÔÔ[ \
Name
 
=
 
table
  
.
  !
Column
! '
<
' (
string
( .
>
. /
(
/ 0
type
0 4
:
4 5
$str
6 E
,
E F
	maxLength
G P
:
P Q
$num
R U
,
U V
nullable
W _
:
_ `
false
a f
)
f g
,
g h
NormalizedName
ÒÒ "
=
ÒÒ# $
table
ÒÒ% *
.
ÒÒ* +
Column
ÒÒ+ 1
<
ÒÒ1 2
string
ÒÒ2 8
>
ÒÒ8 9
(
ÒÒ9 :
type
ÒÒ: >
:
ÒÒ> ?
$str
ÒÒ@ O
,
ÒÒO P
	maxLength
ÒÒQ Z
:
ÒÒZ [
$num
ÒÒ\ _
,
ÒÒ_ `
nullable
ÒÒa i
:
ÒÒi j
false
ÒÒk p
)
ÒÒp q
,
ÒÒq r
	IsDefault
ÚÚ 
=
ÚÚ 
table
ÚÚ  %
.
ÚÚ% &
Column
ÚÚ& ,
<
ÚÚ, -
bool
ÚÚ- 1
>
ÚÚ1 2
(
ÚÚ2 3
type
ÚÚ3 7
:
ÚÚ7 8
$str
ÚÚ9 >
,
ÚÚ> ?
nullable
ÚÚ@ H
:
ÚÚH I
false
ÚÚJ O
)
ÚÚO P
,
ÚÚP Q
IsStatic
ÛÛ 
=
ÛÛ 
table
ÛÛ $
.
ÛÛ$ %
Column
ÛÛ% +
<
ÛÛ+ ,
bool
ÛÛ, 0
>
ÛÛ0 1
(
ÛÛ1 2
type
ÛÛ2 6
:
ÛÛ6 7
$str
ÛÛ8 =
,
ÛÛ= >
nullable
ÛÛ? G
:
ÛÛG H
false
ÛÛI N
)
ÛÛN O
,
ÛÛO P
IsPublic
ÙÙ 
=
ÙÙ 
table
ÙÙ $
.
ÙÙ$ %
Column
ÙÙ% +
<
ÙÙ+ ,
bool
ÙÙ, 0
>
ÙÙ0 1
(
ÙÙ1 2
type
ÙÙ2 6
:
ÙÙ6 7
$str
ÙÙ8 =
,
ÙÙ= >
nullable
ÙÙ? G
:
ÙÙG H
false
ÙÙI N
)
ÙÙN O
,
ÙÙO P
EntityVersion
ıı !
=
ıı" #
table
ıı$ )
.
ıı) *
Column
ıı* 0
<
ıı0 1
int
ıı1 4
>
ıı4 5
(
ıı5 6
type
ıı6 :
:
ıı: ;
$str
ıı< A
,
ııA B
nullable
ııC K
:
ııK L
false
ııM R
)
ııR S
,
ııS T
ExtraProperties
ˆˆ #
=
ˆˆ$ %
table
ˆˆ& +
.
ˆˆ+ ,
Column
ˆˆ, 2
<
ˆˆ2 3
string
ˆˆ3 9
>
ˆˆ9 :
(
ˆˆ: ;
type
ˆˆ; ?
:
ˆˆ? @
$str
ˆˆA P
,
ˆˆP Q
nullable
ˆˆR Z
:
ˆˆZ [
false
ˆˆ\ a
)
ˆˆa b
,
ˆˆb c
ConcurrencyStamp
˜˜ $
=
˜˜% &
table
˜˜' ,
.
˜˜, -
Column
˜˜- 3
<
˜˜3 4
string
˜˜4 :
>
˜˜: ;
(
˜˜; <
type
˜˜< @
:
˜˜@ A
$str
˜˜B P
,
˜˜P Q
	maxLength
˜˜R [
:
˜˜[ \
$num
˜˜] _
,
˜˜_ `
nullable
˜˜a i
:
˜˜i j
false
˜˜k p
)
˜˜p q
}
¯¯ 
,
¯¯ 
constraints
˘˘ 
:
˘˘ 
table
˘˘ "
=>
˘˘# %
{
˙˙ 
table
˚˚ 
.
˚˚ 

PrimaryKey
˚˚ $
(
˚˚$ %
$str
˚˚% 2
,
˚˚2 3
x
˚˚4 5
=>
˚˚6 8
x
˚˚9 :
.
˚˚: ;
Id
˚˚; =
)
˚˚= >
;
˚˚> ?
}
¸¸ 
)
¸¸ 
;
¸¸ 
migrationBuilder
˛˛ 
.
˛˛ 
CreateTable
˛˛ (
(
˛˛( )
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ '
,
ˇˇ' (
columns
ÄÄ 
:
ÄÄ 
table
ÄÄ 
=>
ÄÄ !
new
ÄÄ" %
{
ÅÅ 
Id
ÇÇ 
=
ÇÇ 
table
ÇÇ 
.
ÇÇ 
Column
ÇÇ %
<
ÇÇ% &
Guid
ÇÇ& *
>
ÇÇ* +
(
ÇÇ+ ,
type
ÇÇ, 0
:
ÇÇ0 1
$str
ÇÇ2 D
,
ÇÇD E
nullable
ÇÇF N
:
ÇÇN O
false
ÇÇP U
)
ÇÇU V
,
ÇÇV W
TenantId
ÉÉ 
=
ÉÉ 
table
ÉÉ $
.
ÉÉ$ %
Column
ÉÉ% +
<
ÉÉ+ ,
Guid
ÉÉ, 0
>
ÉÉ0 1
(
ÉÉ1 2
type
ÉÉ2 6
:
ÉÉ6 7
$str
ÉÉ8 J
,
ÉÉJ K
nullable
ÉÉL T
:
ÉÉT U
true
ÉÉV Z
)
ÉÉZ [
,
ÉÉ[ \
ApplicationName
ÑÑ #
=
ÑÑ$ %
table
ÑÑ& +
.
ÑÑ+ ,
Column
ÑÑ, 2
<
ÑÑ2 3
string
ÑÑ3 9
>
ÑÑ9 :
(
ÑÑ: ;
type
ÑÑ; ?
:
ÑÑ? @
$str
ÑÑA O
,
ÑÑO P
	maxLength
ÑÑQ Z
:
ÑÑZ [
$num
ÑÑ\ ^
,
ÑÑ^ _
nullable
ÑÑ` h
:
ÑÑh i
true
ÑÑj n
)
ÑÑn o
,
ÑÑo p
Identity
ÖÖ 
=
ÖÖ 
table
ÖÖ $
.
ÖÖ$ %
Column
ÖÖ% +
<
ÖÖ+ ,
string
ÖÖ, 2
>
ÖÖ2 3
(
ÖÖ3 4
type
ÖÖ4 8
:
ÖÖ8 9
$str
ÖÖ: H
,
ÖÖH I
	maxLength
ÖÖJ S
:
ÖÖS T
$num
ÖÖU W
,
ÖÖW X
nullable
ÖÖY a
:
ÖÖa b
true
ÖÖc g
)
ÖÖg h
,
ÖÖh i
Action
ÜÜ 
=
ÜÜ 
table
ÜÜ "
.
ÜÜ" #
Column
ÜÜ# )
<
ÜÜ) *
string
ÜÜ* 0
>
ÜÜ0 1
(
ÜÜ1 2
type
ÜÜ2 6
:
ÜÜ6 7
$str
ÜÜ8 F
,
ÜÜF G
	maxLength
ÜÜH Q
:
ÜÜQ R
$num
ÜÜS U
,
ÜÜU V
nullable
ÜÜW _
:
ÜÜ_ `
true
ÜÜa e
)
ÜÜe f
,
ÜÜf g
UserId
áá 
=
áá 
table
áá "
.
áá" #
Column
áá# )
<
áá) *
Guid
áá* .
>
áá. /
(
áá/ 0
type
áá0 4
:
áá4 5
$str
áá6 H
,
ááH I
nullable
ááJ R
:
ááR S
true
ááT X
)
ááX Y
,
ááY Z
UserName
àà 
=
àà 
table
àà $
.
àà$ %
Column
àà% +
<
àà+ ,
string
àà, 2
>
àà2 3
(
àà3 4
type
àà4 8
:
àà8 9
$str
àà: I
,
ààI J
	maxLength
ààK T
:
ààT U
$num
ààV Y
,
ààY Z
nullable
àà[ c
:
ààc d
true
ààe i
)
àài j
,
ààj k

TenantName
ââ 
=
ââ  
table
ââ! &
.
ââ& '
Column
ââ' -
<
ââ- .
string
ââ. 4
>
ââ4 5
(
ââ5 6
type
ââ6 :
:
ââ: ;
$str
ââ< J
,
ââJ K
	maxLength
ââL U
:
ââU V
$num
ââW Y
,
ââY Z
nullable
ââ[ c
:
ââc d
true
ââe i
)
ââi j
,
ââj k
ClientId
ää 
=
ää 
table
ää $
.
ää$ %
Column
ää% +
<
ää+ ,
string
ää, 2
>
ää2 3
(
ää3 4
type
ää4 8
:
ää8 9
$str
ää: H
,
ääH I
	maxLength
ääJ S
:
ääS T
$num
ääU W
,
ääW X
nullable
ääY a
:
ääa b
true
ääc g
)
ääg h
,
ääh i
CorrelationId
ãã !
=
ãã" #
table
ãã$ )
.
ãã) *
Column
ãã* 0
<
ãã0 1
string
ãã1 7
>
ãã7 8
(
ãã8 9
type
ãã9 =
:
ãã= >
$str
ãã? M
,
ããM N
	maxLength
ããO X
:
ããX Y
$num
ããZ \
,
ãã\ ]
nullable
ãã^ f
:
ããf g
true
ããh l
)
ããl m
,
ããm n
ClientIpAddress
åå #
=
åå$ %
table
åå& +
.
åå+ ,
Column
åå, 2
<
åå2 3
string
åå3 9
>
åå9 :
(
åå: ;
type
åå; ?
:
åå? @
$str
ååA O
,
ååO P
	maxLength
ååQ Z
:
ååZ [
$num
åå\ ^
,
åå^ _
nullable
åå` h
:
ååh i
true
ååj n
)
åån o
,
ååo p
BrowserInfo
çç 
=
çç  !
table
çç" '
.
çç' (
Column
çç( .
<
çç. /
string
çç/ 5
>
çç5 6
(
çç6 7
type
çç7 ;
:
çç; <
$str
çç= L
,
ççL M
	maxLength
ççN W
:
ççW X
$num
ççY \
,
çç\ ]
nullable
çç^ f
:
ççf g
true
ççh l
)
ççl m
,
ççm n
CreationTime
éé  
=
éé! "
table
éé# (
.
éé( )
Column
éé) /
<
éé/ 0
DateTime
éé0 8
>
éé8 9
(
éé9 :
type
éé: >
:
éé> ?
$str
éé@ K
,
ééK L
nullable
ééM U
:
ééU V
false
ééW \
)
éé\ ]
,
éé] ^
ExtraProperties
èè #
=
èè$ %
table
èè& +
.
èè+ ,
Column
èè, 2
<
èè2 3
string
èè3 9
>
èè9 :
(
èè: ;
type
èè; ?
:
èè? @
$str
èèA P
,
èèP Q
nullable
èèR Z
:
èèZ [
false
èè\ a
)
èèa b
,
èèb c
ConcurrencyStamp
êê $
=
êê% &
table
êê' ,
.
êê, -
Column
êê- 3
<
êê3 4
string
êê4 :
>
êê: ;
(
êê; <
type
êê< @
:
êê@ A
$str
êêB P
,
êêP Q
	maxLength
êêR [
:
êê[ \
$num
êê] _
,
êê_ `
nullable
êêa i
:
êêi j
false
êêk p
)
êêp q
}
ëë 
,
ëë 
constraints
íí 
:
íí 
table
íí "
=>
íí# %
{
ìì 
table
îî 
.
îî 

PrimaryKey
îî $
(
îî$ %
$str
îî% 9
,
îî9 :
x
îî; <
=>
îî= ?
x
îî@ A
.
îîA B
Id
îîB D
)
îîD E
;
îîE F
}
ïï 
)
ïï 
;
ïï 
migrationBuilder
óó 
.
óó 
CreateTable
óó (
(
óó( )
name
òò 
:
òò 
$str
òò #
,
òò# $
columns
ôô 
:
ôô 
table
ôô 
=>
ôô !
new
ôô" %
{
öö 
Id
õõ 
=
õõ 
table
õõ 
.
õõ 
Column
õõ %
<
õõ% &
Guid
õõ& *
>
õõ* +
(
õõ+ ,
type
õõ, 0
:
õõ0 1
$str
õõ2 D
,
õõD E
nullable
õõF N
:
õõN O
false
õõP U
)
õõU V
,
õõV W
	SessionId
úú 
=
úú 
table
úú  %
.
úú% &
Column
úú& ,
<
úú, -
string
úú- 3
>
úú3 4
(
úú4 5
type
úú5 9
:
úú9 :
$str
úú; J
,
úúJ K
	maxLength
úúL U
:
úúU V
$num
úúW Z
,
úúZ [
nullable
úú\ d
:
úúd e
false
úúf k
)
úúk l
,
úúl m
Device
ùù 
=
ùù 
table
ùù "
.
ùù" #
Column
ùù# )
<
ùù) *
string
ùù* 0
>
ùù0 1
(
ùù1 2
type
ùù2 6
:
ùù6 7
$str
ùù8 F
,
ùùF G
	maxLength
ùùH Q
:
ùùQ R
$num
ùùS U
,
ùùU V
nullable
ùùW _
:
ùù_ `
false
ùùa f
)
ùùf g
,
ùùg h

DeviceInfo
ûû 
=
ûû  
table
ûû! &
.
ûû& '
Column
ûû' -
<
ûû- .
string
ûû. 4
>
ûû4 5
(
ûû5 6
type
ûû6 :
:
ûû: ;
$str
ûû< J
,
ûûJ K
	maxLength
ûûL U
:
ûûU V
$num
ûûW Y
,
ûûY Z
nullable
ûû[ c
:
ûûc d
true
ûûe i
)
ûûi j
,
ûûj k
TenantId
üü 
=
üü 
table
üü $
.
üü$ %
Column
üü% +
<
üü+ ,
Guid
üü, 0
>
üü0 1
(
üü1 2
type
üü2 6
:
üü6 7
$str
üü8 J
,
üüJ K
nullable
üüL T
:
üüT U
true
üüV Z
)
üüZ [
,
üü[ \
UserId
†† 
=
†† 
table
†† "
.
††" #
Column
††# )
<
††) *
Guid
††* .
>
††. /
(
††/ 0
type
††0 4
:
††4 5
$str
††6 H
,
††H I
nullable
††J R
:
††R S
false
††T Y
)
††Y Z
,
††Z [
ClientId
°° 
=
°° 
table
°° $
.
°°$ %
Column
°°% +
<
°°+ ,
string
°°, 2
>
°°2 3
(
°°3 4
type
°°4 8
:
°°8 9
$str
°°: H
,
°°H I
	maxLength
°°J S
:
°°S T
$num
°°U W
,
°°W X
nullable
°°Y a
:
°°a b
true
°°c g
)
°°g h
,
°°h i
IpAddresses
¢¢ 
=
¢¢  !
table
¢¢" '
.
¢¢' (
Column
¢¢( .
<
¢¢. /
string
¢¢/ 5
>
¢¢5 6
(
¢¢6 7
type
¢¢7 ;
:
¢¢; <
$str
¢¢= L
,
¢¢L M
	maxLength
¢¢N W
:
¢¢W X
$num
¢¢Y \
,
¢¢\ ]
nullable
¢¢^ f
:
¢¢f g
true
¢¢h l
)
¢¢l m
,
¢¢m n
SignedIn
££ 
=
££ 
table
££ $
.
££$ %
Column
££% +
<
££+ ,
DateTime
££, 4
>
££4 5
(
££5 6
type
££6 :
:
££: ;
$str
££< G
,
££G H
nullable
££I Q
:
££Q R
false
££S X
)
££X Y
,
££Y Z
LastAccessed
§§  
=
§§! "
table
§§# (
.
§§( )
Column
§§) /
<
§§/ 0
DateTime
§§0 8
>
§§8 9
(
§§9 :
type
§§: >
:
§§> ?
$str
§§@ K
,
§§K L
nullable
§§M U
:
§§U V
true
§§W [
)
§§[ \
}
•• 
,
•• 
constraints
¶¶ 
:
¶¶ 
table
¶¶ "
=>
¶¶# %
{
ßß 
table
®® 
.
®® 

PrimaryKey
®® $
(
®®$ %
$str
®®% 5
,
®®5 6
x
®®7 8
=>
®®9 ;
x
®®< =
.
®®= >
Id
®®> @
)
®®@ A
;
®®A B
}
©© 
)
©© 
;
©© 
migrationBuilder
´´ 
.
´´ 
CreateTable
´´ (
(
´´( )
name
¨¨ 
:
¨¨ 
$str
¨¨ -
,
¨¨- .
columns
≠≠ 
:
≠≠ 
table
≠≠ 
=>
≠≠ !
new
≠≠" %
{
ÆÆ 
Id
ØØ 
=
ØØ 
table
ØØ 
.
ØØ 
Column
ØØ %
<
ØØ% &
Guid
ØØ& *
>
ØØ* +
(
ØØ+ ,
type
ØØ, 0
:
ØØ0 1
$str
ØØ2 D
,
ØØD E
nullable
ØØF N
:
ØØN O
false
ØØP U
)
ØØU V
,
ØØV W
Name
∞∞ 
=
∞∞ 
table
∞∞  
.
∞∞  !
Column
∞∞! '
<
∞∞' (
string
∞∞( .
>
∞∞. /
(
∞∞/ 0
type
∞∞0 4
:
∞∞4 5
$str
∞∞6 E
,
∞∞E F
	maxLength
∞∞G P
:
∞∞P Q
$num
∞∞R U
,
∞∞U V
nullable
∞∞W _
:
∞∞_ `
false
∞∞a f
)
∞∞f g
,
∞∞g h
DisplayName
±± 
=
±±  !
table
±±" '
.
±±' (
Column
±±( .
<
±±. /
string
±±/ 5
>
±±5 6
(
±±6 7
type
±±7 ;
:
±±; <
$str
±±= L
,
±±L M
	maxLength
±±N W
:
±±W X
$num
±±Y \
,
±±\ ]
nullable
±±^ f
:
±±f g
false
±±h m
)
±±m n
,
±±n o
Description
≤≤ 
=
≤≤  !
table
≤≤" '
.
≤≤' (
Column
≤≤( .
<
≤≤. /
string
≤≤/ 5
>
≤≤5 6
(
≤≤6 7
type
≤≤7 ;
:
≤≤; <
$str
≤≤= L
,
≤≤L M
	maxLength
≤≤N W
:
≤≤W X
$num
≤≤Y \
,
≤≤\ ]
nullable
≤≤^ f
:
≤≤f g
true
≤≤h l
)
≤≤l m
,
≤≤m n
DefaultValue
≥≥  
=
≥≥! "
table
≥≥# (
.
≥≥( )
Column
≥≥) /
<
≥≥/ 0
string
≥≥0 6
>
≥≥6 7
(
≥≥7 8
type
≥≥8 <
:
≥≥< =
$str
≥≥> N
,
≥≥N O
	maxLength
≥≥P Y
:
≥≥Y Z
$num
≥≥[ _
,
≥≥_ `
nullable
≥≥a i
:
≥≥i j
true
≥≥k o
)
≥≥o p
,
≥≥p q 
IsVisibleToClients
¥¥ &
=
¥¥' (
table
¥¥) .
.
¥¥. /
Column
¥¥/ 5
<
¥¥5 6
bool
¥¥6 :
>
¥¥: ;
(
¥¥; <
type
¥¥< @
:
¥¥@ A
$str
¥¥B G
,
¥¥G H
nullable
¥¥I Q
:
¥¥Q R
false
¥¥S X
)
¥¥X Y
,
¥¥Y Z
	Providers
µµ 
=
µµ 
table
µµ  %
.
µµ% &
Column
µµ& ,
<
µµ, -
string
µµ- 3
>
µµ3 4
(
µµ4 5
type
µµ5 9
:
µµ9 :
$str
µµ; K
,
µµK L
	maxLength
µµM V
:
µµV W
$num
µµX \
,
µµ\ ]
nullable
µµ^ f
:
µµf g
true
µµh l
)
µµl m
,
µµm n
IsInherited
∂∂ 
=
∂∂  !
table
∂∂" '
.
∂∂' (
Column
∂∂( .
<
∂∂. /
bool
∂∂/ 3
>
∂∂3 4
(
∂∂4 5
type
∂∂5 9
:
∂∂9 :
$str
∂∂; @
,
∂∂@ A
nullable
∂∂B J
:
∂∂J K
false
∂∂L Q
)
∂∂Q R
,
∂∂R S
IsEncrypted
∑∑ 
=
∑∑  !
table
∑∑" '
.
∑∑' (
Column
∑∑( .
<
∑∑. /
bool
∑∑/ 3
>
∑∑3 4
(
∑∑4 5
type
∑∑5 9
:
∑∑9 :
$str
∑∑; @
,
∑∑@ A
nullable
∑∑B J
:
∑∑J K
false
∑∑L Q
)
∑∑Q R
,
∑∑R S
ExtraProperties
∏∏ #
=
∏∏$ %
table
∏∏& +
.
∏∏+ ,
Column
∏∏, 2
<
∏∏2 3
string
∏∏3 9
>
∏∏9 :
(
∏∏: ;
type
∏∏; ?
:
∏∏? @
$str
∏∏A P
,
∏∏P Q
nullable
∏∏R Z
:
∏∏Z [
true
∏∏\ `
)
∏∏` a
}
ππ 
,
ππ 
constraints
∫∫ 
:
∫∫ 
table
∫∫ "
=>
∫∫# %
{
ªª 
table
ºº 
.
ºº 

PrimaryKey
ºº $
(
ºº$ %
$str
ºº% ?
,
ºº? @
x
ººA B
=>
ººC E
x
ººF G
.
ººG H
Id
ººH J
)
ººJ K
;
ººK L
}
ΩΩ 
)
ΩΩ 
;
ΩΩ 
migrationBuilder
øø 
.
øø 
CreateTable
øø (
(
øø( )
name
¿¿ 
:
¿¿ 
$str
¿¿ #
,
¿¿# $
columns
¡¡ 
:
¡¡ 
table
¡¡ 
=>
¡¡ !
new
¡¡" %
{
¬¬ 
Id
√√ 
=
√√ 
table
√√ 
.
√√ 
Column
√√ %
<
√√% &
Guid
√√& *
>
√√* +
(
√√+ ,
type
√√, 0
:
√√0 1
$str
√√2 D
,
√√D E
nullable
√√F N
:
√√N O
false
√√P U
)
√√U V
,
√√V W
Name
ƒƒ 
=
ƒƒ 
table
ƒƒ  
.
ƒƒ  !
Column
ƒƒ! '
<
ƒƒ' (
string
ƒƒ( .
>
ƒƒ. /
(
ƒƒ/ 0
type
ƒƒ0 4
:
ƒƒ4 5
$str
ƒƒ6 E
,
ƒƒE F
	maxLength
ƒƒG P
:
ƒƒP Q
$num
ƒƒR U
,
ƒƒU V
nullable
ƒƒW _
:
ƒƒ_ `
false
ƒƒa f
)
ƒƒf g
,
ƒƒg h
Value
≈≈ 
=
≈≈ 
table
≈≈ !
.
≈≈! "
Column
≈≈" (
<
≈≈( )
string
≈≈) /
>
≈≈/ 0
(
≈≈0 1
type
≈≈1 5
:
≈≈5 6
$str
≈≈7 G
,
≈≈G H
	maxLength
≈≈I R
:
≈≈R S
$num
≈≈T X
,
≈≈X Y
nullable
≈≈Z b
:
≈≈b c
false
≈≈d i
)
≈≈i j
,
≈≈j k
ProviderName
∆∆  
=
∆∆! "
table
∆∆# (
.
∆∆( )
Column
∆∆) /
<
∆∆/ 0
string
∆∆0 6
>
∆∆6 7
(
∆∆7 8
type
∆∆8 <
:
∆∆< =
$str
∆∆> L
,
∆∆L M
	maxLength
∆∆N W
:
∆∆W X
$num
∆∆Y [
,
∆∆[ \
nullable
∆∆] e
:
∆∆e f
true
∆∆g k
)
∆∆k l
,
∆∆l m
ProviderKey
«« 
=
««  !
table
««" '
.
««' (
Column
««( .
<
««. /
string
««/ 5
>
««5 6
(
««6 7
type
««7 ;
:
««; <
$str
««= K
,
««K L
	maxLength
««M V
:
««V W
$num
««X Z
,
««Z [
nullable
««\ d
:
««d e
true
««f j
)
««j k
}
»» 
,
»» 
constraints
…… 
:
…… 
table
…… "
=>
……# %
{
   
table
ÀÀ 
.
ÀÀ 

PrimaryKey
ÀÀ $
(
ÀÀ$ %
$str
ÀÀ% 5
,
ÀÀ5 6
x
ÀÀ7 8
=>
ÀÀ9 ;
x
ÀÀ< =
.
ÀÀ= >
Id
ÀÀ> @
)
ÀÀ@ A
;
ÀÀA B
}
ÃÃ 
)
ÃÃ 
;
ÃÃ 
migrationBuilder
ŒŒ 
.
ŒŒ 
CreateTable
ŒŒ (
(
ŒŒ( )
name
œœ 
:
œœ 
$str
œœ "
,
œœ" #
columns
–– 
:
–– 
table
–– 
=>
–– !
new
––" %
{
—— 
Id
““ 
=
““ 
table
““ 
.
““ 
Column
““ %
<
““% &
Guid
““& *
>
““* +
(
““+ ,
type
““, 0
:
““0 1
$str
““2 D
,
““D E
nullable
““F N
:
““N O
false
““P U
)
““U V
,
““V W
Name
”” 
=
”” 
table
””  
.
””  !
Column
””! '
<
””' (
string
””( .
>
””. /
(
””/ 0
type
””0 4
:
””4 5
$str
””6 D
,
””D E
	maxLength
””F O
:
””O P
$num
””Q S
,
””S T
nullable
””U ]
:
””] ^
false
””_ d
)
””d e
,
””e f
NormalizedName
‘‘ "
=
‘‘# $
table
‘‘% *
.
‘‘* +
Column
‘‘+ 1
<
‘‘1 2
string
‘‘2 8
>
‘‘8 9
(
‘‘9 :
type
‘‘: >
:
‘‘> ?
$str
‘‘@ N
,
‘‘N O
	maxLength
‘‘P Y
:
‘‘Y Z
$num
‘‘[ ]
,
‘‘] ^
nullable
‘‘_ g
:
‘‘g h
false
‘‘i n
)
‘‘n o
,
‘‘o p
EntityVersion
’’ !
=
’’" #
table
’’$ )
.
’’) *
Column
’’* 0
<
’’0 1
int
’’1 4
>
’’4 5
(
’’5 6
type
’’6 :
:
’’: ;
$str
’’< A
,
’’A B
nullable
’’C K
:
’’K L
false
’’M R
)
’’R S
,
’’S T
ExtraProperties
÷÷ #
=
÷÷$ %
table
÷÷& +
.
÷÷+ ,
Column
÷÷, 2
<
÷÷2 3
string
÷÷3 9
>
÷÷9 :
(
÷÷: ;
type
÷÷; ?
:
÷÷? @
$str
÷÷A P
,
÷÷P Q
nullable
÷÷R Z
:
÷÷Z [
false
÷÷\ a
)
÷÷a b
,
÷÷b c
ConcurrencyStamp
◊◊ $
=
◊◊% &
table
◊◊' ,
.
◊◊, -
Column
◊◊- 3
<
◊◊3 4
string
◊◊4 :
>
◊◊: ;
(
◊◊; <
type
◊◊< @
:
◊◊@ A
$str
◊◊B P
,
◊◊P Q
	maxLength
◊◊R [
:
◊◊[ \
$num
◊◊] _
,
◊◊_ `
nullable
◊◊a i
:
◊◊i j
false
◊◊k p
)
◊◊p q
,
◊◊q r
CreationTime
ÿÿ  
=
ÿÿ! "
table
ÿÿ# (
.
ÿÿ( )
Column
ÿÿ) /
<
ÿÿ/ 0
DateTime
ÿÿ0 8
>
ÿÿ8 9
(
ÿÿ9 :
type
ÿÿ: >
:
ÿÿ> ?
$str
ÿÿ@ K
,
ÿÿK L
nullable
ÿÿM U
:
ÿÿU V
false
ÿÿW \
)
ÿÿ\ ]
,
ÿÿ] ^
	CreatorId
ŸŸ 
=
ŸŸ 
table
ŸŸ  %
.
ŸŸ% &
Column
ŸŸ& ,
<
ŸŸ, -
Guid
ŸŸ- 1
>
ŸŸ1 2
(
ŸŸ2 3
type
ŸŸ3 7
:
ŸŸ7 8
$str
ŸŸ9 K
,
ŸŸK L
nullable
ŸŸM U
:
ŸŸU V
true
ŸŸW [
)
ŸŸ[ \
,
ŸŸ\ ]"
LastModificationTime
⁄⁄ (
=
⁄⁄) *
table
⁄⁄+ 0
.
⁄⁄0 1
Column
⁄⁄1 7
<
⁄⁄7 8
DateTime
⁄⁄8 @
>
⁄⁄@ A
(
⁄⁄A B
type
⁄⁄B F
:
⁄⁄F G
$str
⁄⁄H S
,
⁄⁄S T
nullable
⁄⁄U ]
:
⁄⁄] ^
true
⁄⁄_ c
)
⁄⁄c d
,
⁄⁄d e
LastModifierId
€€ "
=
€€# $
table
€€% *
.
€€* +
Column
€€+ 1
<
€€1 2
Guid
€€2 6
>
€€6 7
(
€€7 8
type
€€8 <
:
€€< =
$str
€€> P
,
€€P Q
nullable
€€R Z
:
€€Z [
true
€€\ `
)
€€` a
,
€€a b
	IsDeleted
‹‹ 
=
‹‹ 
table
‹‹  %
.
‹‹% &
Column
‹‹& ,
<
‹‹, -
bool
‹‹- 1
>
‹‹1 2
(
‹‹2 3
type
‹‹3 7
:
‹‹7 8
$str
‹‹9 >
,
‹‹> ?
nullable
‹‹@ H
:
‹‹H I
false
‹‹J O
,
‹‹O P
defaultValue
‹‹Q ]
:
‹‹] ^
false
‹‹_ d
)
‹‹d e
,
‹‹e f
	DeleterId
›› 
=
›› 
table
››  %
.
››% &
Column
››& ,
<
››, -
Guid
››- 1
>
››1 2
(
››2 3
type
››3 7
:
››7 8
$str
››9 K
,
››K L
nullable
››M U
:
››U V
true
››W [
)
››[ \
,
››\ ]
DeletionTime
ﬁﬁ  
=
ﬁﬁ! "
table
ﬁﬁ# (
.
ﬁﬁ( )
Column
ﬁﬁ) /
<
ﬁﬁ/ 0
DateTime
ﬁﬁ0 8
>
ﬁﬁ8 9
(
ﬁﬁ9 :
type
ﬁﬁ: >
:
ﬁﬁ> ?
$str
ﬁﬁ@ K
,
ﬁﬁK L
nullable
ﬁﬁM U
:
ﬁﬁU V
true
ﬁﬁW [
)
ﬁﬁ[ \
}
ﬂﬂ 
,
ﬂﬂ 
constraints
‡‡ 
:
‡‡ 
table
‡‡ "
=>
‡‡# %
{
·· 
table
‚‚ 
.
‚‚ 

PrimaryKey
‚‚ $
(
‚‚$ %
$str
‚‚% 4
,
‚‚4 5
x
‚‚6 7
=>
‚‚8 :
x
‚‚; <
.
‚‚< =
Id
‚‚= ?
)
‚‚? @
;
‚‚@ A
}
„„ 
)
„„ 
;
„„ 
migrationBuilder
ÂÂ 
.
ÂÂ 
CreateTable
ÂÂ (
(
ÂÂ( )
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ *
,
ÊÊ* +
columns
ÁÁ 
:
ÁÁ 
table
ÁÁ 
=>
ÁÁ !
new
ÁÁ" %
{
ËË 
Id
ÈÈ 
=
ÈÈ 
table
ÈÈ 
.
ÈÈ 
Column
ÈÈ %
<
ÈÈ% &
Guid
ÈÈ& *
>
ÈÈ* +
(
ÈÈ+ ,
type
ÈÈ, 0
:
ÈÈ0 1
$str
ÈÈ2 D
,
ÈÈD E
nullable
ÈÈF N
:
ÈÈN O
false
ÈÈP U
)
ÈÈU V
,
ÈÈV W
TenantId
ÍÍ 
=
ÍÍ 
table
ÍÍ $
.
ÍÍ$ %
Column
ÍÍ% +
<
ÍÍ+ ,
Guid
ÍÍ, 0
>
ÍÍ0 1
(
ÍÍ1 2
type
ÍÍ2 6
:
ÍÍ6 7
$str
ÍÍ8 J
,
ÍÍJ K
nullable
ÍÍL T
:
ÍÍT U
true
ÍÍV Z
)
ÍÍZ [
,
ÍÍ[ \
SourceUserId
ÎÎ  
=
ÎÎ! "
table
ÎÎ# (
.
ÎÎ( )
Column
ÎÎ) /
<
ÎÎ/ 0
Guid
ÎÎ0 4
>
ÎÎ4 5
(
ÎÎ5 6
type
ÎÎ6 :
:
ÎÎ: ;
$str
ÎÎ< N
,
ÎÎN O
nullable
ÎÎP X
:
ÎÎX Y
false
ÎÎZ _
)
ÎÎ_ `
,
ÎÎ` a
TargetUserId
ÏÏ  
=
ÏÏ! "
table
ÏÏ# (
.
ÏÏ( )
Column
ÏÏ) /
<
ÏÏ/ 0
Guid
ÏÏ0 4
>
ÏÏ4 5
(
ÏÏ5 6
type
ÏÏ6 :
:
ÏÏ: ;
$str
ÏÏ< N
,
ÏÏN O
nullable
ÏÏP X
:
ÏÏX Y
false
ÏÏZ _
)
ÏÏ_ `
,
ÏÏ` a
	StartTime
ÌÌ 
=
ÌÌ 
table
ÌÌ  %
.
ÌÌ% &
Column
ÌÌ& ,
<
ÌÌ, -
DateTime
ÌÌ- 5
>
ÌÌ5 6
(
ÌÌ6 7
type
ÌÌ7 ;
:
ÌÌ; <
$str
ÌÌ= H
,
ÌÌH I
nullable
ÌÌJ R
:
ÌÌR S
false
ÌÌT Y
)
ÌÌY Z
,
ÌÌZ [
EndTime
ÓÓ 
=
ÓÓ 
table
ÓÓ #
.
ÓÓ# $
Column
ÓÓ$ *
<
ÓÓ* +
DateTime
ÓÓ+ 3
>
ÓÓ3 4
(
ÓÓ4 5
type
ÓÓ5 9
:
ÓÓ9 :
$str
ÓÓ; F
,
ÓÓF G
nullable
ÓÓH P
:
ÓÓP Q
false
ÓÓR W
)
ÓÓW X
}
ÔÔ 
,
ÔÔ 
constraints
 
:
 
table
 "
=>
# %
{
ÒÒ 
table
ÚÚ 
.
ÚÚ 

PrimaryKey
ÚÚ $
(
ÚÚ$ %
$str
ÚÚ% <
,
ÚÚ< =
x
ÚÚ> ?
=>
ÚÚ@ B
x
ÚÚC D
.
ÚÚD E
Id
ÚÚE G
)
ÚÚG H
;
ÚÚH I
}
ÛÛ 
)
ÛÛ 
;
ÛÛ 
migrationBuilder
ıı 
.
ıı 
CreateTable
ıı (
(
ıı( )
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ  
,
ˆˆ  !
columns
˜˜ 
:
˜˜ 
table
˜˜ 
=>
˜˜ !
new
˜˜" %
{
¯¯ 
Id
˘˘ 
=
˘˘ 
table
˘˘ 
.
˘˘ 
Column
˘˘ %
<
˘˘% &
Guid
˘˘& *
>
˘˘* +
(
˘˘+ ,
type
˘˘, 0
:
˘˘0 1
$str
˘˘2 D
,
˘˘D E
nullable
˘˘F N
:
˘˘N O
false
˘˘P U
)
˘˘U V
,
˘˘V W
TenantId
˙˙ 
=
˙˙ 
table
˙˙ $
.
˙˙$ %
Column
˙˙% +
<
˙˙+ ,
Guid
˙˙, 0
>
˙˙0 1
(
˙˙1 2
type
˙˙2 6
:
˙˙6 7
$str
˙˙8 J
,
˙˙J K
nullable
˙˙L T
:
˙˙T U
true
˙˙V Z
)
˙˙Z [
,
˙˙[ \
UserName
˚˚ 
=
˚˚ 
table
˚˚ $
.
˚˚$ %
Column
˚˚% +
<
˚˚+ ,
string
˚˚, 2
>
˚˚2 3
(
˚˚3 4
type
˚˚4 8
:
˚˚8 9
$str
˚˚: I
,
˚˚I J
	maxLength
˚˚K T
:
˚˚T U
$num
˚˚V Y
,
˚˚Y Z
nullable
˚˚[ c
:
˚˚c d
false
˚˚e j
)
˚˚j k
,
˚˚k l 
NormalizedUserName
¸¸ &
=
¸¸' (
table
¸¸) .
.
¸¸. /
Column
¸¸/ 5
<
¸¸5 6
string
¸¸6 <
>
¸¸< =
(
¸¸= >
type
¸¸> B
:
¸¸B C
$str
¸¸D S
,
¸¸S T
	maxLength
¸¸U ^
:
¸¸^ _
$num
¸¸` c
,
¸¸c d
nullable
¸¸e m
:
¸¸m n
false
¸¸o t
)
¸¸t u
,
¸¸u v
Name
˝˝ 
=
˝˝ 
table
˝˝  
.
˝˝  !
Column
˝˝! '
<
˝˝' (
string
˝˝( .
>
˝˝. /
(
˝˝/ 0
type
˝˝0 4
:
˝˝4 5
$str
˝˝6 D
,
˝˝D E
	maxLength
˝˝F O
:
˝˝O P
$num
˝˝Q S
,
˝˝S T
nullable
˝˝U ]
:
˝˝] ^
true
˝˝_ c
)
˝˝c d
,
˝˝d e
Surname
˛˛ 
=
˛˛ 
table
˛˛ #
.
˛˛# $
Column
˛˛$ *
<
˛˛* +
string
˛˛+ 1
>
˛˛1 2
(
˛˛2 3
type
˛˛3 7
:
˛˛7 8
$str
˛˛9 G
,
˛˛G H
	maxLength
˛˛I R
:
˛˛R S
$num
˛˛T V
,
˛˛V W
nullable
˛˛X `
:
˛˛` a
true
˛˛b f
)
˛˛f g
,
˛˛g h
Email
ˇˇ 
=
ˇˇ 
table
ˇˇ !
.
ˇˇ! "
Column
ˇˇ" (
<
ˇˇ( )
string
ˇˇ) /
>
ˇˇ/ 0
(
ˇˇ0 1
type
ˇˇ1 5
:
ˇˇ5 6
$str
ˇˇ7 F
,
ˇˇF G
	maxLength
ˇˇH Q
:
ˇˇQ R
$num
ˇˇS V
,
ˇˇV W
nullable
ˇˇX `
:
ˇˇ` a
false
ˇˇb g
)
ˇˇg h
,
ˇˇh i
NormalizedEmail
ÄÄ #
=
ÄÄ$ %
table
ÄÄ& +
.
ÄÄ+ ,
Column
ÄÄ, 2
<
ÄÄ2 3
string
ÄÄ3 9
>
ÄÄ9 :
(
ÄÄ: ;
type
ÄÄ; ?
:
ÄÄ? @
$str
ÄÄA P
,
ÄÄP Q
	maxLength
ÄÄR [
:
ÄÄ[ \
$num
ÄÄ] `
,
ÄÄ` a
nullable
ÄÄb j
:
ÄÄj k
false
ÄÄl q
)
ÄÄq r
,
ÄÄr s
EmailConfirmed
ÅÅ "
=
ÅÅ# $
table
ÅÅ% *
.
ÅÅ* +
Column
ÅÅ+ 1
<
ÅÅ1 2
bool
ÅÅ2 6
>
ÅÅ6 7
(
ÅÅ7 8
type
ÅÅ8 <
:
ÅÅ< =
$str
ÅÅ> C
,
ÅÅC D
nullable
ÅÅE M
:
ÅÅM N
false
ÅÅO T
,
ÅÅT U
defaultValue
ÅÅV b
:
ÅÅb c
false
ÅÅd i
)
ÅÅi j
,
ÅÅj k
PasswordHash
ÇÇ  
=
ÇÇ! "
table
ÇÇ# (
.
ÇÇ( )
Column
ÇÇ) /
<
ÇÇ/ 0
string
ÇÇ0 6
>
ÇÇ6 7
(
ÇÇ7 8
type
ÇÇ8 <
:
ÇÇ< =
$str
ÇÇ> M
,
ÇÇM N
	maxLength
ÇÇO X
:
ÇÇX Y
$num
ÇÇZ ]
,
ÇÇ] ^
nullable
ÇÇ_ g
:
ÇÇg h
true
ÇÇi m
)
ÇÇm n
,
ÇÇn o
SecurityStamp
ÉÉ !
=
ÉÉ" #
table
ÉÉ$ )
.
ÉÉ) *
Column
ÉÉ* 0
<
ÉÉ0 1
string
ÉÉ1 7
>
ÉÉ7 8
(
ÉÉ8 9
type
ÉÉ9 =
:
ÉÉ= >
$str
ÉÉ? N
,
ÉÉN O
	maxLength
ÉÉP Y
:
ÉÉY Z
$num
ÉÉ[ ^
,
ÉÉ^ _
nullable
ÉÉ` h
:
ÉÉh i
false
ÉÉj o
)
ÉÉo p
,
ÉÉp q

IsExternal
ÑÑ 
=
ÑÑ  
table
ÑÑ! &
.
ÑÑ& '
Column
ÑÑ' -
<
ÑÑ- .
bool
ÑÑ. 2
>
ÑÑ2 3
(
ÑÑ3 4
type
ÑÑ4 8
:
ÑÑ8 9
$str
ÑÑ: ?
,
ÑÑ? @
nullable
ÑÑA I
:
ÑÑI J
false
ÑÑK P
,
ÑÑP Q
defaultValue
ÑÑR ^
:
ÑÑ^ _
false
ÑÑ` e
)
ÑÑe f
,
ÑÑf g
PhoneNumber
ÖÖ 
=
ÖÖ  !
table
ÖÖ" '
.
ÖÖ' (
Column
ÖÖ( .
<
ÖÖ. /
string
ÖÖ/ 5
>
ÖÖ5 6
(
ÖÖ6 7
type
ÖÖ7 ;
:
ÖÖ; <
$str
ÖÖ= K
,
ÖÖK L
	maxLength
ÖÖM V
:
ÖÖV W
$num
ÖÖX Z
,
ÖÖZ [
nullable
ÖÖ\ d
:
ÖÖd e
true
ÖÖf j
)
ÖÖj k
,
ÖÖk l"
PhoneNumberConfirmed
ÜÜ (
=
ÜÜ) *
table
ÜÜ+ 0
.
ÜÜ0 1
Column
ÜÜ1 7
<
ÜÜ7 8
bool
ÜÜ8 <
>
ÜÜ< =
(
ÜÜ= >
type
ÜÜ> B
:
ÜÜB C
$str
ÜÜD I
,
ÜÜI J
nullable
ÜÜK S
:
ÜÜS T
false
ÜÜU Z
,
ÜÜZ [
defaultValue
ÜÜ\ h
:
ÜÜh i
false
ÜÜj o
)
ÜÜo p
,
ÜÜp q
IsActive
áá 
=
áá 
table
áá $
.
áá$ %
Column
áá% +
<
áá+ ,
bool
áá, 0
>
áá0 1
(
áá1 2
type
áá2 6
:
áá6 7
$str
áá8 =
,
áá= >
nullable
áá? G
:
ááG H
false
ááI N
)
ááN O
,
ááO P
TwoFactorEnabled
àà $
=
àà% &
table
àà' ,
.
àà, -
Column
àà- 3
<
àà3 4
bool
àà4 8
>
àà8 9
(
àà9 :
type
àà: >
:
àà> ?
$str
àà@ E
,
ààE F
nullable
ààG O
:
ààO P
false
ààQ V
,
ààV W
defaultValue
ààX d
:
ààd e
false
ààf k
)
ààk l
,
ààl m

LockoutEnd
ââ 
=
ââ  
table
ââ! &
.
ââ& '
Column
ââ' -
<
ââ- .
DateTimeOffset
ââ. <
>
ââ< =
(
ââ= >
type
ââ> B
:
ââB C
$str
ââD T
,
ââT U
nullable
ââV ^
:
ââ^ _
true
ââ` d
)
ââd e
,
ââe f
LockoutEnabled
ää "
=
ää# $
table
ää% *
.
ää* +
Column
ää+ 1
<
ää1 2
bool
ää2 6
>
ää6 7
(
ää7 8
type
ää8 <
:
ää< =
$str
ää> C
,
ääC D
nullable
ääE M
:
ääM N
false
ääO T
,
ääT U
defaultValue
ääV b
:
ääb c
false
ääd i
)
ääi j
,
ääj k
AccessFailedCount
ãã %
=
ãã& '
table
ãã( -
.
ãã- .
Column
ãã. 4
<
ãã4 5
int
ãã5 8
>
ãã8 9
(
ãã9 :
type
ãã: >
:
ãã> ?
$str
ãã@ E
,
ããE F
nullable
ããG O
:
ããO P
false
ããQ V
,
ããV W
defaultValue
ããX d
:
ããd e
$num
ããf g
)
ããg h
,
ããh i-
ShouldChangePasswordOnNextLogin
åå 3
=
åå4 5
table
åå6 ;
.
åå; <
Column
åå< B
<
ååB C
bool
ååC G
>
ååG H
(
ååH I
type
ååI M
:
ååM N
$str
ååO T
,
ååT U
nullable
ååV ^
:
åå^ _
false
åå` e
)
ååe f
,
ååf g
EntityVersion
çç !
=
çç" #
table
çç$ )
.
çç) *
Column
çç* 0
<
çç0 1
int
çç1 4
>
çç4 5
(
çç5 6
type
çç6 :
:
çç: ;
$str
çç< A
,
ççA B
nullable
ççC K
:
ççK L
false
ççM R
)
ççR S
,
ççS T$
LastPasswordChangeTime
éé *
=
éé+ ,
table
éé- 2
.
éé2 3
Column
éé3 9
<
éé9 :
DateTimeOffset
éé: H
>
ééH I
(
ééI J
type
ééJ N
:
ééN O
$str
ééP `
,
éé` a
nullable
ééb j
:
ééj k
true
éél p
)
éép q
,
ééq r
ExtraProperties
èè #
=
èè$ %
table
èè& +
.
èè+ ,
Column
èè, 2
<
èè2 3
string
èè3 9
>
èè9 :
(
èè: ;
type
èè; ?
:
èè? @
$str
èèA P
,
èèP Q
nullable
èèR Z
:
èèZ [
false
èè\ a
)
èèa b
,
èèb c
ConcurrencyStamp
êê $
=
êê% &
table
êê' ,
.
êê, -
Column
êê- 3
<
êê3 4
string
êê4 :
>
êê: ;
(
êê; <
type
êê< @
:
êê@ A
$str
êêB P
,
êêP Q
	maxLength
êêR [
:
êê[ \
$num
êê] _
,
êê_ `
nullable
êêa i
:
êêi j
false
êêk p
)
êêp q
,
êêq r
CreationTime
ëë  
=
ëë! "
table
ëë# (
.
ëë( )
Column
ëë) /
<
ëë/ 0
DateTime
ëë0 8
>
ëë8 9
(
ëë9 :
type
ëë: >
:
ëë> ?
$str
ëë@ K
,
ëëK L
nullable
ëëM U
:
ëëU V
false
ëëW \
)
ëë\ ]
,
ëë] ^
	CreatorId
íí 
=
íí 
table
íí  %
.
íí% &
Column
íí& ,
<
íí, -
Guid
íí- 1
>
íí1 2
(
íí2 3
type
íí3 7
:
íí7 8
$str
íí9 K
,
ííK L
nullable
ííM U
:
ííU V
true
ííW [
)
íí[ \
,
íí\ ]"
LastModificationTime
ìì (
=
ìì) *
table
ìì+ 0
.
ìì0 1
Column
ìì1 7
<
ìì7 8
DateTime
ìì8 @
>
ìì@ A
(
ììA B
type
ììB F
:
ììF G
$str
ììH S
,
ììS T
nullable
ììU ]
:
ìì] ^
true
ìì_ c
)
ììc d
,
ììd e
LastModifierId
îî "
=
îî# $
table
îî% *
.
îî* +
Column
îî+ 1
<
îî1 2
Guid
îî2 6
>
îî6 7
(
îî7 8
type
îî8 <
:
îî< =
$str
îî> P
,
îîP Q
nullable
îîR Z
:
îîZ [
true
îî\ `
)
îî` a
,
îîa b
	IsDeleted
ïï 
=
ïï 
table
ïï  %
.
ïï% &
Column
ïï& ,
<
ïï, -
bool
ïï- 1
>
ïï1 2
(
ïï2 3
type
ïï3 7
:
ïï7 8
$str
ïï9 >
,
ïï> ?
nullable
ïï@ H
:
ïïH I
false
ïïJ O
,
ïïO P
defaultValue
ïïQ ]
:
ïï] ^
false
ïï_ d
)
ïïd e
,
ïïe f
	DeleterId
ññ 
=
ññ 
table
ññ  %
.
ññ% &
Column
ññ& ,
<
ññ, -
Guid
ññ- 1
>
ññ1 2
(
ññ2 3
type
ññ3 7
:
ññ7 8
$str
ññ9 K
,
ññK L
nullable
ññM U
:
ññU V
true
ññW [
)
ññ[ \
,
ññ\ ]
DeletionTime
óó  
=
óó! "
table
óó# (
.
óó( )
Column
óó) /
<
óó/ 0
DateTime
óó0 8
>
óó8 9
(
óó9 :
type
óó: >
:
óó> ?
$str
óó@ K
,
óóK L
nullable
óóM U
:
óóU V
true
óóW [
)
óó[ \
}
òò 
,
òò 
constraints
ôô 
:
ôô 
table
ôô "
=>
ôô# %
{
öö 
table
õõ 
.
õõ 

PrimaryKey
õõ $
(
õõ$ %
$str
õõ% 2
,
õõ2 3
x
õõ4 5
=>
õõ6 8
x
õõ9 :
.
õõ: ;
Id
õõ; =
)
õõ= >
;
õõ> ?
}
úú 
)
úú 
;
úú 
migrationBuilder
ûû 
.
ûû 
CreateTable
ûû (
(
ûû( )
name
üü 
:
üü 
$str
üü .
,
üü. /
columns
†† 
:
†† 
table
†† 
=>
†† !
new
††" %
{
°° 
Id
¢¢ 
=
¢¢ 
table
¢¢ 
.
¢¢ 
Column
¢¢ %
<
¢¢% &
Guid
¢¢& *
>
¢¢* +
(
¢¢+ ,
type
¢¢, 0
:
¢¢0 1
$str
¢¢2 D
,
¢¢D E
nullable
¢¢F N
:
¢¢N O
false
¢¢P U
)
¢¢U V
,
¢¢V W
ApplicationType
££ #
=
££$ %
table
££& +
.
££+ ,
Column
££, 2
<
££2 3
string
££3 9
>
££9 :
(
££: ;
type
££; ?
:
££? @
$str
££A O
,
££O P
	maxLength
££Q Z
:
££Z [
$num
££\ ^
,
££^ _
nullable
££` h
:
££h i
true
££j n
)
££n o
,
££o p
ClientId
§§ 
=
§§ 
table
§§ $
.
§§$ %
Column
§§% +
<
§§+ ,
string
§§, 2
>
§§2 3
(
§§3 4
type
§§4 8
:
§§8 9
$str
§§: I
,
§§I J
	maxLength
§§K T
:
§§T U
$num
§§V Y
,
§§Y Z
nullable
§§[ c
:
§§c d
true
§§e i
)
§§i j
,
§§j k
ClientSecret
••  
=
••! "
table
••# (
.
••( )
Column
••) /
<
••/ 0
string
••0 6
>
••6 7
(
••7 8
type
••8 <
:
••< =
$str
••> M
,
••M N
nullable
••O W
:
••W X
true
••Y ]
)
••] ^
,
••^ _

ClientType
¶¶ 
=
¶¶  
table
¶¶! &
.
¶¶& '
Column
¶¶' -
<
¶¶- .
string
¶¶. 4
>
¶¶4 5
(
¶¶5 6
type
¶¶6 :
:
¶¶: ;
$str
¶¶< J
,
¶¶J K
	maxLength
¶¶L U
:
¶¶U V
$num
¶¶W Y
,
¶¶Y Z
nullable
¶¶[ c
:
¶¶c d
true
¶¶e i
)
¶¶i j
,
¶¶j k
ConsentType
ßß 
=
ßß  !
table
ßß" '
.
ßß' (
Column
ßß( .
<
ßß. /
string
ßß/ 5
>
ßß5 6
(
ßß6 7
type
ßß7 ;
:
ßß; <
$str
ßß= K
,
ßßK L
	maxLength
ßßM V
:
ßßV W
$num
ßßX Z
,
ßßZ [
nullable
ßß\ d
:
ßßd e
true
ßßf j
)
ßßj k
,
ßßk l
DisplayName
®® 
=
®®  !
table
®®" '
.
®®' (
Column
®®( .
<
®®. /
string
®®/ 5
>
®®5 6
(
®®6 7
type
®®7 ;
:
®®; <
$str
®®= L
,
®®L M
nullable
®®N V
:
®®V W
true
®®X \
)
®®\ ]
,
®®] ^
DisplayNames
©©  
=
©©! "
table
©©# (
.
©©( )
Column
©©) /
<
©©/ 0
string
©©0 6
>
©©6 7
(
©©7 8
type
©©8 <
:
©©< =
$str
©©> M
,
©©M N
nullable
©©O W
:
©©W X
true
©©Y ]
)
©©] ^
,
©©^ _
JsonWebKeySet
™™ !
=
™™" #
table
™™$ )
.
™™) *
Column
™™* 0
<
™™0 1
string
™™1 7
>
™™7 8
(
™™8 9
type
™™9 =
:
™™= >
$str
™™? N
,
™™N O
nullable
™™P X
:
™™X Y
true
™™Z ^
)
™™^ _
,
™™_ `
Permissions
´´ 
=
´´  !
table
´´" '
.
´´' (
Column
´´( .
<
´´. /
string
´´/ 5
>
´´5 6
(
´´6 7
type
´´7 ;
:
´´; <
$str
´´= L
,
´´L M
nullable
´´N V
:
´´V W
true
´´X \
)
´´\ ]
,
´´] ^$
PostLogoutRedirectUris
¨¨ *
=
¨¨+ ,
table
¨¨- 2
.
¨¨2 3
Column
¨¨3 9
<
¨¨9 :
string
¨¨: @
>
¨¨@ A
(
¨¨A B
type
¨¨B F
:
¨¨F G
$str
¨¨H W
,
¨¨W X
nullable
¨¨Y a
:
¨¨a b
true
¨¨c g
)
¨¨g h
,
¨¨h i

Properties
≠≠ 
=
≠≠  
table
≠≠! &
.
≠≠& '
Column
≠≠' -
<
≠≠- .
string
≠≠. 4
>
≠≠4 5
(
≠≠5 6
type
≠≠6 :
:
≠≠: ;
$str
≠≠< K
,
≠≠K L
nullable
≠≠M U
:
≠≠U V
true
≠≠W [
)
≠≠[ \
,
≠≠\ ]
RedirectUris
ÆÆ  
=
ÆÆ! "
table
ÆÆ# (
.
ÆÆ( )
Column
ÆÆ) /
<
ÆÆ/ 0
string
ÆÆ0 6
>
ÆÆ6 7
(
ÆÆ7 8
type
ÆÆ8 <
:
ÆÆ< =
$str
ÆÆ> M
,
ÆÆM N
nullable
ÆÆO W
:
ÆÆW X
true
ÆÆY ]
)
ÆÆ] ^
,
ÆÆ^ _
Requirements
ØØ  
=
ØØ! "
table
ØØ# (
.
ØØ( )
Column
ØØ) /
<
ØØ/ 0
string
ØØ0 6
>
ØØ6 7
(
ØØ7 8
type
ØØ8 <
:
ØØ< =
$str
ØØ> M
,
ØØM N
nullable
ØØO W
:
ØØW X
true
ØØY ]
)
ØØ] ^
,
ØØ^ _
Settings
∞∞ 
=
∞∞ 
table
∞∞ $
.
∞∞$ %
Column
∞∞% +
<
∞∞+ ,
string
∞∞, 2
>
∞∞2 3
(
∞∞3 4
type
∞∞4 8
:
∞∞8 9
$str
∞∞: I
,
∞∞I J
nullable
∞∞K S
:
∞∞S T
true
∞∞U Y
)
∞∞Y Z
,
∞∞Z [
	ClientUri
±± 
=
±± 
table
±±  %
.
±±% &
Column
±±& ,
<
±±, -
string
±±- 3
>
±±3 4
(
±±4 5
type
±±5 9
:
±±9 :
$str
±±; J
,
±±J K
nullable
±±L T
:
±±T U
true
±±V Z
)
±±Z [
,
±±[ \
LogoUri
≤≤ 
=
≤≤ 
table
≤≤ #
.
≤≤# $
Column
≤≤$ *
<
≤≤* +
string
≤≤+ 1
>
≤≤1 2
(
≤≤2 3
type
≤≤3 7
:
≤≤7 8
$str
≤≤9 H
,
≤≤H I
nullable
≤≤J R
:
≤≤R S
true
≤≤T X
)
≤≤X Y
,
≤≤Y Z
ExtraProperties
≥≥ #
=
≥≥$ %
table
≥≥& +
.
≥≥+ ,
Column
≥≥, 2
<
≥≥2 3
string
≥≥3 9
>
≥≥9 :
(
≥≥: ;
type
≥≥; ?
:
≥≥? @
$str
≥≥A P
,
≥≥P Q
nullable
≥≥R Z
:
≥≥Z [
false
≥≥\ a
)
≥≥a b
,
≥≥b c
ConcurrencyStamp
¥¥ $
=
¥¥% &
table
¥¥' ,
.
¥¥, -
Column
¥¥- 3
<
¥¥3 4
string
¥¥4 :
>
¥¥: ;
(
¥¥; <
type
¥¥< @
:
¥¥@ A
$str
¥¥B P
,
¥¥P Q
	maxLength
¥¥R [
:
¥¥[ \
$num
¥¥] _
,
¥¥_ `
nullable
¥¥a i
:
¥¥i j
false
¥¥k p
)
¥¥p q
,
¥¥q r
CreationTime
µµ  
=
µµ! "
table
µµ# (
.
µµ( )
Column
µµ) /
<
µµ/ 0
DateTime
µµ0 8
>
µµ8 9
(
µµ9 :
type
µµ: >
:
µµ> ?
$str
µµ@ K
,
µµK L
nullable
µµM U
:
µµU V
false
µµW \
)
µµ\ ]
,
µµ] ^
	CreatorId
∂∂ 
=
∂∂ 
table
∂∂  %
.
∂∂% &
Column
∂∂& ,
<
∂∂, -
Guid
∂∂- 1
>
∂∂1 2
(
∂∂2 3
type
∂∂3 7
:
∂∂7 8
$str
∂∂9 K
,
∂∂K L
nullable
∂∂M U
:
∂∂U V
true
∂∂W [
)
∂∂[ \
,
∂∂\ ]"
LastModificationTime
∑∑ (
=
∑∑) *
table
∑∑+ 0
.
∑∑0 1
Column
∑∑1 7
<
∑∑7 8
DateTime
∑∑8 @
>
∑∑@ A
(
∑∑A B
type
∑∑B F
:
∑∑F G
$str
∑∑H S
,
∑∑S T
nullable
∑∑U ]
:
∑∑] ^
true
∑∑_ c
)
∑∑c d
,
∑∑d e
LastModifierId
∏∏ "
=
∏∏# $
table
∏∏% *
.
∏∏* +
Column
∏∏+ 1
<
∏∏1 2
Guid
∏∏2 6
>
∏∏6 7
(
∏∏7 8
type
∏∏8 <
:
∏∏< =
$str
∏∏> P
,
∏∏P Q
nullable
∏∏R Z
:
∏∏Z [
true
∏∏\ `
)
∏∏` a
,
∏∏a b
	IsDeleted
ππ 
=
ππ 
table
ππ  %
.
ππ% &
Column
ππ& ,
<
ππ, -
bool
ππ- 1
>
ππ1 2
(
ππ2 3
type
ππ3 7
:
ππ7 8
$str
ππ9 >
,
ππ> ?
nullable
ππ@ H
:
ππH I
false
ππJ O
,
ππO P
defaultValue
ππQ ]
:
ππ] ^
false
ππ_ d
)
ππd e
,
ππe f
	DeleterId
∫∫ 
=
∫∫ 
table
∫∫  %
.
∫∫% &
Column
∫∫& ,
<
∫∫, -
Guid
∫∫- 1
>
∫∫1 2
(
∫∫2 3
type
∫∫3 7
:
∫∫7 8
$str
∫∫9 K
,
∫∫K L
nullable
∫∫M U
:
∫∫U V
true
∫∫W [
)
∫∫[ \
,
∫∫\ ]
DeletionTime
ªª  
=
ªª! "
table
ªª# (
.
ªª( )
Column
ªª) /
<
ªª/ 0
DateTime
ªª0 8
>
ªª8 9
(
ªª9 :
type
ªª: >
:
ªª> ?
$str
ªª@ K
,
ªªK L
nullable
ªªM U
:
ªªU V
true
ªªW [
)
ªª[ \
}
ºº 
,
ºº 
constraints
ΩΩ 
:
ΩΩ 
table
ΩΩ "
=>
ΩΩ# %
{
ææ 
table
øø 
.
øø 

PrimaryKey
øø $
(
øø$ %
$str
øø% @
,
øø@ A
x
øøB C
=>
øøD F
x
øøG H
.
øøH I
Id
øøI K
)
øøK L
;
øøL M
}
¿¿ 
)
¿¿ 
;
¿¿ 
migrationBuilder
¬¬ 
.
¬¬ 
CreateTable
¬¬ (
(
¬¬( )
name
√√ 
:
√√ 
$str
√√ (
,
√√( )
columns
ƒƒ 
:
ƒƒ 
table
ƒƒ 
=>
ƒƒ !
new
ƒƒ" %
{
≈≈ 
Id
∆∆ 
=
∆∆ 
table
∆∆ 
.
∆∆ 
Column
∆∆ %
<
∆∆% &
Guid
∆∆& *
>
∆∆* +
(
∆∆+ ,
type
∆∆, 0
:
∆∆0 1
$str
∆∆2 D
,
∆∆D E
nullable
∆∆F N
:
∆∆N O
false
∆∆P U
)
∆∆U V
,
∆∆V W
Description
«« 
=
««  !
table
««" '
.
««' (
Column
««( .
<
««. /
string
««/ 5
>
««5 6
(
««6 7
type
««7 ;
:
««; <
$str
««= L
,
««L M
nullable
««N V
:
««V W
true
««X \
)
««\ ]
,
««] ^
Descriptions
»»  
=
»»! "
table
»»# (
.
»»( )
Column
»») /
<
»»/ 0
string
»»0 6
>
»»6 7
(
»»7 8
type
»»8 <
:
»»< =
$str
»»> M
,
»»M N
nullable
»»O W
:
»»W X
true
»»Y ]
)
»»] ^
,
»»^ _
DisplayName
…… 
=
……  !
table
……" '
.
……' (
Column
……( .
<
……. /
string
……/ 5
>
……5 6
(
……6 7
type
……7 ;
:
……; <
$str
……= L
,
……L M
nullable
……N V
:
……V W
true
……X \
)
……\ ]
,
……] ^
DisplayNames
    
=
  ! "
table
  # (
.
  ( )
Column
  ) /
<
  / 0
string
  0 6
>
  6 7
(
  7 8
type
  8 <
:
  < =
$str
  > M
,
  M N
nullable
  O W
:
  W X
true
  Y ]
)
  ] ^
,
  ^ _
Name
ÀÀ 
=
ÀÀ 
table
ÀÀ  
.
ÀÀ  !
Column
ÀÀ! '
<
ÀÀ' (
string
ÀÀ( .
>
ÀÀ. /
(
ÀÀ/ 0
type
ÀÀ0 4
:
ÀÀ4 5
$str
ÀÀ6 E
,
ÀÀE F
	maxLength
ÀÀG P
:
ÀÀP Q
$num
ÀÀR U
,
ÀÀU V
nullable
ÀÀW _
:
ÀÀ_ `
true
ÀÀa e
)
ÀÀe f
,
ÀÀf g

Properties
ÃÃ 
=
ÃÃ  
table
ÃÃ! &
.
ÃÃ& '
Column
ÃÃ' -
<
ÃÃ- .
string
ÃÃ. 4
>
ÃÃ4 5
(
ÃÃ5 6
type
ÃÃ6 :
:
ÃÃ: ;
$str
ÃÃ< K
,
ÃÃK L
nullable
ÃÃM U
:
ÃÃU V
true
ÃÃW [
)
ÃÃ[ \
,
ÃÃ\ ]
	Resources
ÕÕ 
=
ÕÕ 
table
ÕÕ  %
.
ÕÕ% &
Column
ÕÕ& ,
<
ÕÕ, -
string
ÕÕ- 3
>
ÕÕ3 4
(
ÕÕ4 5
type
ÕÕ5 9
:
ÕÕ9 :
$str
ÕÕ; J
,
ÕÕJ K
nullable
ÕÕL T
:
ÕÕT U
true
ÕÕV Z
)
ÕÕZ [
,
ÕÕ[ \
ExtraProperties
ŒŒ #
=
ŒŒ$ %
table
ŒŒ& +
.
ŒŒ+ ,
Column
ŒŒ, 2
<
ŒŒ2 3
string
ŒŒ3 9
>
ŒŒ9 :
(
ŒŒ: ;
type
ŒŒ; ?
:
ŒŒ? @
$str
ŒŒA P
,
ŒŒP Q
nullable
ŒŒR Z
:
ŒŒZ [
false
ŒŒ\ a
)
ŒŒa b
,
ŒŒb c
ConcurrencyStamp
œœ $
=
œœ% &
table
œœ' ,
.
œœ, -
Column
œœ- 3
<
œœ3 4
string
œœ4 :
>
œœ: ;
(
œœ; <
type
œœ< @
:
œœ@ A
$str
œœB P
,
œœP Q
	maxLength
œœR [
:
œœ[ \
$num
œœ] _
,
œœ_ `
nullable
œœa i
:
œœi j
false
œœk p
)
œœp q
,
œœq r
CreationTime
––  
=
––! "
table
––# (
.
––( )
Column
––) /
<
––/ 0
DateTime
––0 8
>
––8 9
(
––9 :
type
––: >
:
––> ?
$str
––@ K
,
––K L
nullable
––M U
:
––U V
false
––W \
)
––\ ]
,
––] ^
	CreatorId
—— 
=
—— 
table
——  %
.
——% &
Column
——& ,
<
——, -
Guid
——- 1
>
——1 2
(
——2 3
type
——3 7
:
——7 8
$str
——9 K
,
——K L
nullable
——M U
:
——U V
true
——W [
)
——[ \
,
——\ ]"
LastModificationTime
““ (
=
““) *
table
““+ 0
.
““0 1
Column
““1 7
<
““7 8
DateTime
““8 @
>
““@ A
(
““A B
type
““B F
:
““F G
$str
““H S
,
““S T
nullable
““U ]
:
““] ^
true
““_ c
)
““c d
,
““d e
LastModifierId
”” "
=
””# $
table
””% *
.
””* +
Column
””+ 1
<
””1 2
Guid
””2 6
>
””6 7
(
””7 8
type
””8 <
:
””< =
$str
””> P
,
””P Q
nullable
””R Z
:
””Z [
true
””\ `
)
””` a
,
””a b
	IsDeleted
‘‘ 
=
‘‘ 
table
‘‘  %
.
‘‘% &
Column
‘‘& ,
<
‘‘, -
bool
‘‘- 1
>
‘‘1 2
(
‘‘2 3
type
‘‘3 7
:
‘‘7 8
$str
‘‘9 >
,
‘‘> ?
nullable
‘‘@ H
:
‘‘H I
false
‘‘J O
,
‘‘O P
defaultValue
‘‘Q ]
:
‘‘] ^
false
‘‘_ d
)
‘‘d e
,
‘‘e f
	DeleterId
’’ 
=
’’ 
table
’’  %
.
’’% &
Column
’’& ,
<
’’, -
Guid
’’- 1
>
’’1 2
(
’’2 3
type
’’3 7
:
’’7 8
$str
’’9 K
,
’’K L
nullable
’’M U
:
’’U V
true
’’W [
)
’’[ \
,
’’\ ]
DeletionTime
÷÷  
=
÷÷! "
table
÷÷# (
.
÷÷( )
Column
÷÷) /
<
÷÷/ 0
DateTime
÷÷0 8
>
÷÷8 9
(
÷÷9 :
type
÷÷: >
:
÷÷> ?
$str
÷÷@ K
,
÷÷K L
nullable
÷÷M U
:
÷÷U V
true
÷÷W [
)
÷÷[ \
}
◊◊ 
,
◊◊ 
constraints
ÿÿ 
:
ÿÿ 
table
ÿÿ "
=>
ÿÿ# %
{
ŸŸ 
table
⁄⁄ 
.
⁄⁄ 

PrimaryKey
⁄⁄ $
(
⁄⁄$ %
$str
⁄⁄% :
,
⁄⁄: ;
x
⁄⁄< =
=>
⁄⁄> @
x
⁄⁄A B
.
⁄⁄B C
Id
⁄⁄C E
)
⁄⁄E F
;
⁄⁄F G
}
€€ 
)
€€ 
;
€€ 
migrationBuilder
›› 
.
›› 
CreateTable
›› (
(
››( )
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ *
,
ﬁﬁ* +
columns
ﬂﬂ 
:
ﬂﬂ 
table
ﬂﬂ 
=>
ﬂﬂ !
new
ﬂﬂ" %
{
‡‡ 
Id
·· 
=
·· 
table
·· 
.
·· 
Column
·· %
<
··% &
Guid
··& *
>
··* +
(
··+ ,
type
··, 0
:
··0 1
$str
··2 D
,
··D E
nullable
··F N
:
··N O
false
··P U
)
··U V
,
··V W
TenantId
‚‚ 
=
‚‚ 
table
‚‚ $
.
‚‚$ %
Column
‚‚% +
<
‚‚+ ,
Guid
‚‚, 0
>
‚‚0 1
(
‚‚1 2
type
‚‚2 6
:
‚‚6 7
$str
‚‚8 J
,
‚‚J K
nullable
‚‚L T
:
‚‚T U
true
‚‚V Z
)
‚‚Z [
,
‚‚[ \

AuditLogId
„„ 
=
„„  
table
„„! &
.
„„& '
Column
„„' -
<
„„- .
Guid
„„. 2
>
„„2 3
(
„„3 4
type
„„4 8
:
„„8 9
$str
„„: L
,
„„L M
nullable
„„N V
:
„„V W
false
„„X ]
)
„„] ^
,
„„^ _
ServiceName
‰‰ 
=
‰‰  !
table
‰‰" '
.
‰‰' (
Column
‰‰( .
<
‰‰. /
string
‰‰/ 5
>
‰‰5 6
(
‰‰6 7
type
‰‰7 ;
:
‰‰; <
$str
‰‰= L
,
‰‰L M
	maxLength
‰‰N W
:
‰‰W X
$num
‰‰Y \
,
‰‰\ ]
nullable
‰‰^ f
:
‰‰f g
true
‰‰h l
)
‰‰l m
,
‰‰m n

MethodName
ÂÂ 
=
ÂÂ  
table
ÂÂ! &
.
ÂÂ& '
Column
ÂÂ' -
<
ÂÂ- .
string
ÂÂ. 4
>
ÂÂ4 5
(
ÂÂ5 6
type
ÂÂ6 :
:
ÂÂ: ;
$str
ÂÂ< K
,
ÂÂK L
	maxLength
ÂÂM V
:
ÂÂV W
$num
ÂÂX [
,
ÂÂ[ \
nullable
ÂÂ] e
:
ÂÂe f
true
ÂÂg k
)
ÂÂk l
,
ÂÂl m

Parameters
ÊÊ 
=
ÊÊ  
table
ÊÊ! &
.
ÊÊ& '
Column
ÊÊ' -
<
ÊÊ- .
string
ÊÊ. 4
>
ÊÊ4 5
(
ÊÊ5 6
type
ÊÊ6 :
:
ÊÊ: ;
$str
ÊÊ< L
,
ÊÊL M
	maxLength
ÊÊN W
:
ÊÊW X
$num
ÊÊY ]
,
ÊÊ] ^
nullable
ÊÊ_ g
:
ÊÊg h
true
ÊÊi m
)
ÊÊm n
,
ÊÊn o
ExecutionTime
ÁÁ !
=
ÁÁ" #
table
ÁÁ$ )
.
ÁÁ) *
Column
ÁÁ* 0
<
ÁÁ0 1
DateTime
ÁÁ1 9
>
ÁÁ9 :
(
ÁÁ: ;
type
ÁÁ; ?
:
ÁÁ? @
$str
ÁÁA L
,
ÁÁL M
nullable
ÁÁN V
:
ÁÁV W
false
ÁÁX ]
)
ÁÁ] ^
,
ÁÁ^ _
ExecutionDuration
ËË %
=
ËË& '
table
ËË( -
.
ËË- .
Column
ËË. 4
<
ËË4 5
int
ËË5 8
>
ËË8 9
(
ËË9 :
type
ËË: >
:
ËË> ?
$str
ËË@ E
,
ËËE F
nullable
ËËG O
:
ËËO P
false
ËËQ V
)
ËËV W
,
ËËW X
ExtraProperties
ÈÈ #
=
ÈÈ$ %
table
ÈÈ& +
.
ÈÈ+ ,
Column
ÈÈ, 2
<
ÈÈ2 3
string
ÈÈ3 9
>
ÈÈ9 :
(
ÈÈ: ;
type
ÈÈ; ?
:
ÈÈ? @
$str
ÈÈA P
,
ÈÈP Q
nullable
ÈÈR Z
:
ÈÈZ [
true
ÈÈ\ `
)
ÈÈ` a
}
ÍÍ 
,
ÍÍ 
constraints
ÎÎ 
:
ÎÎ 
table
ÎÎ "
=>
ÎÎ# %
{
ÏÏ 
table
ÌÌ 
.
ÌÌ 

PrimaryKey
ÌÌ $
(
ÌÌ$ %
$str
ÌÌ% <
,
ÌÌ< =
x
ÌÌ> ?
=>
ÌÌ@ B
x
ÌÌC D
.
ÌÌD E
Id
ÌÌE G
)
ÌÌG H
;
ÌÌH I
table
ÓÓ 
.
ÓÓ 

ForeignKey
ÓÓ $
(
ÓÓ$ %
name
ÔÔ 
:
ÔÔ 
$str
ÔÔ M
,
ÔÔM N
column
 
:
 
x
  !
=>
" $
x
% &
.
& '

AuditLogId
' 1
,
1 2
principalTable
ÒÒ &
:
ÒÒ& '
$str
ÒÒ( 6
,
ÒÒ6 7
principalColumn
ÚÚ '
:
ÚÚ' (
$str
ÚÚ) -
,
ÚÚ- .
onDelete
ÛÛ  
:
ÛÛ  !
ReferentialAction
ÛÛ" 3
.
ÛÛ3 4
Cascade
ÛÛ4 ;
)
ÛÛ; <
;
ÛÛ< =
}
ÙÙ 
)
ÙÙ 
;
ÙÙ 
migrationBuilder
ˆˆ 
.
ˆˆ 
CreateTable
ˆˆ (
(
ˆˆ( )
name
˜˜ 
:
˜˜ 
$str
˜˜ (
,
˜˜( )
columns
¯¯ 
:
¯¯ 
table
¯¯ 
=>
¯¯ !
new
¯¯" %
{
˘˘ 
Id
˙˙ 
=
˙˙ 
table
˙˙ 
.
˙˙ 
Column
˙˙ %
<
˙˙% &
Guid
˙˙& *
>
˙˙* +
(
˙˙+ ,
type
˙˙, 0
:
˙˙0 1
$str
˙˙2 D
,
˙˙D E
nullable
˙˙F N
:
˙˙N O
false
˙˙P U
)
˙˙U V
,
˙˙V W

AuditLogId
˚˚ 
=
˚˚  
table
˚˚! &
.
˚˚& '
Column
˚˚' -
<
˚˚- .
Guid
˚˚. 2
>
˚˚2 3
(
˚˚3 4
type
˚˚4 8
:
˚˚8 9
$str
˚˚: L
,
˚˚L M
nullable
˚˚N V
:
˚˚V W
false
˚˚X ]
)
˚˚] ^
,
˚˚^ _
TenantId
¸¸ 
=
¸¸ 
table
¸¸ $
.
¸¸$ %
Column
¸¸% +
<
¸¸+ ,
Guid
¸¸, 0
>
¸¸0 1
(
¸¸1 2
type
¸¸2 6
:
¸¸6 7
$str
¸¸8 J
,
¸¸J K
nullable
¸¸L T
:
¸¸T U
true
¸¸V Z
)
¸¸Z [
,
¸¸[ \

ChangeTime
˝˝ 
=
˝˝  
table
˝˝! &
.
˝˝& '
Column
˝˝' -
<
˝˝- .
DateTime
˝˝. 6
>
˝˝6 7
(
˝˝7 8
type
˝˝8 <
:
˝˝< =
$str
˝˝> I
,
˝˝I J
nullable
˝˝K S
:
˝˝S T
false
˝˝U Z
)
˝˝Z [
,
˝˝[ \

ChangeType
˛˛ 
=
˛˛  
table
˛˛! &
.
˛˛& '
Column
˛˛' -
<
˛˛- .
byte
˛˛. 2
>
˛˛2 3
(
˛˛3 4
type
˛˛4 8
:
˛˛8 9
$str
˛˛: C
,
˛˛C D
nullable
˛˛E M
:
˛˛M N
false
˛˛O T
)
˛˛T U
,
˛˛U V
EntityTenantId
ˇˇ "
=
ˇˇ# $
table
ˇˇ% *
.
ˇˇ* +
Column
ˇˇ+ 1
<
ˇˇ1 2
Guid
ˇˇ2 6
>
ˇˇ6 7
(
ˇˇ7 8
type
ˇˇ8 <
:
ˇˇ< =
$str
ˇˇ> P
,
ˇˇP Q
nullable
ˇˇR Z
:
ˇˇZ [
true
ˇˇ\ `
)
ˇˇ` a
,
ˇˇa b
EntityId
ÄÄ 
=
ÄÄ 
table
ÄÄ $
.
ÄÄ$ %
Column
ÄÄ% +
<
ÄÄ+ ,
string
ÄÄ, 2
>
ÄÄ2 3
(
ÄÄ3 4
type
ÄÄ4 8
:
ÄÄ8 9
$str
ÄÄ: I
,
ÄÄI J
	maxLength
ÄÄK T
:
ÄÄT U
$num
ÄÄV Y
,
ÄÄY Z
nullable
ÄÄ[ c
:
ÄÄc d
true
ÄÄe i
)
ÄÄi j
,
ÄÄj k 
EntityTypeFullName
ÅÅ &
=
ÅÅ' (
table
ÅÅ) .
.
ÅÅ. /
Column
ÅÅ/ 5
<
ÅÅ5 6
string
ÅÅ6 <
>
ÅÅ< =
(
ÅÅ= >
type
ÅÅ> B
:
ÅÅB C
$str
ÅÅD S
,
ÅÅS T
	maxLength
ÅÅU ^
:
ÅÅ^ _
$num
ÅÅ` c
,
ÅÅc d
nullable
ÅÅe m
:
ÅÅm n
false
ÅÅo t
)
ÅÅt u
,
ÅÅu v
ExtraProperties
ÇÇ #
=
ÇÇ$ %
table
ÇÇ& +
.
ÇÇ+ ,
Column
ÇÇ, 2
<
ÇÇ2 3
string
ÇÇ3 9
>
ÇÇ9 :
(
ÇÇ: ;
type
ÇÇ; ?
:
ÇÇ? @
$str
ÇÇA P
,
ÇÇP Q
nullable
ÇÇR Z
:
ÇÇZ [
true
ÇÇ\ `
)
ÇÇ` a
}
ÉÉ 
,
ÉÉ 
constraints
ÑÑ 
:
ÑÑ 
table
ÑÑ "
=>
ÑÑ# %
{
ÖÖ 
table
ÜÜ 
.
ÜÜ 

PrimaryKey
ÜÜ $
(
ÜÜ$ %
$str
ÜÜ% :
,
ÜÜ: ;
x
ÜÜ< =
=>
ÜÜ> @
x
ÜÜA B
.
ÜÜB C
Id
ÜÜC E
)
ÜÜE F
;
ÜÜF G
table
áá 
.
áá 

ForeignKey
áá $
(
áá$ %
name
àà 
:
àà 
$str
àà K
,
ààK L
column
ââ 
:
ââ 
x
ââ  !
=>
ââ" $
x
ââ% &
.
ââ& '

AuditLogId
ââ' 1
,
ââ1 2
principalTable
ää &
:
ää& '
$str
ää( 6
,
ää6 7
principalColumn
ãã '
:
ãã' (
$str
ãã) -
,
ãã- .
onDelete
åå  
:
åå  !
ReferentialAction
åå" 3
.
åå3 4
Cascade
åå4 ;
)
åå; <
;
åå< =
}
çç 
)
çç 
;
çç 
migrationBuilder
èè 
.
èè 
CreateTable
èè (
(
èè( )
name
êê 
:
êê 
$str
êê 0
,
êê0 1
columns
ëë 
:
ëë 
table
ëë 
=>
ëë !
new
ëë" %
{
íí 
RoleId
ìì 
=
ìì 
table
ìì "
.
ìì" #
Column
ìì# )
<
ìì) *
Guid
ìì* .
>
ìì. /
(
ìì/ 0
type
ìì0 4
:
ìì4 5
$str
ìì6 H
,
ììH I
nullable
ììJ R
:
ììR S
false
ììT Y
)
ììY Z
,
ììZ [ 
OrganizationUnitId
îî &
=
îî' (
table
îî) .
.
îî. /
Column
îî/ 5
<
îî5 6
Guid
îî6 :
>
îî: ;
(
îî; <
type
îî< @
:
îî@ A
$str
îîB T
,
îîT U
nullable
îîV ^
:
îî^ _
false
îî` e
)
îîe f
,
îîf g
TenantId
ïï 
=
ïï 
table
ïï $
.
ïï$ %
Column
ïï% +
<
ïï+ ,
Guid
ïï, 0
>
ïï0 1
(
ïï1 2
type
ïï2 6
:
ïï6 7
$str
ïï8 J
,
ïïJ K
nullable
ïïL T
:
ïïT U
true
ïïV Z
)
ïïZ [
,
ïï[ \
CreationTime
ññ  
=
ññ! "
table
ññ# (
.
ññ( )
Column
ññ) /
<
ññ/ 0
DateTime
ññ0 8
>
ññ8 9
(
ññ9 :
type
ññ: >
:
ññ> ?
$str
ññ@ K
,
ññK L
nullable
ññM U
:
ññU V
false
ññW \
)
ññ\ ]
,
ññ] ^
	CreatorId
óó 
=
óó 
table
óó  %
.
óó% &
Column
óó& ,
<
óó, -
Guid
óó- 1
>
óó1 2
(
óó2 3
type
óó3 7
:
óó7 8
$str
óó9 K
,
óóK L
nullable
óóM U
:
óóU V
true
óóW [
)
óó[ \
}
òò 
,
òò 
constraints
ôô 
:
ôô 
table
ôô "
=>
ôô# %
{
öö 
table
õõ 
.
õõ 

PrimaryKey
õõ $
(
õõ$ %
$str
õõ% B
,
õõB C
x
õõD E
=>
õõF H
new
õõI L
{
õõM N
x
õõO P
.
õõP Q 
OrganizationUnitId
õõQ c
,
õõc d
x
õõe f
.
õõf g
RoleId
õõg m
}
õõn o
)
õõo p
;
õõp q
table
úú 
.
úú 

ForeignKey
úú $
(
úú$ %
name
ùù 
:
ùù 
$str
ùù c
,
ùùc d
column
ûû 
:
ûû 
x
ûû  !
=>
ûû" $
x
ûû% &
.
ûû& ' 
OrganizationUnitId
ûû' 9
,
ûû9 :
principalTable
üü &
:
üü& '
$str
üü( >
,
üü> ?
principalColumn
†† '
:
††' (
$str
††) -
,
††- .
onDelete
°°  
:
°°  !
ReferentialAction
°°" 3
.
°°3 4
Cascade
°°4 ;
)
°°; <
;
°°< =
table
¢¢ 
.
¢¢ 

ForeignKey
¢¢ $
(
¢¢$ %
name
££ 
:
££ 
$str
££ K
,
££K L
column
§§ 
:
§§ 
x
§§  !
=>
§§" $
x
§§% &
.
§§& '
RoleId
§§' -
,
§§- .
principalTable
•• &
:
••& '
$str
••( 2
,
••2 3
principalColumn
¶¶ '
:
¶¶' (
$str
¶¶) -
,
¶¶- .
onDelete
ßß  
:
ßß  !
ReferentialAction
ßß" 3
.
ßß3 4
Cascade
ßß4 ;
)
ßß; <
;
ßß< =
}
®® 
)
®® 
;
®® 
migrationBuilder
™™ 
.
™™ 
CreateTable
™™ (
(
™™( )
name
´´ 
:
´´ 
$str
´´ %
,
´´% &
columns
¨¨ 
:
¨¨ 
table
¨¨ 
=>
¨¨ !
new
¨¨" %
{
≠≠ 
Id
ÆÆ 
=
ÆÆ 
table
ÆÆ 
.
ÆÆ 
Column
ÆÆ %
<
ÆÆ% &
Guid
ÆÆ& *
>
ÆÆ* +
(
ÆÆ+ ,
type
ÆÆ, 0
:
ÆÆ0 1
$str
ÆÆ2 D
,
ÆÆD E
nullable
ÆÆF N
:
ÆÆN O
false
ÆÆP U
)
ÆÆU V
,
ÆÆV W
RoleId
ØØ 
=
ØØ 
table
ØØ "
.
ØØ" #
Column
ØØ# )
<
ØØ) *
Guid
ØØ* .
>
ØØ. /
(
ØØ/ 0
type
ØØ0 4
:
ØØ4 5
$str
ØØ6 H
,
ØØH I
nullable
ØØJ R
:
ØØR S
false
ØØT Y
)
ØØY Z
,
ØØZ [
TenantId
∞∞ 
=
∞∞ 
table
∞∞ $
.
∞∞$ %
Column
∞∞% +
<
∞∞+ ,
Guid
∞∞, 0
>
∞∞0 1
(
∞∞1 2
type
∞∞2 6
:
∞∞6 7
$str
∞∞8 J
,
∞∞J K
nullable
∞∞L T
:
∞∞T U
true
∞∞V Z
)
∞∞Z [
,
∞∞[ \
	ClaimType
±± 
=
±± 
table
±±  %
.
±±% &
Column
±±& ,
<
±±, -
string
±±- 3
>
±±3 4
(
±±4 5
type
±±5 9
:
±±9 :
$str
±±; J
,
±±J K
	maxLength
±±L U
:
±±U V
$num
±±W Z
,
±±Z [
nullable
±±\ d
:
±±d e
false
±±f k
)
±±k l
,
±±l m

ClaimValue
≤≤ 
=
≤≤  
table
≤≤! &
.
≤≤& '
Column
≤≤' -
<
≤≤- .
string
≤≤. 4
>
≤≤4 5
(
≤≤5 6
type
≤≤6 :
:
≤≤: ;
$str
≤≤< L
,
≤≤L M
	maxLength
≤≤N W
:
≤≤W X
$num
≤≤Y ]
,
≤≤] ^
nullable
≤≤_ g
:
≤≤g h
true
≤≤i m
)
≤≤m n
}
≥≥ 
,
≥≥ 
constraints
¥¥ 
:
¥¥ 
table
¥¥ "
=>
¥¥# %
{
µµ 
table
∂∂ 
.
∂∂ 

PrimaryKey
∂∂ $
(
∂∂$ %
$str
∂∂% 7
,
∂∂7 8
x
∂∂9 :
=>
∂∂; =
x
∂∂> ?
.
∂∂? @
Id
∂∂@ B
)
∂∂B C
;
∂∂C D
table
∑∑ 
.
∑∑ 

ForeignKey
∑∑ $
(
∑∑$ %
name
∏∏ 
:
∏∏ 
$str
∏∏ @
,
∏∏@ A
column
ππ 
:
ππ 
x
ππ  !
=>
ππ" $
x
ππ% &
.
ππ& '
RoleId
ππ' -
,
ππ- .
principalTable
∫∫ &
:
∫∫& '
$str
∫∫( 2
,
∫∫2 3
principalColumn
ªª '
:
ªª' (
$str
ªª) -
,
ªª- .
onDelete
ºº  
:
ºº  !
ReferentialAction
ºº" 3
.
ºº3 4
Cascade
ºº4 ;
)
ºº; <
;
ºº< =
}
ΩΩ 
)
ΩΩ 
;
ΩΩ 
migrationBuilder
øø 
.
øø 
CreateTable
øø (
(
øø( )
name
¿¿ 
:
¿¿ 
$str
¿¿ 2
,
¿¿2 3
columns
¡¡ 
:
¡¡ 
table
¡¡ 
=>
¡¡ !
new
¡¡" %
{
¬¬ 
TenantId
√√ 
=
√√ 
table
√√ $
.
√√$ %
Column
√√% +
<
√√+ ,
Guid
√√, 0
>
√√0 1
(
√√1 2
type
√√2 6
:
√√6 7
$str
√√8 J
,
√√J K
nullable
√√L T
:
√√T U
false
√√V [
)
√√[ \
,
√√\ ]
Name
ƒƒ 
=
ƒƒ 
table
ƒƒ  
.
ƒƒ  !
Column
ƒƒ! '
<
ƒƒ' (
string
ƒƒ( .
>
ƒƒ. /
(
ƒƒ/ 0
type
ƒƒ0 4
:
ƒƒ4 5
$str
ƒƒ6 D
,
ƒƒD E
	maxLength
ƒƒF O
:
ƒƒO P
$num
ƒƒQ S
,
ƒƒS T
nullable
ƒƒU ]
:
ƒƒ] ^
false
ƒƒ_ d
)
ƒƒd e
,
ƒƒe f
Value
≈≈ 
=
≈≈ 
table
≈≈ !
.
≈≈! "
Column
≈≈" (
<
≈≈( )
string
≈≈) /
>
≈≈/ 0
(
≈≈0 1
type
≈≈1 5
:
≈≈5 6
$str
≈≈7 G
,
≈≈G H
	maxLength
≈≈I R
:
≈≈R S
$num
≈≈T X
,
≈≈X Y
nullable
≈≈Z b
:
≈≈b c
false
≈≈d i
)
≈≈i j
}
∆∆ 
,
∆∆ 
constraints
«« 
:
«« 
table
«« "
=>
««# %
{
»» 
table
…… 
.
…… 

PrimaryKey
…… $
(
……$ %
$str
……% D
,
……D E
x
……F G
=>
……H J
new
……K N
{
……O P
x
……Q R
.
……R S
TenantId
……S [
,
……[ \
x
……] ^
.
……^ _
Name
……_ c
}
……d e
)
……e f
;
……f g
table
   
.
   

ForeignKey
   $
(
  $ %
name
ÀÀ 
:
ÀÀ 
$str
ÀÀ Q
,
ÀÀQ R
column
ÃÃ 
:
ÃÃ 
x
ÃÃ  !
=>
ÃÃ" $
x
ÃÃ% &
.
ÃÃ& '
TenantId
ÃÃ' /
,
ÃÃ/ 0
principalTable
ÕÕ &
:
ÕÕ& '
$str
ÕÕ( 4
,
ÕÕ4 5
principalColumn
ŒŒ '
:
ŒŒ' (
$str
ŒŒ) -
,
ŒŒ- .
onDelete
œœ  
:
œœ  !
ReferentialAction
œœ" 3
.
œœ3 4
Cascade
œœ4 ;
)
œœ; <
;
œœ< =
}
–– 
)
–– 
;
–– 
migrationBuilder
““ 
.
““ 
CreateTable
““ (
(
““( )
name
”” 
:
”” 
$str
”” %
,
””% &
columns
‘‘ 
:
‘‘ 
table
‘‘ 
=>
‘‘ !
new
‘‘" %
{
’’ 
Id
÷÷ 
=
÷÷ 
table
÷÷ 
.
÷÷ 
Column
÷÷ %
<
÷÷% &
Guid
÷÷& *
>
÷÷* +
(
÷÷+ ,
type
÷÷, 0
:
÷÷0 1
$str
÷÷2 D
,
÷÷D E
nullable
÷÷F N
:
÷÷N O
false
÷÷P U
)
÷÷U V
,
÷÷V W
UserId
◊◊ 
=
◊◊ 
table
◊◊ "
.
◊◊" #
Column
◊◊# )
<
◊◊) *
Guid
◊◊* .
>
◊◊. /
(
◊◊/ 0
type
◊◊0 4
:
◊◊4 5
$str
◊◊6 H
,
◊◊H I
nullable
◊◊J R
:
◊◊R S
false
◊◊T Y
)
◊◊Y Z
,
◊◊Z [
TenantId
ÿÿ 
=
ÿÿ 
table
ÿÿ $
.
ÿÿ$ %
Column
ÿÿ% +
<
ÿÿ+ ,
Guid
ÿÿ, 0
>
ÿÿ0 1
(
ÿÿ1 2
type
ÿÿ2 6
:
ÿÿ6 7
$str
ÿÿ8 J
,
ÿÿJ K
nullable
ÿÿL T
:
ÿÿT U
true
ÿÿV Z
)
ÿÿZ [
,
ÿÿ[ \
	ClaimType
ŸŸ 
=
ŸŸ 
table
ŸŸ  %
.
ŸŸ% &
Column
ŸŸ& ,
<
ŸŸ, -
string
ŸŸ- 3
>
ŸŸ3 4
(
ŸŸ4 5
type
ŸŸ5 9
:
ŸŸ9 :
$str
ŸŸ; J
,
ŸŸJ K
	maxLength
ŸŸL U
:
ŸŸU V
$num
ŸŸW Z
,
ŸŸZ [
nullable
ŸŸ\ d
:
ŸŸd e
false
ŸŸf k
)
ŸŸk l
,
ŸŸl m

ClaimValue
⁄⁄ 
=
⁄⁄  
table
⁄⁄! &
.
⁄⁄& '
Column
⁄⁄' -
<
⁄⁄- .
string
⁄⁄. 4
>
⁄⁄4 5
(
⁄⁄5 6
type
⁄⁄6 :
:
⁄⁄: ;
$str
⁄⁄< L
,
⁄⁄L M
	maxLength
⁄⁄N W
:
⁄⁄W X
$num
⁄⁄Y ]
,
⁄⁄] ^
nullable
⁄⁄_ g
:
⁄⁄g h
true
⁄⁄i m
)
⁄⁄m n
}
€€ 
,
€€ 
constraints
‹‹ 
:
‹‹ 
table
‹‹ "
=>
‹‹# %
{
›› 
table
ﬁﬁ 
.
ﬁﬁ 

PrimaryKey
ﬁﬁ $
(
ﬁﬁ$ %
$str
ﬁﬁ% 7
,
ﬁﬁ7 8
x
ﬁﬁ9 :
=>
ﬁﬁ; =
x
ﬁﬁ> ?
.
ﬁﬁ? @
Id
ﬁﬁ@ B
)
ﬁﬁB C
;
ﬁﬁC D
table
ﬂﬂ 
.
ﬂﬂ 

ForeignKey
ﬂﬂ $
(
ﬂﬂ$ %
name
‡‡ 
:
‡‡ 
$str
‡‡ @
,
‡‡@ A
column
·· 
:
·· 
x
··  !
=>
··" $
x
··% &
.
··& '
UserId
··' -
,
··- .
principalTable
‚‚ &
:
‚‚& '
$str
‚‚( 2
,
‚‚2 3
principalColumn
„„ '
:
„„' (
$str
„„) -
,
„„- .
onDelete
‰‰  
:
‰‰  !
ReferentialAction
‰‰" 3
.
‰‰3 4
Cascade
‰‰4 ;
)
‰‰; <
;
‰‰< =
}
ÂÂ 
)
ÂÂ 
;
ÂÂ 
migrationBuilder
ÁÁ 
.
ÁÁ 
CreateTable
ÁÁ (
(
ÁÁ( )
name
ËË 
:
ËË 
$str
ËË %
,
ËË% &
columns
ÈÈ 
:
ÈÈ 
table
ÈÈ 
=>
ÈÈ !
new
ÈÈ" %
{
ÍÍ 
UserId
ÎÎ 
=
ÎÎ 
table
ÎÎ "
.
ÎÎ" #
Column
ÎÎ# )
<
ÎÎ) *
Guid
ÎÎ* .
>
ÎÎ. /
(
ÎÎ/ 0
type
ÎÎ0 4
:
ÎÎ4 5
$str
ÎÎ6 H
,
ÎÎH I
nullable
ÎÎJ R
:
ÎÎR S
false
ÎÎT Y
)
ÎÎY Z
,
ÎÎZ [
LoginProvider
ÏÏ !
=
ÏÏ" #
table
ÏÏ$ )
.
ÏÏ) *
Column
ÏÏ* 0
<
ÏÏ0 1
string
ÏÏ1 7
>
ÏÏ7 8
(
ÏÏ8 9
type
ÏÏ9 =
:
ÏÏ= >
$str
ÏÏ? M
,
ÏÏM N
	maxLength
ÏÏO X
:
ÏÏX Y
$num
ÏÏZ \
,
ÏÏ\ ]
nullable
ÏÏ^ f
:
ÏÏf g
false
ÏÏh m
)
ÏÏm n
,
ÏÏn o
TenantId
ÌÌ 
=
ÌÌ 
table
ÌÌ $
.
ÌÌ$ %
Column
ÌÌ% +
<
ÌÌ+ ,
Guid
ÌÌ, 0
>
ÌÌ0 1
(
ÌÌ1 2
type
ÌÌ2 6
:
ÌÌ6 7
$str
ÌÌ8 J
,
ÌÌJ K
nullable
ÌÌL T
:
ÌÌT U
true
ÌÌV Z
)
ÌÌZ [
,
ÌÌ[ \
ProviderKey
ÓÓ 
=
ÓÓ  !
table
ÓÓ" '
.
ÓÓ' (
Column
ÓÓ( .
<
ÓÓ. /
string
ÓÓ/ 5
>
ÓÓ5 6
(
ÓÓ6 7
type
ÓÓ7 ;
:
ÓÓ; <
$str
ÓÓ= L
,
ÓÓL M
	maxLength
ÓÓN W
:
ÓÓW X
$num
ÓÓY \
,
ÓÓ\ ]
nullable
ÓÓ^ f
:
ÓÓf g
false
ÓÓh m
)
ÓÓm n
,
ÓÓn o!
ProviderDisplayName
ÔÔ '
=
ÔÔ( )
table
ÔÔ* /
.
ÔÔ/ 0
Column
ÔÔ0 6
<
ÔÔ6 7
string
ÔÔ7 =
>
ÔÔ= >
(
ÔÔ> ?
type
ÔÔ? C
:
ÔÔC D
$str
ÔÔE T
,
ÔÔT U
	maxLength
ÔÔV _
:
ÔÔ_ `
$num
ÔÔa d
,
ÔÔd e
nullable
ÔÔf n
:
ÔÔn o
true
ÔÔp t
)
ÔÔt u
}
 
,
 
constraints
ÒÒ 
:
ÒÒ 
table
ÒÒ "
=>
ÒÒ# %
{
ÚÚ 
table
ÛÛ 
.
ÛÛ 

PrimaryKey
ÛÛ $
(
ÛÛ$ %
$str
ÛÛ% 7
,
ÛÛ7 8
x
ÛÛ9 :
=>
ÛÛ; =
new
ÛÛ> A
{
ÛÛB C
x
ÛÛD E
.
ÛÛE F
UserId
ÛÛF L
,
ÛÛL M
x
ÛÛN O
.
ÛÛO P
LoginProvider
ÛÛP ]
}
ÛÛ^ _
)
ÛÛ_ `
;
ÛÛ` a
table
ÙÙ 
.
ÙÙ 

ForeignKey
ÙÙ $
(
ÙÙ$ %
name
ıı 
:
ıı 
$str
ıı @
,
ıı@ A
column
ˆˆ 
:
ˆˆ 
x
ˆˆ  !
=>
ˆˆ" $
x
ˆˆ% &
.
ˆˆ& '
UserId
ˆˆ' -
,
ˆˆ- .
principalTable
˜˜ &
:
˜˜& '
$str
˜˜( 2
,
˜˜2 3
principalColumn
¯¯ '
:
¯¯' (
$str
¯¯) -
,
¯¯- .
onDelete
˘˘  
:
˘˘  !
ReferentialAction
˘˘" 3
.
˘˘3 4
Cascade
˘˘4 ;
)
˘˘; <
;
˘˘< =
}
˙˙ 
)
˙˙ 
;
˙˙ 
migrationBuilder
¸¸ 
.
¸¸ 
CreateTable
¸¸ (
(
¸¸( )
name
˝˝ 
:
˝˝ 
$str
˝˝ 0
,
˝˝0 1
columns
˛˛ 
:
˛˛ 
table
˛˛ 
=>
˛˛ !
new
˛˛" %
{
ˇˇ 
UserId
ÄÄ 
=
ÄÄ 
table
ÄÄ "
.
ÄÄ" #
Column
ÄÄ# )
<
ÄÄ) *
Guid
ÄÄ* .
>
ÄÄ. /
(
ÄÄ/ 0
type
ÄÄ0 4
:
ÄÄ4 5
$str
ÄÄ6 H
,
ÄÄH I
nullable
ÄÄJ R
:
ÄÄR S
false
ÄÄT Y
)
ÄÄY Z
,
ÄÄZ [ 
OrganizationUnitId
ÅÅ &
=
ÅÅ' (
table
ÅÅ) .
.
ÅÅ. /
Column
ÅÅ/ 5
<
ÅÅ5 6
Guid
ÅÅ6 :
>
ÅÅ: ;
(
ÅÅ; <
type
ÅÅ< @
:
ÅÅ@ A
$str
ÅÅB T
,
ÅÅT U
nullable
ÅÅV ^
:
ÅÅ^ _
false
ÅÅ` e
)
ÅÅe f
,
ÅÅf g
TenantId
ÇÇ 
=
ÇÇ 
table
ÇÇ $
.
ÇÇ$ %
Column
ÇÇ% +
<
ÇÇ+ ,
Guid
ÇÇ, 0
>
ÇÇ0 1
(
ÇÇ1 2
type
ÇÇ2 6
:
ÇÇ6 7
$str
ÇÇ8 J
,
ÇÇJ K
nullable
ÇÇL T
:
ÇÇT U
true
ÇÇV Z
)
ÇÇZ [
,
ÇÇ[ \
CreationTime
ÉÉ  
=
ÉÉ! "
table
ÉÉ# (
.
ÉÉ( )
Column
ÉÉ) /
<
ÉÉ/ 0
DateTime
ÉÉ0 8
>
ÉÉ8 9
(
ÉÉ9 :
type
ÉÉ: >
:
ÉÉ> ?
$str
ÉÉ@ K
,
ÉÉK L
nullable
ÉÉM U
:
ÉÉU V
false
ÉÉW \
)
ÉÉ\ ]
,
ÉÉ] ^
	CreatorId
ÑÑ 
=
ÑÑ 
table
ÑÑ  %
.
ÑÑ% &
Column
ÑÑ& ,
<
ÑÑ, -
Guid
ÑÑ- 1
>
ÑÑ1 2
(
ÑÑ2 3
type
ÑÑ3 7
:
ÑÑ7 8
$str
ÑÑ9 K
,
ÑÑK L
nullable
ÑÑM U
:
ÑÑU V
true
ÑÑW [
)
ÑÑ[ \
}
ÖÖ 
,
ÖÖ 
constraints
ÜÜ 
:
ÜÜ 
table
ÜÜ "
=>
ÜÜ# %
{
áá 
table
àà 
.
àà 

PrimaryKey
àà $
(
àà$ %
$str
àà% B
,
ààB C
x
ààD E
=>
ààF H
new
ààI L
{
ààM N
x
ààO P
.
ààP Q 
OrganizationUnitId
ààQ c
,
ààc d
x
ààe f
.
ààf g
UserId
ààg m
}
ààn o
)
àào p
;
ààp q
table
ââ 
.
ââ 

ForeignKey
ââ $
(
ââ$ %
name
ää 
:
ää 
$str
ää c
,
ääc d
column
ãã 
:
ãã 
x
ãã  !
=>
ãã" $
x
ãã% &
.
ãã& ' 
OrganizationUnitId
ãã' 9
,
ãã9 :
principalTable
åå &
:
åå& '
$str
åå( >
,
åå> ?
principalColumn
çç '
:
çç' (
$str
çç) -
,
çç- .
onDelete
éé  
:
éé  !
ReferentialAction
éé" 3
.
éé3 4
Cascade
éé4 ;
)
éé; <
;
éé< =
table
èè 
.
èè 

ForeignKey
èè $
(
èè$ %
name
êê 
:
êê 
$str
êê K
,
êêK L
column
ëë 
:
ëë 
x
ëë  !
=>
ëë" $
x
ëë% &
.
ëë& '
UserId
ëë' -
,
ëë- .
principalTable
íí &
:
íí& '
$str
íí( 2
,
íí2 3
principalColumn
ìì '
:
ìì' (
$str
ìì) -
,
ìì- .
onDelete
îî  
:
îî  !
ReferentialAction
îî" 3
.
îî3 4
Cascade
îî4 ;
)
îî; <
;
îî< =
}
ïï 
)
ïï 
;
ïï 
migrationBuilder
óó 
.
óó 
CreateTable
óó (
(
óó( )
name
òò 
:
òò 
$str
òò $
,
òò$ %
columns
ôô 
:
ôô 
table
ôô 
=>
ôô !
new
ôô" %
{
öö 
UserId
õõ 
=
õõ 
table
õõ "
.
õõ" #
Column
õõ# )
<
õõ) *
Guid
õõ* .
>
õõ. /
(
õõ/ 0
type
õõ0 4
:
õõ4 5
$str
õõ6 H
,
õõH I
nullable
õõJ R
:
õõR S
false
õõT Y
)
õõY Z
,
õõZ [
RoleId
úú 
=
úú 
table
úú "
.
úú" #
Column
úú# )
<
úú) *
Guid
úú* .
>
úú. /
(
úú/ 0
type
úú0 4
:
úú4 5
$str
úú6 H
,
úúH I
nullable
úúJ R
:
úúR S
false
úúT Y
)
úúY Z
,
úúZ [
TenantId
ùù 
=
ùù 
table
ùù $
.
ùù$ %
Column
ùù% +
<
ùù+ ,
Guid
ùù, 0
>
ùù0 1
(
ùù1 2
type
ùù2 6
:
ùù6 7
$str
ùù8 J
,
ùùJ K
nullable
ùùL T
:
ùùT U
true
ùùV Z
)
ùùZ [
}
ûû 
,
ûû 
constraints
üü 
:
üü 
table
üü "
=>
üü# %
{
†† 
table
°° 
.
°° 

PrimaryKey
°° $
(
°°$ %
$str
°°% 6
,
°°6 7
x
°°8 9
=>
°°: <
new
°°= @
{
°°A B
x
°°C D
.
°°D E
UserId
°°E K
,
°°K L
x
°°M N
.
°°N O
RoleId
°°O U
}
°°V W
)
°°W X
;
°°X Y
table
¢¢ 
.
¢¢ 

ForeignKey
¢¢ $
(
¢¢$ %
name
££ 
:
££ 
$str
££ ?
,
££? @
column
§§ 
:
§§ 
x
§§  !
=>
§§" $
x
§§% &
.
§§& '
RoleId
§§' -
,
§§- .
principalTable
•• &
:
••& '
$str
••( 2
,
••2 3
principalColumn
¶¶ '
:
¶¶' (
$str
¶¶) -
,
¶¶- .
onDelete
ßß  
:
ßß  !
ReferentialAction
ßß" 3
.
ßß3 4
Cascade
ßß4 ;
)
ßß; <
;
ßß< =
table
®® 
.
®® 

ForeignKey
®® $
(
®®$ %
name
©© 
:
©© 
$str
©© ?
,
©©? @
column
™™ 
:
™™ 
x
™™  !
=>
™™" $
x
™™% &
.
™™& '
UserId
™™' -
,
™™- .
principalTable
´´ &
:
´´& '
$str
´´( 2
,
´´2 3
principalColumn
¨¨ '
:
¨¨' (
$str
¨¨) -
,
¨¨- .
onDelete
≠≠  
:
≠≠  !
ReferentialAction
≠≠" 3
.
≠≠3 4
Cascade
≠≠4 ;
)
≠≠; <
;
≠≠< =
}
ÆÆ 
)
ÆÆ 
;
ÆÆ 
migrationBuilder
∞∞ 
.
∞∞ 
CreateTable
∞∞ (
(
∞∞( )
name
±± 
:
±± 
$str
±± %
,
±±% &
columns
≤≤ 
:
≤≤ 
table
≤≤ 
=>
≤≤ !
new
≤≤" %
{
≥≥ 
UserId
¥¥ 
=
¥¥ 
table
¥¥ "
.
¥¥" #
Column
¥¥# )
<
¥¥) *
Guid
¥¥* .
>
¥¥. /
(
¥¥/ 0
type
¥¥0 4
:
¥¥4 5
$str
¥¥6 H
,
¥¥H I
nullable
¥¥J R
:
¥¥R S
false
¥¥T Y
)
¥¥Y Z
,
¥¥Z [
LoginProvider
µµ !
=
µµ" #
table
µµ$ )
.
µµ) *
Column
µµ* 0
<
µµ0 1
string
µµ1 7
>
µµ7 8
(
µµ8 9
type
µµ9 =
:
µµ= >
$str
µµ? M
,
µµM N
	maxLength
µµO X
:
µµX Y
$num
µµZ \
,
µµ\ ]
nullable
µµ^ f
:
µµf g
false
µµh m
)
µµm n
,
µµn o
Name
∂∂ 
=
∂∂ 
table
∂∂  
.
∂∂  !
Column
∂∂! '
<
∂∂' (
string
∂∂( .
>
∂∂. /
(
∂∂/ 0
type
∂∂0 4
:
∂∂4 5
$str
∂∂6 E
,
∂∂E F
	maxLength
∂∂G P
:
∂∂P Q
$num
∂∂R U
,
∂∂U V
nullable
∂∂W _
:
∂∂_ `
false
∂∂a f
)
∂∂f g
,
∂∂g h
TenantId
∑∑ 
=
∑∑ 
table
∑∑ $
.
∑∑$ %
Column
∑∑% +
<
∑∑+ ,
Guid
∑∑, 0
>
∑∑0 1
(
∑∑1 2
type
∑∑2 6
:
∑∑6 7
$str
∑∑8 J
,
∑∑J K
nullable
∑∑L T
:
∑∑T U
true
∑∑V Z
)
∑∑Z [
,
∑∑[ \
Value
∏∏ 
=
∏∏ 
table
∏∏ !
.
∏∏! "
Column
∏∏" (
<
∏∏( )
string
∏∏) /
>
∏∏/ 0
(
∏∏0 1
type
∏∏1 5
:
∏∏5 6
$str
∏∏7 F
,
∏∏F G
nullable
∏∏H P
:
∏∏P Q
true
∏∏R V
)
∏∏V W
}
ππ 
,
ππ 
constraints
∫∫ 
:
∫∫ 
table
∫∫ "
=>
∫∫# %
{
ªª 
table
ºº 
.
ºº 

PrimaryKey
ºº $
(
ºº$ %
$str
ºº% 7
,
ºº7 8
x
ºº9 :
=>
ºº; =
new
ºº> A
{
ººB C
x
ººD E
.
ººE F
UserId
ººF L
,
ººL M
x
ººN O
.
ººO P
LoginProvider
ººP ]
,
ºº] ^
x
ºº_ `
.
ºº` a
Name
ººa e
}
ººf g
)
ººg h
;
ººh i
table
ΩΩ 
.
ΩΩ 

ForeignKey
ΩΩ $
(
ΩΩ$ %
name
ææ 
:
ææ 
$str
ææ @
,
ææ@ A
column
øø 
:
øø 
x
øø  !
=>
øø" $
x
øø% &
.
øø& '
UserId
øø' -
,
øø- .
principalTable
¿¿ &
:
¿¿& '
$str
¿¿( 2
,
¿¿2 3
principalColumn
¡¡ '
:
¡¡' (
$str
¡¡) -
,
¡¡- .
onDelete
¬¬  
:
¬¬  !
ReferentialAction
¬¬" 3
.
¬¬3 4
Cascade
¬¬4 ;
)
¬¬; <
;
¬¬< =
}
√√ 
)
√√ 
;
√√ 
migrationBuilder
≈≈ 
.
≈≈ 
CreateTable
≈≈ (
(
≈≈( )
name
∆∆ 
:
∆∆ 
$str
∆∆ 0
,
∆∆0 1
columns
«« 
:
«« 
table
«« 
=>
«« !
new
««" %
{
»» 
Id
…… 
=
…… 
table
…… 
.
…… 
Column
…… %
<
……% &
Guid
……& *
>
……* +
(
……+ ,
type
……, 0
:
……0 1
$str
……2 D
,
……D E
nullable
……F N
:
……N O
false
……P U
)
……U V
,
……V W
ApplicationId
   !
=
  " #
table
  $ )
.
  ) *
Column
  * 0
<
  0 1
Guid
  1 5
>
  5 6
(
  6 7
type
  7 ;
:
  ; <
$str
  = O
,
  O P
nullable
  Q Y
:
  Y Z
true
  [ _
)
  _ `
,
  ` a
CreationDate
ÀÀ  
=
ÀÀ! "
table
ÀÀ# (
.
ÀÀ( )
Column
ÀÀ) /
<
ÀÀ/ 0
DateTime
ÀÀ0 8
>
ÀÀ8 9
(
ÀÀ9 :
type
ÀÀ: >
:
ÀÀ> ?
$str
ÀÀ@ K
,
ÀÀK L
nullable
ÀÀM U
:
ÀÀU V
true
ÀÀW [
)
ÀÀ[ \
,
ÀÀ\ ]

Properties
ÃÃ 
=
ÃÃ  
table
ÃÃ! &
.
ÃÃ& '
Column
ÃÃ' -
<
ÃÃ- .
string
ÃÃ. 4
>
ÃÃ4 5
(
ÃÃ5 6
type
ÃÃ6 :
:
ÃÃ: ;
$str
ÃÃ< K
,
ÃÃK L
nullable
ÃÃM U
:
ÃÃU V
true
ÃÃW [
)
ÃÃ[ \
,
ÃÃ\ ]
Scopes
ÕÕ 
=
ÕÕ 
table
ÕÕ "
.
ÕÕ" #
Column
ÕÕ# )
<
ÕÕ) *
string
ÕÕ* 0
>
ÕÕ0 1
(
ÕÕ1 2
type
ÕÕ2 6
:
ÕÕ6 7
$str
ÕÕ8 G
,
ÕÕG H
nullable
ÕÕI Q
:
ÕÕQ R
true
ÕÕS W
)
ÕÕW X
,
ÕÕX Y
Status
ŒŒ 
=
ŒŒ 
table
ŒŒ "
.
ŒŒ" #
Column
ŒŒ# )
<
ŒŒ) *
string
ŒŒ* 0
>
ŒŒ0 1
(
ŒŒ1 2
type
ŒŒ2 6
:
ŒŒ6 7
$str
ŒŒ8 F
,
ŒŒF G
	maxLength
ŒŒH Q
:
ŒŒQ R
$num
ŒŒS U
,
ŒŒU V
nullable
ŒŒW _
:
ŒŒ_ `
true
ŒŒa e
)
ŒŒe f
,
ŒŒf g
Subject
œœ 
=
œœ 
table
œœ #
.
œœ# $
Column
œœ$ *
<
œœ* +
string
œœ+ 1
>
œœ1 2
(
œœ2 3
type
œœ3 7
:
œœ7 8
$str
œœ9 H
,
œœH I
	maxLength
œœJ S
:
œœS T
$num
œœU X
,
œœX Y
nullable
œœZ b
:
œœb c
true
œœd h
)
œœh i
,
œœi j
Type
–– 
=
–– 
table
––  
.
––  !
Column
––! '
<
––' (
string
––( .
>
––. /
(
––/ 0
type
––0 4
:
––4 5
$str
––6 D
,
––D E
	maxLength
––F O
:
––O P
$num
––Q S
,
––S T
nullable
––U ]
:
––] ^
true
––_ c
)
––c d
,
––d e
ExtraProperties
—— #
=
——$ %
table
——& +
.
——+ ,
Column
——, 2
<
——2 3
string
——3 9
>
——9 :
(
——: ;
type
——; ?
:
——? @
$str
——A P
,
——P Q
nullable
——R Z
:
——Z [
false
——\ a
)
——a b
,
——b c
ConcurrencyStamp
““ $
=
““% &
table
““' ,
.
““, -
Column
““- 3
<
““3 4
string
““4 :
>
““: ;
(
““; <
type
““< @
:
““@ A
$str
““B P
,
““P Q
	maxLength
““R [
:
““[ \
$num
““] _
,
““_ `
nullable
““a i
:
““i j
false
““k p
)
““p q
,
““q r
CreationTime
””  
=
””! "
table
””# (
.
””( )
Column
””) /
<
””/ 0
DateTime
””0 8
>
””8 9
(
””9 :
type
””: >
:
””> ?
$str
””@ K
,
””K L
nullable
””M U
:
””U V
false
””W \
)
””\ ]
,
””] ^
	CreatorId
‘‘ 
=
‘‘ 
table
‘‘  %
.
‘‘% &
Column
‘‘& ,
<
‘‘, -
Guid
‘‘- 1
>
‘‘1 2
(
‘‘2 3
type
‘‘3 7
:
‘‘7 8
$str
‘‘9 K
,
‘‘K L
nullable
‘‘M U
:
‘‘U V
true
‘‘W [
)
‘‘[ \
,
‘‘\ ]"
LastModificationTime
’’ (
=
’’) *
table
’’+ 0
.
’’0 1
Column
’’1 7
<
’’7 8
DateTime
’’8 @
>
’’@ A
(
’’A B
type
’’B F
:
’’F G
$str
’’H S
,
’’S T
nullable
’’U ]
:
’’] ^
true
’’_ c
)
’’c d
,
’’d e
LastModifierId
÷÷ "
=
÷÷# $
table
÷÷% *
.
÷÷* +
Column
÷÷+ 1
<
÷÷1 2
Guid
÷÷2 6
>
÷÷6 7
(
÷÷7 8
type
÷÷8 <
:
÷÷< =
$str
÷÷> P
,
÷÷P Q
nullable
÷÷R Z
:
÷÷Z [
true
÷÷\ `
)
÷÷` a
,
÷÷a b
	IsDeleted
◊◊ 
=
◊◊ 
table
◊◊  %
.
◊◊% &
Column
◊◊& ,
<
◊◊, -
bool
◊◊- 1
>
◊◊1 2
(
◊◊2 3
type
◊◊3 7
:
◊◊7 8
$str
◊◊9 >
,
◊◊> ?
nullable
◊◊@ H
:
◊◊H I
false
◊◊J O
,
◊◊O P
defaultValue
◊◊Q ]
:
◊◊] ^
false
◊◊_ d
)
◊◊d e
,
◊◊e f
	DeleterId
ÿÿ 
=
ÿÿ 
table
ÿÿ  %
.
ÿÿ% &
Column
ÿÿ& ,
<
ÿÿ, -
Guid
ÿÿ- 1
>
ÿÿ1 2
(
ÿÿ2 3
type
ÿÿ3 7
:
ÿÿ7 8
$str
ÿÿ9 K
,
ÿÿK L
nullable
ÿÿM U
:
ÿÿU V
true
ÿÿW [
)
ÿÿ[ \
,
ÿÿ\ ]
DeletionTime
ŸŸ  
=
ŸŸ! "
table
ŸŸ# (
.
ŸŸ( )
Column
ŸŸ) /
<
ŸŸ/ 0
DateTime
ŸŸ0 8
>
ŸŸ8 9
(
ŸŸ9 :
type
ŸŸ: >
:
ŸŸ> ?
$str
ŸŸ@ K
,
ŸŸK L
nullable
ŸŸM U
:
ŸŸU V
true
ŸŸW [
)
ŸŸ[ \
}
⁄⁄ 
,
⁄⁄ 
constraints
€€ 
:
€€ 
table
€€ "
=>
€€# %
{
‹‹ 
table
›› 
.
›› 

PrimaryKey
›› $
(
››$ %
$str
››% B
,
››B C
x
››D E
=>
››F H
x
››I J
.
››J K
Id
››K M
)
››M N
;
››N O
table
ﬁﬁ 
.
ﬁﬁ 

ForeignKey
ﬁﬁ $
(
ﬁﬁ$ %
name
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ `
,
ﬂﬂ` a
column
‡‡ 
:
‡‡ 
x
‡‡  !
=>
‡‡" $
x
‡‡% &
.
‡‡& '
ApplicationId
‡‡' 4
,
‡‡4 5
principalTable
·· &
:
··& '
$str
··( @
,
··@ A
principalColumn
‚‚ '
:
‚‚' (
$str
‚‚) -
)
‚‚- .
;
‚‚. /
}
„„ 
)
„„ 
;
„„ 
migrationBuilder
ÂÂ 
.
ÂÂ 
CreateTable
ÂÂ (
(
ÂÂ( )
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ 0
,
ÊÊ0 1
columns
ÁÁ 
:
ÁÁ 
table
ÁÁ 
=>
ÁÁ !
new
ÁÁ" %
{
ËË 
Id
ÈÈ 
=
ÈÈ 
table
ÈÈ 
.
ÈÈ 
Column
ÈÈ %
<
ÈÈ% &
Guid
ÈÈ& *
>
ÈÈ* +
(
ÈÈ+ ,
type
ÈÈ, 0
:
ÈÈ0 1
$str
ÈÈ2 D
,
ÈÈD E
nullable
ÈÈF N
:
ÈÈN O
false
ÈÈP U
)
ÈÈU V
,
ÈÈV W
TenantId
ÍÍ 
=
ÍÍ 
table
ÍÍ $
.
ÍÍ$ %
Column
ÍÍ% +
<
ÍÍ+ ,
Guid
ÍÍ, 0
>
ÍÍ0 1
(
ÍÍ1 2
type
ÍÍ2 6
:
ÍÍ6 7
$str
ÍÍ8 J
,
ÍÍJ K
nullable
ÍÍL T
:
ÍÍT U
true
ÍÍV Z
)
ÍÍZ [
,
ÍÍ[ \
EntityChangeId
ÎÎ "
=
ÎÎ# $
table
ÎÎ% *
.
ÎÎ* +
Column
ÎÎ+ 1
<
ÎÎ1 2
Guid
ÎÎ2 6
>
ÎÎ6 7
(
ÎÎ7 8
type
ÎÎ8 <
:
ÎÎ< =
$str
ÎÎ> P
,
ÎÎP Q
nullable
ÎÎR Z
:
ÎÎZ [
false
ÎÎ\ a
)
ÎÎa b
,
ÎÎb c
NewValue
ÏÏ 
=
ÏÏ 
table
ÏÏ $
.
ÏÏ$ %
Column
ÏÏ% +
<
ÏÏ+ ,
string
ÏÏ, 2
>
ÏÏ2 3
(
ÏÏ3 4
type
ÏÏ4 8
:
ÏÏ8 9
$str
ÏÏ: I
,
ÏÏI J
	maxLength
ÏÏK T
:
ÏÏT U
$num
ÏÏV Y
,
ÏÏY Z
nullable
ÏÏ[ c
:
ÏÏc d
true
ÏÏe i
)
ÏÏi j
,
ÏÏj k
OriginalValue
ÌÌ !
=
ÌÌ" #
table
ÌÌ$ )
.
ÌÌ) *
Column
ÌÌ* 0
<
ÌÌ0 1
string
ÌÌ1 7
>
ÌÌ7 8
(
ÌÌ8 9
type
ÌÌ9 =
:
ÌÌ= >
$str
ÌÌ? N
,
ÌÌN O
	maxLength
ÌÌP Y
:
ÌÌY Z
$num
ÌÌ[ ^
,
ÌÌ^ _
nullable
ÌÌ` h
:
ÌÌh i
true
ÌÌj n
)
ÌÌn o
,
ÌÌo p
PropertyName
ÓÓ  
=
ÓÓ! "
table
ÓÓ# (
.
ÓÓ( )
Column
ÓÓ) /
<
ÓÓ/ 0
string
ÓÓ0 6
>
ÓÓ6 7
(
ÓÓ7 8
type
ÓÓ8 <
:
ÓÓ< =
$str
ÓÓ> M
,
ÓÓM N
	maxLength
ÓÓO X
:
ÓÓX Y
$num
ÓÓZ ]
,
ÓÓ] ^
nullable
ÓÓ_ g
:
ÓÓg h
false
ÓÓi n
)
ÓÓn o
,
ÓÓo p"
PropertyTypeFullName
ÔÔ (
=
ÔÔ) *
table
ÔÔ+ 0
.
ÔÔ0 1
Column
ÔÔ1 7
<
ÔÔ7 8
string
ÔÔ8 >
>
ÔÔ> ?
(
ÔÔ? @
type
ÔÔ@ D
:
ÔÔD E
$str
ÔÔF T
,
ÔÔT U
	maxLength
ÔÔV _
:
ÔÔ_ `
$num
ÔÔa c
,
ÔÔc d
nullable
ÔÔe m
:
ÔÔm n
false
ÔÔo t
)
ÔÔt u
}
 
,
 
constraints
ÒÒ 
:
ÒÒ 
table
ÒÒ "
=>
ÒÒ# %
{
ÚÚ 
table
ÛÛ 
.
ÛÛ 

PrimaryKey
ÛÛ $
(
ÛÛ$ %
$str
ÛÛ% B
,
ÛÛB C
x
ÛÛD E
=>
ÛÛF H
x
ÛÛI J
.
ÛÛJ K
Id
ÛÛK M
)
ÛÛM N
;
ÛÛN O
table
ÙÙ 
.
ÙÙ 

ForeignKey
ÙÙ $
(
ÙÙ$ %
name
ıı 
:
ıı 
$str
ıı [
,
ıı[ \
column
ˆˆ 
:
ˆˆ 
x
ˆˆ  !
=>
ˆˆ" $
x
ˆˆ% &
.
ˆˆ& '
EntityChangeId
ˆˆ' 5
,
ˆˆ5 6
principalTable
˜˜ &
:
˜˜& '
$str
˜˜( :
,
˜˜: ;
principalColumn
¯¯ '
:
¯¯' (
$str
¯¯) -
,
¯¯- .
onDelete
˘˘  
:
˘˘  !
ReferentialAction
˘˘" 3
.
˘˘3 4
Cascade
˘˘4 ;
)
˘˘; <
;
˘˘< =
}
˙˙ 
)
˙˙ 
;
˙˙ 
migrationBuilder
¸¸ 
.
¸¸ 
CreateTable
¸¸ (
(
¸¸( )
name
˝˝ 
:
˝˝ 
$str
˝˝ (
,
˝˝( )
columns
˛˛ 
:
˛˛ 
table
˛˛ 
=>
˛˛ !
new
˛˛" %
{
ˇˇ 
Id
ÄÄ 
=
ÄÄ 
table
ÄÄ 
.
ÄÄ 
Column
ÄÄ %
<
ÄÄ% &
Guid
ÄÄ& *
>
ÄÄ* +
(
ÄÄ+ ,
type
ÄÄ, 0
:
ÄÄ0 1
$str
ÄÄ2 D
,
ÄÄD E
nullable
ÄÄF N
:
ÄÄN O
false
ÄÄP U
)
ÄÄU V
,
ÄÄV W
ApplicationId
ÅÅ !
=
ÅÅ" #
table
ÅÅ$ )
.
ÅÅ) *
Column
ÅÅ* 0
<
ÅÅ0 1
Guid
ÅÅ1 5
>
ÅÅ5 6
(
ÅÅ6 7
type
ÅÅ7 ;
:
ÅÅ; <
$str
ÅÅ= O
,
ÅÅO P
nullable
ÅÅQ Y
:
ÅÅY Z
true
ÅÅ[ _
)
ÅÅ_ `
,
ÅÅ` a
AuthorizationId
ÇÇ #
=
ÇÇ$ %
table
ÇÇ& +
.
ÇÇ+ ,
Column
ÇÇ, 2
<
ÇÇ2 3
Guid
ÇÇ3 7
>
ÇÇ7 8
(
ÇÇ8 9
type
ÇÇ9 =
:
ÇÇ= >
$str
ÇÇ? Q
,
ÇÇQ R
nullable
ÇÇS [
:
ÇÇ[ \
true
ÇÇ] a
)
ÇÇa b
,
ÇÇb c
CreationDate
ÉÉ  
=
ÉÉ! "
table
ÉÉ# (
.
ÉÉ( )
Column
ÉÉ) /
<
ÉÉ/ 0
DateTime
ÉÉ0 8
>
ÉÉ8 9
(
ÉÉ9 :
type
ÉÉ: >
:
ÉÉ> ?
$str
ÉÉ@ K
,
ÉÉK L
nullable
ÉÉM U
:
ÉÉU V
true
ÉÉW [
)
ÉÉ[ \
,
ÉÉ\ ]
ExpirationDate
ÑÑ "
=
ÑÑ# $
table
ÑÑ% *
.
ÑÑ* +
Column
ÑÑ+ 1
<
ÑÑ1 2
DateTime
ÑÑ2 :
>
ÑÑ: ;
(
ÑÑ; <
type
ÑÑ< @
:
ÑÑ@ A
$str
ÑÑB M
,
ÑÑM N
nullable
ÑÑO W
:
ÑÑW X
true
ÑÑY ]
)
ÑÑ] ^
,
ÑÑ^ _
Payload
ÖÖ 
=
ÖÖ 
table
ÖÖ #
.
ÖÖ# $
Column
ÖÖ$ *
<
ÖÖ* +
string
ÖÖ+ 1
>
ÖÖ1 2
(
ÖÖ2 3
type
ÖÖ3 7
:
ÖÖ7 8
$str
ÖÖ9 H
,
ÖÖH I
nullable
ÖÖJ R
:
ÖÖR S
true
ÖÖT X
)
ÖÖX Y
,
ÖÖY Z

Properties
ÜÜ 
=
ÜÜ  
table
ÜÜ! &
.
ÜÜ& '
Column
ÜÜ' -
<
ÜÜ- .
string
ÜÜ. 4
>
ÜÜ4 5
(
ÜÜ5 6
type
ÜÜ6 :
:
ÜÜ: ;
$str
ÜÜ< K
,
ÜÜK L
nullable
ÜÜM U
:
ÜÜU V
true
ÜÜW [
)
ÜÜ[ \
,
ÜÜ\ ]
RedemptionDate
áá "
=
áá# $
table
áá% *
.
áá* +
Column
áá+ 1
<
áá1 2
DateTime
áá2 :
>
áá: ;
(
áá; <
type
áá< @
:
áá@ A
$str
ááB M
,
ááM N
nullable
ááO W
:
ááW X
true
ááY ]
)
áá] ^
,
áá^ _
ReferenceId
àà 
=
àà  !
table
àà" '
.
àà' (
Column
àà( .
<
àà. /
string
àà/ 5
>
àà5 6
(
àà6 7
type
àà7 ;
:
àà; <
$str
àà= L
,
ààL M
	maxLength
ààN W
:
ààW X
$num
ààY \
,
àà\ ]
nullable
àà^ f
:
ààf g
true
ààh l
)
ààl m
,
ààm n
Status
ââ 
=
ââ 
table
ââ "
.
ââ" #
Column
ââ# )
<
ââ) *
string
ââ* 0
>
ââ0 1
(
ââ1 2
type
ââ2 6
:
ââ6 7
$str
ââ8 F
,
ââF G
	maxLength
ââH Q
:
ââQ R
$num
ââS U
,
ââU V
nullable
ââW _
:
ââ_ `
true
ââa e
)
ââe f
,
ââf g
Subject
ää 
=
ää 
table
ää #
.
ää# $
Column
ää$ *
<
ää* +
string
ää+ 1
>
ää1 2
(
ää2 3
type
ää3 7
:
ää7 8
$str
ää9 H
,
ääH I
	maxLength
ääJ S
:
ääS T
$num
ääU X
,
ääX Y
nullable
ääZ b
:
ääb c
true
ääd h
)
ääh i
,
ääi j
Type
ãã 
=
ãã 
table
ãã  
.
ãã  !
Column
ãã! '
<
ãã' (
string
ãã( .
>
ãã. /
(
ãã/ 0
type
ãã0 4
:
ãã4 5
$str
ãã6 D
,
ããD E
	maxLength
ããF O
:
ããO P
$num
ããQ S
,
ããS T
nullable
ããU ]
:
ãã] ^
true
ãã_ c
)
ããc d
,
ããd e
ExtraProperties
åå #
=
åå$ %
table
åå& +
.
åå+ ,
Column
åå, 2
<
åå2 3
string
åå3 9
>
åå9 :
(
åå: ;
type
åå; ?
:
åå? @
$str
ååA P
,
ååP Q
nullable
ååR Z
:
ååZ [
false
åå\ a
)
ååa b
,
ååb c
ConcurrencyStamp
çç $
=
çç% &
table
çç' ,
.
çç, -
Column
çç- 3
<
çç3 4
string
çç4 :
>
çç: ;
(
çç; <
type
çç< @
:
çç@ A
$str
ççB P
,
ççP Q
	maxLength
ççR [
:
çç[ \
$num
çç] _
,
çç_ `
nullable
çça i
:
ççi j
false
ççk p
)
ççp q
,
ççq r
CreationTime
éé  
=
éé! "
table
éé# (
.
éé( )
Column
éé) /
<
éé/ 0
DateTime
éé0 8
>
éé8 9
(
éé9 :
type
éé: >
:
éé> ?
$str
éé@ K
,
ééK L
nullable
ééM U
:
ééU V
false
ééW \
)
éé\ ]
,
éé] ^
	CreatorId
èè 
=
èè 
table
èè  %
.
èè% &
Column
èè& ,
<
èè, -
Guid
èè- 1
>
èè1 2
(
èè2 3
type
èè3 7
:
èè7 8
$str
èè9 K
,
èèK L
nullable
èèM U
:
èèU V
true
èèW [
)
èè[ \
,
èè\ ]"
LastModificationTime
êê (
=
êê) *
table
êê+ 0
.
êê0 1
Column
êê1 7
<
êê7 8
DateTime
êê8 @
>
êê@ A
(
êêA B
type
êêB F
:
êêF G
$str
êêH S
,
êêS T
nullable
êêU ]
:
êê] ^
true
êê_ c
)
êêc d
,
êêd e
LastModifierId
ëë "
=
ëë# $
table
ëë% *
.
ëë* +
Column
ëë+ 1
<
ëë1 2
Guid
ëë2 6
>
ëë6 7
(
ëë7 8
type
ëë8 <
:
ëë< =
$str
ëë> P
,
ëëP Q
nullable
ëëR Z
:
ëëZ [
true
ëë\ `
)
ëë` a
,
ëëa b
	IsDeleted
íí 
=
íí 
table
íí  %
.
íí% &
Column
íí& ,
<
íí, -
bool
íí- 1
>
íí1 2
(
íí2 3
type
íí3 7
:
íí7 8
$str
íí9 >
,
íí> ?
nullable
íí@ H
:
ííH I
false
ííJ O
,
ííO P
defaultValue
ííQ ]
:
íí] ^
false
íí_ d
)
ííd e
,
ííe f
	DeleterId
ìì 
=
ìì 
table
ìì  %
.
ìì% &
Column
ìì& ,
<
ìì, -
Guid
ìì- 1
>
ìì1 2
(
ìì2 3
type
ìì3 7
:
ìì7 8
$str
ìì9 K
,
ììK L
nullable
ììM U
:
ììU V
true
ììW [
)
ìì[ \
,
ìì\ ]
DeletionTime
îî  
=
îî! "
table
îî# (
.
îî( )
Column
îî) /
<
îî/ 0
DateTime
îî0 8
>
îî8 9
(
îî9 :
type
îî: >
:
îî> ?
$str
îî@ K
,
îîK L
nullable
îîM U
:
îîU V
true
îîW [
)
îî[ \
}
ïï 
,
ïï 
constraints
ññ 
:
ññ 
table
ññ "
=>
ññ# %
{
óó 
table
òò 
.
òò 

PrimaryKey
òò $
(
òò$ %
$str
òò% :
,
òò: ;
x
òò< =
=>
òò> @
x
òòA B
.
òòB C
Id
òòC E
)
òòE F
;
òòF G
table
ôô 
.
ôô 

ForeignKey
ôô $
(
ôô$ %
name
öö 
:
öö 
$str
öö X
,
ööX Y
column
õõ 
:
õõ 
x
õõ  !
=>
õõ" $
x
õõ% &
.
õõ& '
ApplicationId
õõ' 4
,
õõ4 5
principalTable
úú &
:
úú& '
$str
úú( @
,
úú@ A
principalColumn
ùù '
:
ùù' (
$str
ùù) -
)
ùù- .
;
ùù. /
table
ûû 
.
ûû 

ForeignKey
ûû $
(
ûû$ %
name
üü 
:
üü 
$str
üü \
,
üü\ ]
column
†† 
:
†† 
x
††  !
=>
††" $
x
††% &
.
††& '
AuthorizationId
††' 6
,
††6 7
principalTable
°° &
:
°°& '
$str
°°( B
,
°°B C
principalColumn
¢¢ '
:
¢¢' (
$str
¢¢) -
)
¢¢- .
;
¢¢. /
}
££ 
)
££ 
;
££ 
migrationBuilder
•• 
.
•• 
CreateIndex
•• (
(
••( )
name
¶¶ 
:
¶¶ 
$str
¶¶ 8
,
¶¶8 9
table
ßß 
:
ßß 
$str
ßß +
,
ßß+ ,
column
®® 
:
®® 
$str
®® $
)
®®$ %
;
®®% &
migrationBuilder
™™ 
.
™™ 
CreateIndex
™™ (
(
™™( )
name
´´ 
:
´´ 
$str
´´ [
,
´´[ \
table
¨¨ 
:
¨¨ 
$str
¨¨ +
,
¨¨+ ,
columns
≠≠ 
:
≠≠ 
new
≠≠ 
[
≠≠ 
]
≠≠ 
{
≠≠  
$str
≠≠! +
,
≠≠+ ,
$str
≠≠- :
,
≠≠: ;
$str
≠≠< H
,
≠≠H I
$str
≠≠J Y
}
≠≠Z [
)
≠≠[ \
;
≠≠\ ]
migrationBuilder
ØØ 
.
ØØ 
CreateIndex
ØØ (
(
ØØ( )
name
∞∞ 
:
∞∞ 
$str
∞∞ >
,
∞∞> ?
table
±± 
:
±± 
$str
±± %
,
±±% &
columns
≤≤ 
:
≤≤ 
new
≤≤ 
[
≤≤ 
]
≤≤ 
{
≤≤  
$str
≤≤! +
,
≤≤+ ,
$str
≤≤- <
}
≤≤= >
)
≤≤> ?
;
≤≤? @
migrationBuilder
¥¥ 
.
¥¥ 
CreateIndex
¥¥ (
(
¥¥( )
name
µµ 
:
µµ 
$str
µµ E
,
µµE F
table
∂∂ 
:
∂∂ 
$str
∂∂ %
,
∂∂% &
columns
∑∑ 
:
∑∑ 
new
∑∑ 
[
∑∑ 
]
∑∑ 
{
∑∑  
$str
∑∑! +
,
∑∑+ ,
$str
∑∑- 5
,
∑∑5 6
$str
∑∑7 F
}
∑∑G H
)
∑∑H I
;
∑∑I J
migrationBuilder
ππ 
.
ππ 
CreateIndex
ππ (
(
ππ( )
name
∫∫ 
:
∫∫ 
$str
∫∫ D
,
∫∫D E
table
ªª 
:
ªª 
$str
ªª *
,
ªª* +
columns
ºº 
:
ºº 
new
ºº 
[
ºº 
]
ºº 
{
ºº  
$str
ºº! .
,
ºº. /
$str
ºº0 =
}
ºº> ?
)
ºº? @
;
ºº@ A
migrationBuilder
ææ 
.
ææ 
CreateIndex
ææ (
(
ææ( )
name
øø 
:
øø 
$str
øø 6
,
øø6 7
table
¿¿ 
:
¿¿ 
$str
¿¿ )
,
¿¿) *
column
¡¡ 
:
¡¡ 
$str
¡¡ $
)
¡¡$ %
;
¡¡% &
migrationBuilder
√√ 
.
√√ 
CreateIndex
√√ (
(
√√( )
name
ƒƒ 
:
ƒƒ 
$str
ƒƒ P
,
ƒƒP Q
table
≈≈ 
:
≈≈ 
$str
≈≈ )
,
≈≈) *
columns
∆∆ 
:
∆∆ 
new
∆∆ 
[
∆∆ 
]
∆∆ 
{
∆∆  
$str
∆∆! +
,
∆∆+ ,
$str
∆∆- A
,
∆∆A B
$str
∆∆C M
}
∆∆N O
)
∆∆O P
;
∆∆P Q
migrationBuilder
»» 
.
»» 
CreateIndex
»» (
(
»»( )
name
…… 
:
…… 
$str
…… B
,
……B C
table
   
:
   
$str
   1
,
  1 2
column
ÀÀ 
:
ÀÀ 
$str
ÀÀ (
)
ÀÀ( )
;
ÀÀ) *
migrationBuilder
ÕÕ 
.
ÕÕ 
CreateIndex
ÕÕ (
(
ÕÕ( )
name
ŒŒ 
:
ŒŒ 
$str
ŒŒ 0
,
ŒŒ0 1
table
œœ 
:
œœ 
$str
œœ )
,
œœ) *
column
–– 
:
–– 
$str
–– 
,
–– 
unique
—— 
:
—— 
true
—— 
)
—— 
;
—— 
migrationBuilder
”” 
.
”” 
CreateIndex
”” (
(
””( )
name
‘‘ 
:
‘‘ 
$str
‘‘ 0
,
‘‘0 1
table
’’ 
:
’’ 
$str
’’ $
,
’’$ %
column
÷÷ 
:
÷÷ 
$str
÷÷ #
)
÷÷# $
;
÷÷$ %
migrationBuilder
ÿÿ 
.
ÿÿ 
CreateIndex
ÿÿ (
(
ÿÿ( )
name
ŸŸ 
:
ŸŸ 
$str
ŸŸ +
,
ŸŸ+ ,
table
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄ $
,
⁄⁄$ %
column
€€ 
:
€€ 
$str
€€ 
,
€€ 
unique
‹‹ 
:
‹‹ 
true
‹‹ 
)
‹‹ 
;
‹‹ 
migrationBuilder
ﬁﬁ 
.
ﬁﬁ 
CreateIndex
ﬁﬁ (
(
ﬁﬁ( )
name
ﬂﬂ 
:
ﬂﬂ 
$str
ﬂﬂ I
,
ﬂﬂI J
table
‡‡ 
:
‡‡ 
$str
‡‡ )
,
‡‡) *
columns
·· 
:
·· 
new
·· 
[
·· 
]
·· 
{
··  
$str
··! '
,
··' (
$str
··) 7
,
··7 8
$str
··9 F
}
··G H
,
··H I
unique
‚‚ 
:
‚‚ 
true
‚‚ 
,
‚‚ 
filter
„„ 
:
„„ 
$str
„„ R
)
„„R S
;
„„S T
migrationBuilder
ÂÂ 
.
ÂÂ 
CreateIndex
ÂÂ (
(
ÂÂ( )
name
ÊÊ 
:
ÊÊ 
$str
ÊÊ _
,
ÊÊ_ `
table
ÁÁ 
:
ÁÁ 
$str
ÁÁ %
,
ÁÁ% &
columns
ËË 
:
ËË 
new
ËË 
[
ËË 
]
ËË 
{
ËË  
$str
ËË! /
,
ËË/ 0
$str
ËË1 A
,
ËËA B
$str
ËËC Q
,
ËËQ R
$str
ËËS c
}
ËËd e
,
ËËe f
unique
ÈÈ 
:
ÈÈ 
true
ÈÈ 
,
ÈÈ 
filter
ÍÍ 
:
ÍÍ 
$str
ÍÍ W
)
ÍÍW X
;
ÍÍX Y
migrationBuilder
ÏÏ 
.
ÏÏ 
CreateIndex
ÏÏ (
(
ÏÏ( )
name
ÌÌ 
:
ÌÌ 
$str
ÌÌ M
,
ÌÌM N
table
ÓÓ 
:
ÓÓ 
$str
ÓÓ 1
,
ÓÓ1 2
columns
ÔÔ 
:
ÔÔ 
new
ÔÔ 
[
ÔÔ 
]
ÔÔ 
{
ÔÔ  
$str
ÔÔ! )
,
ÔÔ) *
$str
ÔÔ+ ?
}
ÔÔ@ A
)
ÔÔA B
;
ÔÔB C
migrationBuilder
ÒÒ 
.
ÒÒ 
CreateIndex
ÒÒ (
(
ÒÒ( )
name
ÚÚ 
:
ÚÚ 
$str
ÚÚ 4
,
ÚÚ4 5
table
ÛÛ 
:
ÛÛ 
$str
ÛÛ -
,
ÛÛ- .
column
ÙÙ 
:
ÙÙ 
$str
ÙÙ 
)
ÙÙ 
;
ÙÙ  
migrationBuilder
ˆˆ 
.
ˆˆ 
CreateIndex
ˆˆ (
(
ˆˆ( )
name
˜˜ 
:
˜˜ 
$str
˜˜ 8
,
˜˜8 9
table
¯¯ 
:
¯¯ 
$str
¯¯ -
,
¯¯- .
column
˘˘ 
:
˘˘ 
$str
˘˘ "
)
˘˘" #
;
˘˘# $
migrationBuilder
˚˚ 
.
˚˚ 
CreateIndex
˚˚ (
(
˚˚( )
name
¸¸ 
:
¸¸ 
$str
¸¸ U
,
¸¸U V
table
˝˝ 
:
˝˝ 
$str
˝˝ ,
,
˝˝, -
columns
˛˛ 
:
˛˛ 
new
˛˛ 
[
˛˛ 
]
˛˛ 
{
˛˛  
$str
˛˛! +
,
˛˛+ ,
$str
˛˛- 3
,
˛˛3 4
$str
˛˛5 C
,
˛˛C D
$str
˛˛E R
}
˛˛S T
,
˛˛T U
unique
ˇˇ 
:
ˇˇ 
true
ˇˇ 
,
ˇˇ 
filter
ÄÄ 
:
ÄÄ 
$str
ÄÄ 0
)
ÄÄ0 1
;
ÄÄ1 2
migrationBuilder
ÇÇ 
.
ÇÇ 
CreateIndex
ÇÇ (
(
ÇÇ( )
name
ÉÉ 
:
ÉÉ 
$str
ÉÉ 3
,
ÉÉ3 4
table
ÑÑ 
:
ÑÑ 
$str
ÑÑ ,
,
ÑÑ, -
column
ÖÖ 
:
ÖÖ 
$str
ÖÖ 
,
ÖÖ 
unique
ÜÜ 
:
ÜÜ 
true
ÜÜ 
)
ÜÜ 
;
ÜÜ 
migrationBuilder
àà 
.
àà 
CreateIndex
àà (
(
àà( )
name
ââ 
:
ââ 
$str
ââ 3
,
ââ3 4
table
ää 
:
ää 
$str
ää '
,
ää' (
column
ãã 
:
ãã 
$str
ãã #
)
ãã# $
;
ãã$ %
migrationBuilder
çç 
.
çç 
CreateIndex
çç (
(
çç( )
name
éé 
:
éé 
$str
éé .
,
éé. /
table
èè 
:
èè 
$str
èè '
,
èè' (
column
êê 
:
êê 
$str
êê 
,
êê 
unique
ëë 
:
ëë 
true
ëë 
)
ëë 
;
ëë 
migrationBuilder
ìì 
.
ìì 
CreateIndex
ìì (
(
ìì( )
name
îî 
:
îî 
$str
îî /
,
îî/ 0
table
ïï 
:
ïï 
$str
ïï &
,
ïï& '
column
ññ 
:
ññ 
$str
ññ  
)
ññ  !
;
ññ! "
migrationBuilder
òò 
.
òò 
CreateIndex
òò (
(
òò( )
name
ôô 
:
ôô 
$str
ôô 2
,
ôô2 3
table
öö 
:
öö 
$str
öö !
,
öö! "
column
õõ 
:
õõ 
$str
õõ (
)
õõ( )
;
õõ) *
migrationBuilder
ùù 
.
ùù 
CreateIndex
ùù (
(
ùù( )
name
ûû 
:
ûû 
$str
ûû :
,
ûû: ;
table
üü 
:
üü 
$str
üü (
,
üü( )
columns
†† 
:
†† 
new
†† 
[
†† 
]
†† 
{
††  
$str
††! +
,
††+ ,
$str
††- 5
}
††6 7
)
††7 8
;
††8 9
migrationBuilder
¢¢ 
.
¢¢ 
CreateIndex
¢¢ (
(
¢¢( )
name
££ 
:
££ 
$str
££ C
,
££C D
table
§§ 
:
§§ 
$str
§§ (
,
§§( )
columns
•• 
:
•• 
new
•• 
[
•• 
]
•• 
{
••  
$str
••! +
,
••+ ,
$str
••- >
}
••? @
)
••@ A
;
••A B
migrationBuilder
ßß 
.
ßß 
CreateIndex
ßß (
(
ßß( )
name
®® 
:
®® 
$str
®® <
,
®®< =
table
©© 
:
©© 
$str
©© (
,
©©( )
columns
™™ 
:
™™ 
new
™™ 
[
™™ 
]
™™ 
{
™™  
$str
™™! +
,
™™+ ,
$str
™™- 7
}
™™8 9
)
™™9 :
;
™™: ;
migrationBuilder
¨¨ 
.
¨¨ 
CreateIndex
¨¨ (
(
¨¨( )
name
≠≠ 
:
≠≠ 
$str
≠≠ :
,
≠≠: ;
table
ÆÆ 
:
ÆÆ 
$str
ÆÆ (
,
ÆÆ( )
columns
ØØ 
:
ØØ 
new
ØØ 
[
ØØ 
]
ØØ 
{
ØØ  
$str
ØØ! +
,
ØØ+ ,
$str
ØØ- 5
}
ØØ6 7
)
ØØ7 8
;
ØØ8 9
migrationBuilder
±± 
.
±± 
CreateIndex
±± (
(
±±( )
name
≤≤ 
:
≤≤ 
$str
≤≤ -
,
≤≤- .
table
≥≥ 
:
≥≥ 
$str
≥≥ $
,
≥≥$ %
column
¥¥ 
:
¥¥ 
$str
¥¥  
)
¥¥  !
;
¥¥! "
migrationBuilder
∂∂ 
.
∂∂ 
CreateIndex
∂∂ (
(
∂∂( )
name
∑∑ 
:
∑∑ 
$str
∑∑ 0
,
∑∑0 1
table
∏∏ 
:
∏∏ 
$str
∏∏ $
,
∏∏$ %
column
ππ 
:
ππ 
$str
ππ #
)
ππ# $
;
ππ$ %
migrationBuilder
ªª 
.
ªª 
CreateIndex
ªª (
(
ªª( )
name
ºº 
:
ºº 
$str
ºº 6
,
ºº6 7
table
ΩΩ 
:
ΩΩ 
$str
ΩΩ $
,
ΩΩ$ %
columns
ææ 
:
ææ 
new
ææ 
[
ææ 
]
ææ 
{
ææ  
$str
ææ! +
,
ææ+ ,
$str
ææ- 5
}
ææ6 7
)
ææ7 8
;
ææ8 9
migrationBuilder
¿¿ 
.
¿¿ 
CreateIndex
¿¿ (
(
¿¿( )
name
¡¡ 
:
¡¡ 
$str
¡¡ 5
,
¡¡5 6
table
¬¬ 
:
¬¬ 
$str
¬¬ .
,
¬¬. /
column
√√ 
:
√√ 
$str
√√ 
,
√√ 
unique
ƒƒ 
:
ƒƒ 
true
ƒƒ 
)
ƒƒ 
;
ƒƒ 
migrationBuilder
∆∆ 
.
∆∆ 
CreateIndex
∆∆ (
(
∆∆( )
name
«« 
:
«« 
$str
«« D
,
««D E
table
»» 
:
»» 
$str
»» $
,
»»$ %
columns
…… 
:
…… 
new
…… 
[
…… 
]
…… 
{
……  
$str
……! '
,
……' (
$str
……) 7
,
……7 8
$str
……9 F
}
……G H
,
……H I
unique
   
:
   
true
   
,
   
filter
ÀÀ 
:
ÀÀ 
$str
ÀÀ R
)
ÀÀR S
;
ÀÀS T
migrationBuilder
ÕÕ 
.
ÕÕ 
CreateIndex
ÕÕ (
(
ÕÕ( )
name
ŒŒ 
:
ŒŒ 
$str
ŒŒ *
,
ŒŒ* +
table
œœ 
:
œœ 
$str
œœ #
,
œœ# $
column
–– 
:
–– 
$str
–– 
)
–– 
;
––  
migrationBuilder
““ 
.
““ 
CreateIndex
““ (
(
““( )
name
”” 
:
”” 
$str
”” 4
,
””4 5
table
‘‘ 
:
‘‘ 
$str
‘‘ #
,
‘‘# $
column
’’ 
:
’’ 
$str
’’ (
)
’’( )
;
’’) *
migrationBuilder
◊◊ 
.
◊◊ 
CreateIndex
◊◊ (
(
◊◊( )
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ /
,
ÿÿ/ 0
table
ŸŸ 
:
ŸŸ 
$str
ŸŸ &
,
ŸŸ& '
column
⁄⁄ 
:
⁄⁄ 
$str
⁄⁄  
)
⁄⁄  !
;
⁄⁄! "
migrationBuilder
‹‹ 
.
‹‹ 
CreateIndex
‹‹ (
(
‹‹( )
name
›› 
:
›› 
$str
›› B
,
››B C
table
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ &
,
ﬁﬁ& '
columns
ﬂﬂ 
:
ﬂﬂ 
new
ﬂﬂ 
[
ﬂﬂ 
]
ﬂﬂ 
{
ﬂﬂ  
$str
ﬂﬂ! 0
,
ﬂﬂ0 1
$str
ﬂﬂ2 ?
}
ﬂﬂ@ A
)
ﬂﬂA B
;
ﬂﬂB C
migrationBuilder
·· 
.
·· 
CreateIndex
·· (
(
··( )
name
‚‚ 
:
‚‚ 
$str
‚‚ M
,
‚‚M N
table
„„ 
:
„„ 
$str
„„ 1
,
„„1 2
columns
‰‰ 
:
‰‰ 
new
‰‰ 
[
‰‰ 
]
‰‰ 
{
‰‰  
$str
‰‰! )
,
‰‰) *
$str
‰‰+ ?
}
‰‰@ A
)
‰‰A B
;
‰‰B C
migrationBuilder
ÊÊ 
.
ÊÊ 
CreateIndex
ÊÊ (
(
ÊÊ( )
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ 5
,
ÁÁ5 6
table
ËË 
:
ËË 
$str
ËË %
,
ËË% &
columns
ÈÈ 
:
ÈÈ 
new
ÈÈ 
[
ÈÈ 
]
ÈÈ 
{
ÈÈ  
$str
ÈÈ! )
,
ÈÈ) *
$str
ÈÈ+ 3
}
ÈÈ4 5
)
ÈÈ5 6
;
ÈÈ6 7
migrationBuilder
ÎÎ 
.
ÎÎ 
CreateIndex
ÎÎ (
(
ÎÎ( )
name
ÏÏ 
:
ÏÏ 
$str
ÏÏ )
,
ÏÏ) *
table
ÌÌ 
:
ÌÌ 
$str
ÌÌ !
,
ÌÌ! "
column
ÓÓ 
:
ÓÓ 
$str
ÓÓ 
)
ÓÓ  
;
ÓÓ  !
migrationBuilder
 
.
 
CreateIndex
 (
(
( )
name
ÒÒ 
:
ÒÒ 
$str
ÒÒ 3
,
ÒÒ3 4
table
ÚÚ 
:
ÚÚ 
$str
ÚÚ !
,
ÚÚ! "
column
ÛÛ 
:
ÛÛ 
$str
ÛÛ )
)
ÛÛ) *
;
ÛÛ* +
migrationBuilder
ıı 
.
ıı 
CreateIndex
ıı (
(
ıı( )
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ 6
,
ˆˆ6 7
table
˜˜ 
:
˜˜ 
$str
˜˜ !
,
˜˜! "
column
¯¯ 
:
¯¯ 
$str
¯¯ ,
)
¯¯, -
;
¯¯- .
migrationBuilder
˙˙ 
.
˙˙ 
CreateIndex
˙˙ (
(
˙˙( )
name
˚˚ 
:
˚˚ 
$str
˚˚ ,
,
˚˚, -
table
¸¸ 
:
¸¸ 
$str
¸¸ !
,
¸¸! "
column
˝˝ 
:
˝˝ 
$str
˝˝ "
)
˝˝" #
;
˝˝# $
migrationBuilder
ˇˇ 
.
ˇˇ 
CreateIndex
ˇˇ (
(
ˇˇ( )
name
ÄÄ 
:
ÄÄ 
$str
ÄÄ :
,
ÄÄ: ;
table
ÅÅ 
:
ÅÅ 
$str
ÅÅ /
,
ÅÅ/ 0
column
ÇÇ 
:
ÇÇ 
$str
ÇÇ "
)
ÇÇ" #
;
ÇÇ# $
migrationBuilder
ÑÑ 
.
ÑÑ 
CreateIndex
ÑÑ (
(
ÑÑ( )
name
ÖÖ 
:
ÖÖ 
$str
ÖÖ U
,
ÖÖU V
table
ÜÜ 
:
ÜÜ 
$str
ÜÜ 1
,
ÜÜ1 2
columns
áá 
:
áá 
new
áá 
[
áá 
]
áá 
{
áá  
$str
áá! 0
,
áá0 1
$str
áá2 :
,
áá: ;
$str
áá< E
,
ááE F
$str
ááG M
}
ááN O
)
ááO P
;
ááP Q
migrationBuilder
ââ 
.
ââ 
CreateIndex
ââ (
(
ââ( )
name
ää 
:
ää 
$str
ää 0
,
ää0 1
table
ãã 
:
ãã 
$str
ãã )
,
ãã) *
column
åå 
:
åå 
$str
åå 
)
åå 
;
åå  
migrationBuilder
éé 
.
éé 
CreateIndex
éé (
(
éé( )
name
èè 
:
èè 
$str
èè M
,
èèM N
table
êê 
:
êê 
$str
êê )
,
êê) *
columns
ëë 
:
ëë 
new
ëë 
[
ëë 
]
ëë 
{
ëë  
$str
ëë! 0
,
ëë0 1
$str
ëë2 :
,
ëë: ;
$str
ëë< E
,
ëëE F
$str
ëëG M
}
ëëN O
)
ëëO P
;
ëëP Q
migrationBuilder
ìì 
.
ìì 
CreateIndex
ìì (
(
ìì( )
name
îî 
:
îî 
$str
îî ;
,
îî; <
table
ïï 
:
ïï 
$str
ïï )
,
ïï) *
column
ññ 
:
ññ 
$str
ññ )
)
ññ) *
;
ññ* +
migrationBuilder
òò 
.
òò 
CreateIndex
òò (
(
òò( )
name
ôô 
:
ôô 
$str
ôô 7
,
ôô7 8
table
öö 
:
öö 
$str
öö )
,
öö) *
column
õõ 
:
õõ 
$str
õõ %
)
õõ% &
;
õõ& '
}
úú 	
	protected
üü 
override
üü 
void
üü 
Down
üü  $
(
üü$ %
MigrationBuilder
üü% 5
migrationBuilder
üü6 F
)
üüF G
{
†† 	
migrationBuilder
°° 
.
°° 
	DropTable
°° &
(
°°& '
name
¢¢ 
:
¢¢ 
$str
¢¢ *
)
¢¢* +
;
¢¢+ ,
migrationBuilder
§§ 
.
§§ 
	DropTable
§§ &
(
§§& '
name
•• 
:
•• 
$str
•• )
)
••) *
;
••* +
migrationBuilder
ßß 
.
ßß 
	DropTable
ßß &
(
ßß& '
name
®® 
:
®® 
$str
®® %
)
®®% &
;
®®& '
migrationBuilder
™™ 
.
™™ 
	DropTable
™™ &
(
™™& '
name
´´ 
:
´´ 
$str
´´ 0
)
´´0 1
;
´´1 2
migrationBuilder
≠≠ 
.
≠≠ 
	DropTable
≠≠ &
(
≠≠& '
name
ÆÆ 
:
ÆÆ 
$str
ÆÆ (
)
ÆÆ( )
;
ÆÆ) *
migrationBuilder
∞∞ 
.
∞∞ 
	DropTable
∞∞ &
(
∞∞& '
name
±± 
:
±± 
$str
±± #
)
±±# $
;
±±$ %
migrationBuilder
≥≥ 
.
≥≥ 
	DropTable
≥≥ &
(
≥≥& '
name
¥¥ 
:
¥¥ 
$str
¥¥ (
)
¥¥( )
;
¥¥) *
migrationBuilder
∂∂ 
.
∂∂ 
	DropTable
∂∂ &
(
∂∂& '
name
∑∑ 
:
∑∑ 
$str
∑∑ $
)
∑∑$ %
;
∑∑% &
migrationBuilder
ππ 
.
ππ 
	DropTable
ππ &
(
ππ& '
name
∫∫ 
:
∫∫ 
$str
∫∫ 0
)
∫∫0 1
;
∫∫1 2
migrationBuilder
ºº 
.
ºº 
	DropTable
ºº &
(
ºº& '
name
ΩΩ 
:
ΩΩ 
$str
ΩΩ +
)
ΩΩ+ ,
;
ΩΩ, -
migrationBuilder
øø 
.
øø 
	DropTable
øø &
(
øø& '
name
¿¿ 
:
¿¿ 
$str
¿¿ +
)
¿¿+ ,
;
¿¿, -
migrationBuilder
¬¬ 
.
¬¬ 
	DropTable
¬¬ &
(
¬¬& '
name
√√ 
:
√√ 
$str
√√ &
)
√√& '
;
√√' (
migrationBuilder
≈≈ 
.
≈≈ 
	DropTable
≈≈ &
(
≈≈& '
name
∆∆ 
:
∆∆ 
$str
∆∆ %
)
∆∆% &
;
∆∆& '
migrationBuilder
»» 
.
»» 
	DropTable
»» &
(
»»& '
name
…… 
:
…… 
$str
…… '
)
……' (
;
……( )
migrationBuilder
ÀÀ 
.
ÀÀ 
	DropTable
ÀÀ &
(
ÀÀ& '
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ #
)
ÃÃ# $
;
ÃÃ$ %
migrationBuilder
ŒŒ 
.
ŒŒ 
	DropTable
ŒŒ &
(
ŒŒ& '
name
œœ 
:
œœ 
$str
œœ -
)
œœ- .
;
œœ. /
migrationBuilder
—— 
.
—— 
	DropTable
—— &
(
——& '
name
““ 
:
““ 
$str
““ #
)
““# $
;
““$ %
migrationBuilder
‘‘ 
.
‘‘ 
	DropTable
‘‘ &
(
‘‘& '
name
’’ 
:
’’ 
$str
’’ 2
)
’’2 3
;
’’3 4
migrationBuilder
◊◊ 
.
◊◊ 
	DropTable
◊◊ &
(
◊◊& '
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ %
)
ÿÿ% &
;
ÿÿ& '
migrationBuilder
⁄⁄ 
.
⁄⁄ 
	DropTable
⁄⁄ &
(
⁄⁄& '
name
€€ 
:
€€ 
$str
€€ *
)
€€* +
;
€€+ ,
migrationBuilder
›› 
.
›› 
	DropTable
›› &
(
››& '
name
ﬁﬁ 
:
ﬁﬁ 
$str
ﬁﬁ %
)
ﬁﬁ% &
;
ﬁﬁ& '
migrationBuilder
‡‡ 
.
‡‡ 
	DropTable
‡‡ &
(
‡‡& '
name
·· 
:
·· 
$str
·· 0
)
··0 1
;
··1 2
migrationBuilder
„„ 
.
„„ 
	DropTable
„„ &
(
„„& '
name
‰‰ 
:
‰‰ 
$str
‰‰ $
)
‰‰$ %
;
‰‰% &
migrationBuilder
ÊÊ 
.
ÊÊ 
	DropTable
ÊÊ &
(
ÊÊ& '
name
ÁÁ 
:
ÁÁ 
$str
ÁÁ %
)
ÁÁ% &
;
ÁÁ& '
migrationBuilder
ÈÈ 
.
ÈÈ 
	DropTable
ÈÈ &
(
ÈÈ& '
name
ÍÍ 
:
ÍÍ 
$str
ÍÍ (
)
ÍÍ( )
;
ÍÍ) *
migrationBuilder
ÏÏ 
.
ÏÏ 
	DropTable
ÏÏ &
(
ÏÏ& '
name
ÌÌ 
:
ÌÌ 
$str
ÌÌ (
)
ÌÌ( )
;
ÌÌ) *
migrationBuilder
ÔÔ 
.
ÔÔ 
	DropTable
ÔÔ &
(
ÔÔ& '
name
 
:
 
$str
 (
)
( )
;
) *
migrationBuilder
ÚÚ 
.
ÚÚ 
	DropTable
ÚÚ &
(
ÚÚ& '
name
ÛÛ 
:
ÛÛ 
$str
ÛÛ "
)
ÛÛ" #
;
ÛÛ# $
migrationBuilder
ıı 
.
ıı 
	DropTable
ıı &
(
ıı& '
name
ˆˆ 
:
ˆˆ 
$str
ˆˆ ,
)
ˆˆ, -
;
ˆˆ- .
migrationBuilder
¯¯ 
.
¯¯ 
	DropTable
¯¯ &
(
¯¯& '
name
˘˘ 
:
˘˘ 
$str
˘˘  
)
˘˘  !
;
˘˘! "
migrationBuilder
˚˚ 
.
˚˚ 
	DropTable
˚˚ &
(
˚˚& '
name
¸¸ 
:
¸¸ 
$str
¸¸  
)
¸¸  !
;
¸¸! "
migrationBuilder
˛˛ 
.
˛˛ 
	DropTable
˛˛ &
(
˛˛& '
name
ˇˇ 
:
ˇˇ 
$str
ˇˇ 0
)
ˇˇ0 1
;
ˇˇ1 2
migrationBuilder
Å	Å	 
.
Å	Å	 
	DropTable
Å	Å	 &
(
Å	Å	& '
name
Ç	Ç	 
:
Ç	Ç	 
$str
Ç	Ç	 $
)
Ç	Ç	$ %
;
Ç	Ç	% &
migrationBuilder
Ñ	Ñ	 
.
Ñ	Ñ	 
	DropTable
Ñ	Ñ	 &
(
Ñ	Ñ	& '
name
Ö	Ö	 
:
Ö	Ö	 
$str
Ö	Ö	 .
)
Ö	Ö	. /
;
Ö	Ö	/ 0
}
Ü	Ü	 	
}
á	á	 
}à	à	 Û
W/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/Properties/AssemblyInfo.cs
[ 
assembly 	
:	 
'
InternalsVisibleToAttribute
 %
(% &
$str& M
)M N
]N O