�

�/Users/nizar/SwaggerDemo/src/SwaggerDemo.EntityFrameworkCore/EntityFrameworkCore/EntityFrameworkCoreSwaggerDemoDbSchemaMigrator.cs
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
}"" �%
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
}VV �
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
}!! �	
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
},, �
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
}66 ��
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
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 F
,
��F G
	maxLength
��H Q
:
��Q R
$num
��S V
,
��V W
nullable
��X `
:
��` a
false
��b g
)
��g h
,
��h i
ProviderName
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y [
,
��[ \
nullable
��] e
:
��e f
true
��g k
)
��k l
,
��l m
ProviderKey
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= K
,
��K L
	maxLength
��M V
:
��V W
$num
��X Z
,
��Z [
nullable
��\ d
:
��d e
true
��f j
)
��j k
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
SourceUserId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< N
,
��N O
nullable
��P X
:
��X Y
false
��Z _
)
��_ `
,
��` a
SourceTenantId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
TargetUserId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< N
,
��N O
nullable
��P X
:
��X Y
false
��Z _
)
��_ `
,
��` a
TargetTenantId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 6
,
��6 7
x
��8 9
=>
��: <
x
��= >
.
��> ?
Id
��? A
)
��A B
;
��B C
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
ParentId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
Code
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 D
,
��D E
	maxLength
��F O
:
��O P
$num
��Q S
,
��S T
nullable
��U ]
:
��] ^
false
��_ d
)
��d e
,
��e f
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o
EntityVersion
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< A
,
��A B
nullable
��C K
:
��K L
false
��M R
)
��R S
,
��S T
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
LastModifierId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValue
��Q ]
:
��] ^
false
��_ d
)
��d e
,
��e f
	DeleterId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% >
,
��> ?
x
��@ A
=>
��B D
x
��E F
.
��F G
Id
��G I
)
��I J
;
��J K
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� U
,
��U V
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ParentId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( >
,
��> ?
principalColumn
�� '
:
��' (
$str
��) -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� +
,
��+ ,
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h
ProviderName
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y [
,
��[ \
nullable
��] e
:
��e f
false
��g l
)
��l m
,
��m n
ProviderKey
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= K
,
��K L
	maxLength
��M V
:
��V W
$num
��X Z
,
��Z [
nullable
��\ d
:
��d e
false
��f k
)
��k l
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% =
,
��= >
x
��? @
=>
��A C
x
��D E
.
��E F
Id
��F H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� +
,
��+ ,
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% =
,
��= >
x
��? @
=>
��A C
x
��D E
.
��E F
Id
��F H
)
��H I
;
��I J
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
	GroupName
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Z
,
��Z [
nullable
��\ d
:
��d e
false
��f k
)
��k l
,
��l m
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h

ParentName
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< K
,
��K L
	maxLength
��M V
:
��V W
$num
��X [
,
��[ \
nullable
��] e
:
��e f
true
��g k
)
��k l
,
��l m
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o
	IsEnabled
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
MultiTenancySide
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
byte
��4 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ I
,
��I J
nullable
��K S
:
��S T
false
��U Z
)
��Z [
,
��[ \
	Providers
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Z
,
��Z [
nullable
��\ d
:
��d e
true
��f j
)
��j k
,
��k l
StateCheckers
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? N
,
��N O
	maxLength
��P Y
:
��Y Z
$num
��[ ^
,
��^ _
nullable
��` h
:
��h i
true
��j n
)
��n o
,
��o p
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 8
,
��8 9
x
��: ;
=>
��< >
x
��? @
.
��@ A
Id
��A C
)
��C D
;
��D E
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
��  
,
��  !
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h
NormalizedName
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ O
,
��O P
	maxLength
��Q Z
:
��Z [
$num
��\ _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
	IsDefault
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
)
��O P
,
��P Q
IsStatic
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
bool
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
IsPublic
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
bool
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
EntityVersion
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< A
,
��A B
nullable
��C K
:
��K L
false
��M R
)
��R S
,
��S T
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 2
,
��2 3
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� '
,
��' (
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
ApplicationName
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A O
,
��O P
	maxLength
��Q Z
:
��Z [
$num
��\ ^
,
��^ _
nullable
��` h
:
��h i
true
��j n
)
��n o
,
��o p
Identity
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: H
,
��H I
	maxLength
��J S
:
��S T
$num
��U W
,
��W X
nullable
��Y a
:
��a b
true
��c g
)
��g h
,
��h i
Action
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 F
,
��F G
	maxLength
��H Q
:
��Q R
$num
��S U
,
��U V
nullable
��W _
:
��_ `
true
��a e
)
��e f
,
��f g
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z
UserName
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: I
,
��I J
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k

TenantName
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: H
,
��H I
	maxLength
��J S
:
��S T
$num
��U W
,
��W X
nullable
��Y a
:
��a b
true
��c g
)
��g h
,
��h i
CorrelationId
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? M
,
��M N
	maxLength
��O X
:
��X Y
$num
��Z \
,
��\ ]
nullable
��^ f
:
��f g
true
��h l
)
��l m
,
��m n
ClientIpAddress
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A O
,
��O P
	maxLength
��Q Z
:
��Z [
$num
��\ ^
,
��^ _
nullable
��` h
:
��h i
true
��j n
)
��n o
,
��o p
BrowserInfo
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
true
��h l
)
��l m
,
��m n
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 9
,
��9 :
x
��; <
=>
��= ?
x
��@ A
.
��A B
Id
��B D
)
��D E
;
��E F
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� #
,
��# $
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
	SessionId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Z
