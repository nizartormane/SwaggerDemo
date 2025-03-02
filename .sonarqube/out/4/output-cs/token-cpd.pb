Ç	
u/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application.Contracts/Permissions/SwaggerDemoPermissionDefinitionProvider.cs
	namespace 	
SwaggerDemo
 
. 
Permissions !
;! "
public 
class 3
'SwaggerDemoPermissionDefinitionProvider 4
:5 6(
PermissionDefinitionProvider7 S
{ 
public		 

override		 
void		 
Define		 
(		  (
IPermissionDefinitionContext		  <
context		= D
)		D E
{

 
var 
myGroup 
= 
context 
. 
AddGroup &
(& '"
SwaggerDemoPermissions' =
.= >
	GroupName> G
)G H
;H I
} 
private 
static 
LocalizableString $
L% &
(& '
string' -
name. 2
)2 3
{ 
return 
LocalizableString  
.  !
Create! '
<' (
SwaggerDemoResource( ;
>; <
(< =
name= A
)A B
;B C
} 
} Ä
d/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application.Contracts/Permissions/SwaggerDemoPermissions.cs
	namespace 	
SwaggerDemo
 
. 
Permissions !
;! "
public 
static 
class "
SwaggerDemoPermissions *
{ 
public 

const 
string 
	GroupName !
=" #
$str$ 1
;1 2
}		 ÿ
g/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application.Contracts/SwaggerDemoApplicationContractsModule.cs
	namespace

 	
SwaggerDemo


 
;

 
[ 
	DependsOn 

(
 
typeof 

(
 )
SwaggerDemoDomainSharedModule (
)( )
,) *
typeof 

(
 0
$AbpAccountApplicationContractsModule /
)/ 0
,0 1
typeof 

(
 :
.AbpFeatureManagementApplicationContractsModule 9
)9 :
,: ;
typeof 

(
 1
%AbpIdentityApplicationContractsModule 0
)0 1
,1 2
typeof 

(
 =
1AbpPermissionManagementApplicationContractsModule <
)< =
,= >
typeof 

(
 :
.AbpSettingManagementApplicationContractsModule 9
)9 :
,: ;
typeof 

(
 9
-AbpTenantManagementApplicationContractsModule 8
)8 9
,9 :
typeof 

(
 $
AbpObjectExtendingModule #
)# $
) 
] 
public 
class 1
%SwaggerDemoApplicationContractsModule 2
:3 4
	AbpModule5 >
{ 
public 

override 
void  
PreConfigureServices -
(- .'
ServiceConfigurationContext. I
contextJ Q
)Q R
{ $
SwaggerDemoDtoExtensions  
.  !
	Configure! *
(* +
)+ ,
;, -
} 
} °
Z/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application.Contracts/SwaggerDemoDtoExtensions.cs
	namespace 	
SwaggerDemo
 
; 
public 
static 
class $
SwaggerDemoDtoExtensions ,
{ 
private		 
static		 
readonly		 
OneTimeRunner		 )
OneTimeRunner		* 7
=		8 9
new		: =
OneTimeRunner		> K
(		K L
)		L M
;		M N
public 

static 
void 
	Configure  
(  !
)! "
{ 
OneTimeRunner 
. 
Run 
( 
( 
) 
=> 
{ 	
} 	
)	 

;
 
} 
} 