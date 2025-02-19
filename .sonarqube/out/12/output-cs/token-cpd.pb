ë
U/Users/nizar/SwaggerDemo/src/SwaggerDemo.HttpApi/Controllers/SwaggerDemoController.cs
	namespace 	
SwaggerDemo
 
. 
Controllers !
;! "
public 
abstract 
class !
SwaggerDemoController +
:, -
AbpControllerBase. ?
{		 
	protected

 !
SwaggerDemoController

 #
(

# $
)

$ %
{  
LocalizationResource 
= 
typeof %
(% &
SwaggerDemoResource& 9
)9 :
;: ;
} 
} Ù
I/Users/nizar/SwaggerDemo/src/SwaggerDemo.HttpApi/Models/Test/TestModel.cs
	namespace 	
SwaggerDemo
 
. 
Models 
. 
Test !
;! "
public 
class 
	TestModel 
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
public		 

DateTime		 
	BirthDate		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
}

 ª
L/Users/nizar/SwaggerDemo/src/SwaggerDemo.HttpApi/SwaggerDemoHttpApiModule.cs
	namespace 	
SwaggerDemo
 
; 
[ 
	DependsOn 

(
 
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
 #
AbpAccountHttpApiModule "
)" #
,# $
typeof 

(
 $
AbpIdentityHttpApiModule #
)# $
,$ %
typeof 

(
 0
$AbpPermissionManagementHttpApiModule /
)/ 0
,0 1
typeof 

(
 ,
 AbpTenantManagementHttpApiModule +
)+ ,
,, -
typeof 

(
 -
!AbpFeatureManagementHttpApiModule ,
), -
,- .
typeof 

(
 -
!AbpSettingManagementHttpApiModule ,
), -
) 
] 
public 
class $
SwaggerDemoHttpApiModule %
:& '
	AbpModule( 1
{ 
public 

override 
void 
ConfigureServices *
(* +'
ServiceConfigurationContext+ F
contextG N
)N O
{ !
ConfigureLocalization 
( 
) 
;  
} 
private 
void !
ConfigureLocalization &
(& '
)' (
{ 
	Configure   
<   "
AbpLocalizationOptions   (
>  ( )
(  ) *
options  * 1
=>  2 4
{!! 	
options"" 
."" 
	Resources"" 
.## 
Get## 
<## 
SwaggerDemoResource## (
>##( )
(##) *
)##* +
.$$ 
AddBaseTypes$$ 
($$ 
typeof%% 
(%% 
AbpUiResource%% (
)%%( )
)&& 
;&& 
}'' 	
)''	 

;''
 
}(( 
})) 