,
��Z [
nullable
��\ d
:
��d e
false
��f k
)
��k l
,
��l m
Device
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 F
,
��F G
	maxLength
��H Q
:
��Q R
$num
��S U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h

DeviceInfo
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: H
,
��H I
	maxLength
��J S
:
��S T
$num
��U W
,
��W X
nullable
��Y a
:
��a b
true
��c g
)
��g h
,
��h i
IpAddresses
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
true
��h l
)
��l m
,
��m n
SignedIn
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
DateTime
��, 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< G
,
��G H
nullable
��I Q
:
��Q R
false
��S X
)
��X Y
,
��Y Z
LastAccessed
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 5
,
��5 6
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Id
��> @
)
��@ A
;
��A B
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o
Description
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
true
��h l
)
��l m
,
��m n
DefaultValue
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> N
,
��N O
	maxLength
��P Y
:
��Y Z
$num
��[ _
,
��_ `
nullable
��a i
:
��i j
true
��k o
)
��o p
,
��p q 
IsVisibleToClients
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
bool
��6 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B G
,
��G H
nullable
��I Q
:
��Q R
false
��S X
)
��X Y
,
��Y Z
	Providers
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; K
,
��K L
	maxLength
��M V
:
��V W
$num
��X \
,
��\ ]
nullable
��^ f
:
��f g
true
��h l
)
��l m
,
��m n
IsInherited
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
bool
��/ 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
IsEncrypted
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
bool
��/ 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; @
,
��@ A
nullable
��B J
:
��J K
false
��L Q
)
��Q R
,
��R S
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% ?
,
��? @
x
��A B
=>
��C E
x
��F G
.
��G H
Id
��H J
)
��J K
;
��K L
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� #
,
��# $
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 G
,
��G H
	maxLength
��I R
:
��R S
$num
��T X
,
��X Y
nullable
��Z b
:
��b c
false
��d i
)
��i j
,
��j k
ProviderName
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y [
,
��[ \
nullable
��] e
:
��e f
true
��g k
)
��k l
,
��l m
ProviderKey
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= K
,
��K L
	maxLength
��M V
:
��V W
$num
��X Z
,
��Z [
nullable
��\ d
:
��d e
true
��f j
)
��j k
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 5
,
��5 6
x
��7 8
=>
��9 ;
x
��< =
.
��= >
Id
��> @
)
��@ A
;
��A B
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� "
,
��" #
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 D
,
��D E
	maxLength
��F O
:
��O P
$num
��Q S
,
��S T
nullable
��U ]
:
��] ^
false
��_ d
)
��d e
,
��e f
NormalizedName
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
string
��2 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ N
,
��N O
	maxLength
��P Y
:
��Y Z
$num
��[ ]
,
��] ^
nullable
��_ g
:
��g h
false
��i n
)
��n o
,
��o p
EntityVersion
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< A
,
��A B
nullable
��C K
:
��K L
false
��M R
)
��R S
,
��S T
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
LastModifierId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValue
��Q ]
:
��] ^
false
��_ d
)
��d e
,
��e f
	DeleterId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 4
,
��4 5
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
)
��? @
;
��@ A
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� *
,
��* +
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
SourceUserId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< N
,
��N O
nullable
��P X
:
��X Y
false
��Z _
)
��_ `
,
��` a
TargetUserId
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
Guid
��0 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< N
,
��N O
nullable
��P X
:
��X Y
false
��Z _
)
��_ `
,
��` a
	StartTime
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
DateTime
��- 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
EndTime
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
DateTime
��+ 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; F
,
��F G
nullable
��H P
:
��P Q
false
��R W
)
��W X
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% <
,
��< =
x
��> ?
=>
��@ B
x
��C D
.
��D E
Id
��E G
)
��G H
;
��H I
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
��  
,
��  !
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
UserName
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: I
,
��I J
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
false
��e j
)
��j k
,
��k l 
NormalizedUserName
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
string
��6 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D S
,
��S T
	maxLength
��U ^
:
��^ _
$num
��` c
,
��c d
nullable
��e m
:
��m n
false
��o t
)
��t u
,
��u v
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 D
,
��D E
	maxLength
��F O
:
��O P
$num
��Q S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
Surname
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 G
,
��G H
	maxLength
��I R
:
��R S
$num
��T V
,
��V W
nullable
��X `
:
��` a
true
��b f
)
��f g
,
��g h
Email
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 F
,
��F G
	maxLength
