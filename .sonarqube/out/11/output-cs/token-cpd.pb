ë
O/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application/Properties/AssemblyInfo.cs
[ 
assembly 	
:	 
'
InternalsVisibleToAttribute
 %
(% &
$str& E
)E F
]F G»
_/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application/SwaggerDemoApplicationAutoMapperProfile.cs
	namespace 	
SwaggerDemo
 
; 
public 
class 3
'SwaggerDemoApplicationAutoMapperProfile 4
:5 6
Profile7 >
{ 
public 
3
'SwaggerDemoApplicationAutoMapperProfile 2
(2 3
)3 4
{ 
} 
} ¯
T/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application/SwaggerDemoApplicationModule.cs
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
 #
SwaggerDemoDomainModule "
)" #
,# $
typeof 

(
 '
AbpAccountApplicationModule &
)& '
,' (
typeof 

(
 1
%SwaggerDemoApplicationContractsModule 0
)0 1
,1 2
typeof 

(
 (
AbpIdentityApplicationModule '
)' (
,( )
typeof 

(
 4
(AbpPermissionManagementApplicationModule 3
)3 4
,4 5
typeof 

(
 0
$AbpTenantManagementApplicationModule /
)/ 0
,0 1
typeof 

(
 1
%AbpFeatureManagementApplicationModule 0
)0 1
,1 2
typeof 

(
 1
%AbpSettingManagementApplicationModule 0
)0 1
) 
] 
public 
class (
SwaggerDemoApplicationModule )
:* +
	AbpModule, 5
{ 
public 

override 
void 
ConfigureServices *
(* +'
ServiceConfigurationContext+ F
contextG N
)N O
{ 
	Configure 
<  
AbpAutoMapperOptions &
>& '
(' (
options( /
=>0 2
{ 	
options 
. 
AddMaps 
< (
SwaggerDemoApplicationModule 8
>8 9
(9 :
): ;
;; <
} 	
)	 

;
 
} 
} ¼
M/Users/nizar/SwaggerDemo/src/SwaggerDemo.Application/SwaggerDemoAppService.cs
	namespace 	
SwaggerDemo
 
; 
public 
abstract 
class !
SwaggerDemoAppService +
:, -
ApplicationService. @
{ 
	protected !
SwaggerDemoAppService #
(# $
)$ %
{  
LocalizationResource 
= 
typeof %
(% &
SwaggerDemoResource& 9
)9 :
;: ;
} 
} 