��H Q
:
��Q R
$num
��S V
,
��V W
nullable
��X `
:
��` a
false
��b g
)
��g h
,
��h i
NormalizedEmail
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] `
,
��` a
nullable
��b j
:
��j k
false
��l q
)
��q r
,
��r s
EmailConfirmed
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
bool
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> C
,
��C D
nullable
��E M
:
��M N
false
��O T
,
��T U
defaultValue
��V b
:
��b c
false
��d i
)
��i j
,
��j k
PasswordHash
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
	maxLength
��O X
:
��X Y
$num
��Z ]
,
��] ^
nullable
��_ g
:
��g h
true
��i m
)
��m n
,
��n o
SecurityStamp
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? N
,
��N O
	maxLength
��P Y
:
��Y Z
$num
��[ ^
,
��^ _
nullable
��` h
:
��h i
false
��j o
)
��o p
,
��p q

IsExternal
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
bool
��. 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: ?
,
��? @
nullable
��A I
:
��I J
false
��K P
,
��P Q
defaultValue
��R ^
:
��^ _
false
��` e
)
��e f
,
��f g
PhoneNumber
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= K
,
��K L
	maxLength
��M V
:
��V W
$num
��X Z
,
��Z [
nullable
��\ d
:
��d e
true
��f j
)
��j k
,
��k l"
PhoneNumberConfirmed
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
bool
��8 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D I
,
��I J
nullable
��K S
:
��S T
false
��U Z
,
��Z [
defaultValue
��\ h
:
��h i
false
��j o
)
��o p
,
��p q
IsActive
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
bool
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 =
,
��= >
nullable
��? G
:
��G H
false
��I N
)
��N O
,
��O P
TwoFactorEnabled
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
bool
��4 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ E
,
��E F
nullable
��G O
:
��O P
false
��Q V
,
��V W
defaultValue
��X d
:
��d e
false
��f k
)
��k l
,
��l m

LockoutEnd
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
DateTimeOffset
��. <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D T
,
��T U
nullable
��V ^
:
��^ _
true
��` d
)
��d e
,
��e f
LockoutEnabled
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
bool
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> C
,
��C D
nullable
��E M
:
��M N
false
��O T
,
��T U
defaultValue
��V b
:
��b c
false
��d i
)
��i j
,
��j k
AccessFailedCount
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ E
,
��E F
nullable
��G O
:
��O P
false
��Q V
,
��V W
defaultValue
��X d
:
��d e
$num
��f g
)
��g h
,
��h i-
ShouldChangePasswordOnNextLogin
�� 3
=
��4 5
table
��6 ;
.
��; <
Column
��< B
<
��B C
bool
��C G
>
��G H
(
��H I
type
��I M
:
��M N
$str
��O T
,
��T U
nullable
��V ^
:
��^ _
false
��` e
)
��e f
,
��f g
EntityVersion
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< A
,
��A B
nullable
��C K
:
��K L
false
��M R
)
��R S
,
��S T$
LastPasswordChangeTime
�� *
=
��+ ,
table
��- 2
.
��2 3
Column
��3 9
<
��9 :
DateTimeOffset
��: H
>
��H I
(
��I J
type
��J N
:
��N O
$str
��P `
,
��` a
nullable
��b j
:
��j k
true
��l p
)
��p q
,
��q r
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
LastModifierId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValue
��Q ]
:
��] ^
false
��_ d
)
��d e
,
��e f
	DeleterId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 2
,
��2 3
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� .
,
��. /
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
ApplicationType
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A O
,
��O P
	maxLength
��Q Z
:
��Z [
$num
��\ ^
,
��^ _
nullable
��` h
:
��h i
true
��j n
)
��n o
,
��o p
ClientId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: I
,
��I J
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
ClientSecret
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _

ClientType
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
ConsentType
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= K
,
��K L
	maxLength
��M V
:
��V W
$num
��X Z
,
��Z [
nullable
��\ d
:
��d e
true
��f j
)
��j k
,
��k l
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
nullable
��N V
:
��V W
true
��X \
)
��\ ]
,
��] ^
DisplayNames
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
JsonWebKeySet
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? N
,
��N O
nullable
��P X
:
��X Y
true
��Z ^
)
��^ _
,
��_ `
Permissions
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
nullable
��N V
:
��V W
true
��X \
)
��\ ]
,
��] ^$
PostLogoutRedirectUris
�� *
=
��+ ,
table
��- 2
.
��2 3
Column
��3 9
<
��9 :
string
��: @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H W
,
��W X
nullable
��Y a
:
��a b
true
��c g
)
��g h
,
��h i

Properties
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
RedirectUris
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
Requirements
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
Settings
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: I
,
��I J
nullable
��K S
:
��S T
true
��U Y
)
��Y Z
,
��Z [
	ClientUri
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
LogoUri
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
LastModifierId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValue
��Q ]
:
��] ^
false
��_ d
)
��d e
,
��e f
	DeleterId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% @
,
��@ A
x
��B C
=>
��D F
x
��G H
.
��H I
Id
��I K
)
��K L
;
��L M
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
Description
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
nullable
��N V
:
��V W
true
��X \
)
��\ ]
,
��] ^
Descriptions
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
DisplayName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
nullable
��N V
:
��V W
true
��X \
)
��\ ]
,
��] ^
DisplayNames
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
true
��a e
)
��e f
,
��f g

Properties
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
	Resources
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
LastModifierId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValue
��Q ]
:
��] ^
false
��_ d
)
��d e
,
��e f
	DeleterId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� *
,
��* +
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \

AuditLogId
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
Guid
��. 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: L
,
��L M
nullable
��N V
:
��V W
false
��X ]
)
��] ^
,
��^ _
ServiceName
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
true
��h l
)
��l m
,
��m n

MethodName
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< K
,
��K L
	maxLength
��M V
:
��V W
$num
��X [
,
��[ \
nullable
��] e
:
��e f
true
��g k
)
��k l
,
��l m

Parameters
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y ]
,
��] ^
nullable
��_ g
:
��g h
true
��i m
)
��m n
,
��n o
ExecutionTime
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
DateTime
��1 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A L
,
��L M
nullable
��N V
:
��V W
false
��X ]
)
��] ^
,
��^ _
ExecutionDuration
�� %
=
��& '
table
��( -
.
��- .
Column
��. 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ E
,
��E F
nullable
��G O
:
��O P
false
��Q V
)
��V W
,
��W X
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% <
,
��< =
x
��> ?
=>
��@ B
x
��C D
.
��D E
Id
��E G
)
��G H
;
��H I
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� M
,
��M N
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

AuditLogId
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 6
,
��6 7
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W

AuditLogId
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
Guid
��. 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: L
,
��L M
nullable
��N V
:
��V W
false
��X ]
)
��] ^
,
��^ _
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \

ChangeTime
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
DateTime
��. 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> I
,
��I J
nullable
��K S
:
��S T
false
��U Z
)
��Z [
,
��[ \

ChangeType
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
byte
��. 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: C
,
��C D
nullable
��E M
:
��M N
false
��O T
)
��T U
,
��U V
EntityTenantId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
EntityId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: I
,
��I J
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k 
EntityTypeFullName
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
string
��6 <
>
��< =
(
��= >
type
��> B
:
��B C
$str
��D S
,
��S T
	maxLength
��U ^
:
��^ _
$num
��` c
,
��c d
nullable
��e m
:
��m n
false
��o t
)
��t u
,
��u v
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� K
,
��K L
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '

AuditLogId
��' 1
,
��1 2
principalTable
�� &
:
��& '
$str
��( 6
,
��6 7
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [ 
OrganizationUnitId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
Guid
��6 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B T
,
��T U
nullable
��V ^
:
��^ _
false
��` e
)
��e f
,
��f g
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% B
,
��B C
x
��D E
=>
��F H
new
��I L
{
��M N
x
��O P
.
��P Q 
OrganizationUnitId
��Q c
,
��c d
x
��e f
.
��f g
RoleId
��g m
}
��n o
)
��o p
;
��p q
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� c
,
��c d
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& ' 
OrganizationUnitId
��' 9
,
��9 :
principalTable
�� &
:
��& '
$str
��( >
,
��> ?
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� K
,
��K L
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
RoleId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
	ClaimType
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Z
,
��Z [
nullable
��\ d
:
��d e
false
��f k
)
��k l
,
��l m

ClaimValue
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y ]
,
��] ^
nullable
��_ g
:
��g h
true
��i m
)
��m n
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
RoleId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 2
,
��2 3
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
false
��V [
)
��[ \
,
��\ ]
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 D
,
��D E
	maxLength
��F O
:
��O P
$num
��Q S
,
��S T
nullable
��U ]
:
��] ^
false
��_ d
)
��d e
,
��e f
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 G
,
��G H
	maxLength
��I R
:
��R S
$num
��T X
,
��X Y
nullable
��Z b
:
��b c
false
��d i
)
��i j
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% D
,
��D E
x
��F G
=>
��H J
new
��K N
{
��O P
x
��Q R
.
��R S
TenantId
��S [
,
��[ \
x
��] ^
.
��^ _
Name
��_ c
}
��d e
)
��e f
;
��f g
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� Q
,
��Q R
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
TenantId
��' /
,
��/ 0
principalTable
�� &
:
��& '
$str
��( 4
,
��4 5
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
	ClaimType
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
string
��- 3
>
��3 4
(
��4 5
type
��5 9
:
��9 :
$str
��; J
,
��J K
	maxLength
��L U
:
��U V
$num
��W Z
,
��Z [
nullable
��\ d
:
��d e
false
��f k
)
��k l
,
��l m

ClaimValue
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y ]
,
��] ^
nullable
��_ g
:
��g h
true
��i m
)
��m n
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
)
��B C
;
��C D
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
LoginProvider
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? M
,
��M N
	maxLength
��O X
:
��X Y
$num
��Z \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
ProviderKey
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o!
ProviderDisplayName
�� '
=
��( )
table
��* /
.
��/ 0
Column
��0 6
<
��6 7
string
��7 =
>
��= >
(
��> ?
type
��? C
:
��C D
$str
��E T
,
��T U
	maxLength
��V _
:
��_ `
$num
��a d
,
��d e
nullable
��f n
:
��n o
true
��p t
)
��t u
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
new
��> A
{
��B C
x
��D E
.
��E F
UserId
��F L
,
��L M
x
��N O
.
��O P
LoginProvider
��P ]
}
��^ _
)
��_ `
;
��` a
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [ 
OrganizationUnitId
�� &
=
��' (
table
��) .
.
��. /
Column
��/ 5
<
��5 6
Guid
��6 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B T
,
��T U
nullable
��V ^
:
��^ _
false
��` e
)
��e f
,
��f g
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% B
,
��B C
x
��D E
=>
��F H
new
��I L
{
��M N
x
��O P
.
��P Q 
OrganizationUnitId
��Q c
,
��c d
x
��e f
.
��f g
UserId
��g m
}
��n o
)
��o p
;
��p q
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� c
,
��c d
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& ' 
OrganizationUnitId
��' 9
,
��9 :
principalTable
�� &
:
��& '
$str
��( >
,
��> ?
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� K
,
��K L
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
RoleId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 6
,
��6 7
x
��8 9
=>
��: <
new
��= @
{
��A B
x
��C D
.
��D E
UserId
��E K
,
��K L
x
��M N
.
��N O
RoleId
��O U
}
��V W
)
��W X
;
��X Y
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� ?
,
��? @
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
RoleId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� ?
,
��? @
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
UserId
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
Guid
��* .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 H
,
��H I
nullable
��J R
:
��R S
false
��T Y
)
��Y Z
,
��Z [
LoginProvider
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? M
,
��M N
	maxLength
��O X
:
��X Y
$num
��Z \
,
��\ ]
nullable
��^ f
:
��f g
false
��h m
)
��m n
,
��n o
Name
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 E
,
��E F
	maxLength
��G P
:
��P Q
$num
��R U
,
��U V
nullable
��W _
:
��_ `
false
��a f
)
��f g
,
��g h
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
Value
�� 
=
�� 
table
�� !
.
��! "
Column
��" (
<
��( )
string
��) /
>
��/ 0
(
��0 1
type
��1 5
:
��5 6
$str
��7 F
,
��F G
nullable
��H P
:
��P Q
true
��R V
)
��V W
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% 7
,
��7 8
x
��9 :
=>
��; =
new
��> A
{
��B C
x
��D E
.
��E F
UserId
��F L
,
��L M
x
��N O
.
��O P
LoginProvider
��P ]
,
��] ^
x
��_ `
.
��` a
Name
��a e
}
��f g
)
��g h
;
��h i
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� @
,
��@ A
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
UserId
��' -
,
��- .
principalTable
�� &
:
��& '
$str
��( 2
,
��2 3
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
ApplicationId
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
Guid
��1 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= O
,
��O P
nullable
��Q Y
:
��Y Z
true
��[ _
)
��_ `
,
��` a
CreationDate
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]

Properties
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
Scopes
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 G
,
��G H
nullable
��I Q
:
��Q R
true
��S W
)
��W X
,
��X Y
Status
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 F
,
��F G
	maxLength
��H Q
:
��Q R
$num
��S U
,
��U V
nullable
��W _
:
��_ `
true
��a e
)
��e f
,
��f g
Subject
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 H
,
��H I
	maxLength
��J S
:
��S T
$num
��U X
,
��X Y
nullable
��Z b
:
��b c
true
��d h
)
��h i
,
��i j
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 D
,
��D E
	maxLength
��F O
:
��O P
$num
��Q S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
LastModifierId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValue
��Q ]
:
��] ^
false
��_ d
)
��d e
,
��e f
	DeleterId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% B
,
��B C
x
��D E
=>
��F H
x
��I J
.
��J K
Id
��K M
)
��M N
;
��N O
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� `
,
��` a
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ApplicationId
��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( @
,
��@ A
principalColumn
�� '
:
��' (
$str
��) -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
TenantId
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
Guid
��, 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 J
,
��J K
nullable
��L T
:
��T U
true
��V Z
)
��Z [
,
��[ \
EntityChangeId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
NewValue
�� 
=
�� 
table
�� $
.
��$ %
Column
��% +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
type
��4 8
:
��8 9
$str
��: I
,
��I J
	maxLength
��K T
:
��T U
$num
��V Y
,
��Y Z
nullable
��[ c
:
��c d
true
��e i
)
��i j
,
��j k
OriginalValue
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
string
��1 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? N
,
��N O
	maxLength
��P Y
:
��Y Z
$num
��[ ^
,
��^ _
nullable
��` h
:
��h i
true
��j n
)
��n o
,
��o p
PropertyName
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
string
��0 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> M
,
��M N
	maxLength
��O X
:
��X Y
$num
��Z ]
,
��] ^
nullable
��_ g
:
��g h
false
��i n
)
��n o
,
��o p"
PropertyTypeFullName
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
string
��8 >
>
��> ?
(
��? @
type
��@ D
:
��D E
$str
��F T
,
��T U
	maxLength
��V _
:
��_ `
$num
��a c
,
��c d
nullable
��e m
:
��m n
false
��o t
)
��t u
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% B
,
��B C
x
��D E
=>
��F H
x
��I J
.
��J K
Id
��K M
)
��M N
;
��N O
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� [
,
��[ \
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
EntityChangeId
��' 5
,
��5 6
principalTable
�� &
:
��& '
$str
��( :
,
��: ;
principalColumn
�� '
:
��' (
$str
��) -
,
��- .
onDelete
��  
:
��  !
ReferentialAction
��" 3
.
��3 4
Cascade
��4 ;
)
��; <
;
��< =
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateTable
�� (
(
��( )
name
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
table
�� 
=>
�� !
new
��" %
{
�� 
Id
�� 
=
�� 
table
�� 
.
�� 
Column
�� %
<
��% &
Guid
��& *
>
��* +
(
��+ ,
type
��, 0
:
��0 1
$str
��2 D
,
��D E
nullable
��F N
:
��N O
false
��P U
)
��U V
,
��V W
ApplicationId
�� !
=
��" #
table
��$ )
.
��) *
Column
��* 0
<
��0 1
Guid
��1 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= O
,
��O P
nullable
��Q Y
:
��Y Z
true
��[ _
)
��_ `
,
��` a
AuthorizationId
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
Guid
��3 7
>
��7 8
(
��8 9
type
��9 =
:
��= >
$str
��? Q
,
��Q R
nullable
��S [
:
��[ \
true
��] a
)
��a b
,
��b c
CreationDate
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
ExpirationDate
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
DateTime
��2 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
Payload
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 H
,
��H I
nullable
��J R
:
��R S
true
��T X
)
��X Y
,
��Y Z

Properties
�� 
=
��  
table
��! &
.
��& '
Column
��' -
<
��- .
string
��. 4
>
��4 5
(
��5 6
type
��6 :
:
��: ;
$str
��< K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
RedemptionDate
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
DateTime
��2 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B M
,
��M N
nullable
��O W
:
��W X
true
��Y ]
)
��] ^
,
��^ _
ReferenceId
�� 
=
��  !
table
��" '
.
��' (
Column
��( .
<
��. /
string
��/ 5
>
��5 6
(
��6 7
type
��7 ;
:
��; <
$str
��= L
,
��L M
	maxLength
��N W
:
��W X
$num
��Y \
,
��\ ]
nullable
��^ f
:
��f g
true
��h l
)
��l m
,
��m n
Status
�� 
=
�� 
table
�� "
.
��" #
Column
��# )
<
��) *
string
��* 0
>
��0 1
(
��1 2
type
��2 6
:
��6 7
$str
��8 F
,
��F G
	maxLength
��H Q
:
��Q R
$num
��S U
,
��U V
nullable
��W _
:
��_ `
true
��a e
)
��e f
,
��f g
Subject
�� 
=
�� 
table
�� #
.
��# $
Column
��$ *
<
��* +
string
��+ 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 H
,
��H I
	maxLength
��J S
:
��S T
$num
��U X
,
��X Y
nullable
��Z b
:
��b c
true
��d h
)
��h i
,
��i j
Type
�� 
=
�� 
table
��  
.
��  !
Column
��! '
<
��' (
string
��( .
>
��. /
(
��/ 0
type
��0 4
:
��4 5
$str
��6 D
,
��D E
	maxLength
��F O
:
��O P
$num
��Q S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
ExtraProperties
�� #
=
��$ %
table
��& +
.
��+ ,
Column
��, 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
type
��; ?
:
��? @
$str
��A P
,
��P Q
nullable
��R Z
:
��Z [
false
��\ a
)
��a b
,
��b c
ConcurrencyStamp
�� $
=
��% &
table
��' ,
.
��, -
Column
��- 3
<
��3 4
string
��4 :
>
��: ;
(
��; <
type
��< @
:
��@ A
$str
��B P
,
��P Q
	maxLength
��R [
:
��[ \
$num
��] _
,
��_ `
nullable
��a i
:
��i j
false
��k p
)
��p q
,
��q r
CreationTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
false
��W \
)
��\ ]
,
��] ^
	CreatorId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]"
LastModificationTime
�� (
=
��) *
table
��+ 0
.
��0 1
Column
��1 7
<
��7 8
DateTime
��8 @
>
��@ A
(
��A B
type
��B F
:
��F G
$str
��H S
,
��S T
nullable
��U ]
:
��] ^
true
��_ c
)
��c d
,
��d e
LastModifierId
�� "
=
��# $
table
��% *
.
��* +
Column
��+ 1
<
��1 2
Guid
��2 6
>
��6 7
(
��7 8
type
��8 <
:
��< =
$str
��> P
,
��P Q
nullable
��R Z
:
��Z [
true
��\ `
)
��` a
,
��a b
	IsDeleted
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
bool
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 >
,
��> ?
nullable
��@ H
:
��H I
false
��J O
,
��O P
defaultValue
��Q ]
:
��] ^
false
��_ d
)
��d e
,
��e f
	DeleterId
�� 
=
�� 
table
��  %
.
��% &
Column
��& ,
<
��, -
Guid
��- 1
>
��1 2
(
��2 3
type
��3 7
:
��7 8
$str
��9 K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
,
��\ ]
DeletionTime
��  
=
��! "
table
��# (
.
��( )
Column
��) /
<
��/ 0
DateTime
��0 8
>
��8 9
(
��9 :
type
��: >
:
��> ?
$str
��@ K
,
��K L
nullable
��M U
:
��U V
true
��W [
)
��[ \
}
�� 
,
�� 
constraints
�� 
:
�� 
table
�� "
=>
��# %
{
�� 
table
�� 
.
�� 

PrimaryKey
�� $
(
��$ %
$str
��% :
,
��: ;
x
��< =
=>
��> @
x
��A B
.
��B C
Id
��C E
)
��E F
;
��F G
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� X
,
��X Y
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
ApplicationId
��' 4
,
��4 5
principalTable
�� &
:
��& '
$str
��( @
,
��@ A
principalColumn
�� '
:
��' (
$str
��) -
)
��- .
;
��. /
table
�� 
.
�� 

ForeignKey
�� $
(
��$ %
name
�� 
:
�� 
$str
�� \
,
��\ ]
column
�� 
:
�� 
x
��  !
=>
��" $
x
��% &
.
��& '
AuthorizationId
��' 6
,
��6 7
principalTable
�� &
:
��& '
$str
��( B
,
��B C
principalColumn
�� '
:
��' (
$str
��) -
)
��- .
;
��. /
}
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 8
,
��8 9
table
�� 
:
�� 
$str
�� +
,
��+ ,
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� [
,
��[ \
table
�� 
:
�� 
$str
�� +
,
��+ ,
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- :
,
��: ;
$str
��< H
,
��H I
$str
��J Y
}
��Z [
)
��[ \
;
��\ ]
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� >
,
��> ?
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- <
}
��= >
)
��> ?
;
��? @
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� E
,
��E F
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
,
��5 6
$str
��7 F
}
��G H
)
��H I
;
��I J
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� D
,
��D E
table
�� 
:
�� 
$str
�� *
,
��* +
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! .
,
��. /
$str
��0 =
}
��> ?
)
��? @
;
��@ A
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� )
,
��) *
column
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� P
,
��P Q
table
�� 
:
�� 
$str
�� )
,
��) *
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- A
,
��A B
$str
��C M
}
��N O
)
��O P
;
��P Q
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� B
,
��B C
table
�� 
:
�� 
$str
�� 1
,
��1 2
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� )
,
��) *
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� $
,
��$ %
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� +
,
��+ ,
table
�� 
:
�� 
$str
�� $
,
��$ %
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� I
,
��I J
table
�� 
:
�� 
$str
�� )
,
��) *
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! '
,
��' (
$str
��) 7
,
��7 8
$str
��9 F
}
��G H
,
��H I
unique
�� 
:
�� 
true
�� 
,
�� 
filter
�� 
:
�� 
$str
�� R
)
��R S
;
��S T
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� _
,
��_ `
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! /
,
��/ 0
$str
��1 A
,
��A B
$str
��C Q
,
��Q R
$str
��S c
}
��d e
,
��e f
unique
�� 
:
�� 
true
�� 
,
�� 
filter
�� 
:
�� 
$str
�� W
)
��W X
;
��X Y
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� M
,
��M N
table
�� 
:
�� 
$str
�� 1
,
��1 2
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! )
,
��) *
$str
��+ ?
}
��@ A
)
��A B
;
��B C
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� -
,
��- .
column
�� 
:
�� 
$str
�� 
)
�� 
;
��  
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 8
,
��8 9
table
�� 
:
�� 
$str
�� -
,
��- .
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� U
,
��U V
table
�� 
:
�� 
$str
�� ,
,
��, -
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 3
,
��3 4
$str
��5 C
,
��C D
$str
��E R
}
��S T
,
��T U
unique
�� 
:
�� 
true
�� 
,
�� 
filter
�� 
:
�� 
$str
�� 0
)
��0 1
;
��1 2
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� ,
,
��, -
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� '
,
��' (
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� .
,
��. /
table
�� 
:
�� 
$str
�� '
,
��' (
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 2
,
��2 3
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� :
,
��: ;
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� C
,
��C D
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- >
}
��? @
)
��@ A
;
��A B
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� <
,
��< =
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 7
}
��8 9
)
��9 :
;
��: ;
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� :
,
��: ;
table
�� 
:
�� 
$str
�� (
,
��( )
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� -
,
��- .
table
�� 
:
�� 
$str
�� $
,
��$ %
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� $
,
��$ %
column
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! +
,
��+ ,
$str
��- 5
}
��6 7
)
��7 8
;
��8 9
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 5
,
��5 6
table
�� 
:
�� 
$str
�� .
,
��. /
column
�� 
:
�� 
$str
�� 
,
�� 
unique
�� 
:
�� 
true
�� 
)
�� 
;
�� 
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� D
,
��D E
table
�� 
:
�� 
$str
�� $
,
��$ %
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! '
,
��' (
$str
��) 7
,
��7 8
$str
��9 F
}
��G H
,
��H I
unique
�� 
:
�� 
true
�� 
,
�� 
filter
�� 
:
�� 
$str
�� R
)
��R S
;
��S T
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� *
,
��* +
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� 
)
�� 
;
��  
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 4
,
��4 5
table
�� 
:
�� 
$str
�� #
,
��# $
column
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� /
,
��/ 0
table
�� 
:
�� 
$str
�� &
,
��& '
column
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� B
,
��B C
table
�� 
:
�� 
$str
�� &
,
��& '
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! 0
,
��0 1
$str
��2 ?
}
��@ A
)
��A B
;
��B C
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� M
,
��M N
table
�� 
:
�� 
$str
�� 1
,
��1 2
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! )
,
��) *
$str
��+ ?
}
��@ A
)
��A B
;
��B C
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 5
,
��5 6
table
�� 
:
�� 
$str
�� %
,
��% &
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! )
,
��) *
$str
��+ 3
}
��4 5
)
��5 6
;
��6 7
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� )
,
��) *
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� 
)
��  
;
��  !
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 3
,
��3 4
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 6
,
��6 7
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ,
,
��, -
table
�� 
:
�� 
$str
�� !
,
��! "
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� :
,
��: ;
table
�� 
:
�� 
$str
�� /
,
��/ 0
column
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� U
,
��U V
table
�� 
:
�� 
$str
�� 1
,
��1 2
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! 0
,
��0 1
$str
��2 :
,
��: ;
$str
��< E
,
��E F
$str
��G M
}
��N O
)
��O P
;
��P Q
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 0
,
��0 1
table
�� 
:
�� 
$str
�� )
,
��) *
column
�� 
:
�� 
$str
�� 
)
�� 
;
��  
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� M
,
��M N
table
�� 
:
�� 
$str
�� )
,
��) *
columns
�� 
:
�� 
new
�� 
[
�� 
]
�� 
{
��  
$str
��! 0
,
��0 1
$str
��2 :
,
��: ;
$str
��< E
,
��E F
$str
��G M
}
��N O
)
��O P
;
��P Q
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� ;
,
��; <
table
�� 
:
�� 
$str
�� )
,
��) *
column
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
CreateIndex
�� (
(
��( )
name
�� 
:
�� 
$str
�� 7
,
��7 8
table
�� 
:
�� 
$str
�� )
,
��) *
column
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
}
�� 	
	protected
�� 
override
�� 
void
�� 
Down
��  $
(
��$ %
MigrationBuilder
��% 5
migrationBuilder
��6 F
)
��F G
{
�� 	
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� *
)
��* +
;
��+ ,
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� )
)
��) *
;
��* +
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 0
)
��0 1
;
��1 2
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 0
)
��0 1
;
��1 2
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� +
)
��+ ,
;
��, -
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� +
)
��+ ,
;
��, -
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� &
)
��& '
;
��' (
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� '
)
��' (
;
��( )
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� -
)
��- .
;
��. /
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� #
)
��# $
;
��$ %
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 2
)
��2 3
;
��3 4
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� *
)
��* +
;
��+ ,
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 0
)
��0 1
;
��1 2
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� $
)
��$ %
;
��% &
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� %
)
��% &
;
��& '
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� (
)
��( )
;
��) *
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� "
)
��" #
;
��# $
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� ,
)
��, -
;
��- .
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
��  
)
��  !
;
��! "
migrationBuilder
�� 
.
�� 
	DropTable
�� &
(
��& '
name
�� 
:
�� 
$str
�� 0
)
��0 1
;
��1 2
migrationBuilder
�	�	 
.
�	�	 
	DropTable
�	�	 &
(
�	�	& '
name
�	�	 
:
�	�	 
$str
�	�	 $
)
�	�	$ %
;
�	�	% &
migrationBuilder
�	�	 
.
�	�	 
	DropTable
�	�	 &
(
�	�	& '
name
�	�	 
:
�	�	 
$str
�	�	 .
)
�	�	. /
;
�	�	/ 0
}
�	�	 	
}
�	�	 
}�	�	 �
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