æ
Y/Users/nizar/SwaggerDemo/src/SwaggerDemo.HttpApi.Client/SwaggerDemoHttpApiClientModule.cs
	namespace 	
SwaggerDemo
 
; 
[ 
	DependsOn 

(
 
typeof 

(
 1
%SwaggerDemoApplicationContractsModule 0
)0 1
,1 2
typeof 

(
 )
AbpAccountHttpApiClientModule (
)( )
,) *
typeof 

(
 *
AbpIdentityHttpApiClientModule )
)) *
,* +
typeof 

(
 6
*AbpPermissionManagementHttpApiClientModule 5
)5 6
,6 7
typeof 

(
 2
&AbpTenantManagementHttpApiClientModule 1
)1 2
,2 3
typeof 

(
 3
'AbpFeatureManagementHttpApiClientModule 2
)2 3
,3 4
typeof 

(
 3
'AbpSettingManagementHttpApiClientModule 2
)2 3
) 
] 
public 
class *
SwaggerDemoHttpApiClientModule +
:, -
	AbpModule. 7
{ 
public 

const 
string 
RemoteServiceName )
=* +
$str, 5
;5 6
public 

override 
void 
ConfigureServices *
(* +'
ServiceConfigurationContext+ F
contextG N
)N O
{ 
context 
. 
Services 
.  
AddHttpClientProxies -
(- .
typeof 
( 1
%SwaggerDemoApplicationContractsModule 8
)8 9
.9 :
Assembly: B
,B C
RemoteServiceName 
) 	
;	 

	Configure!! 
<!! '
AbpVirtualFileSystemOptions!! -
>!!- .
(!!. /
options!!/ 6
=>!!7 9
{"" 	
options## 
.## 
FileSets## 
.## 
AddEmbedded## (
<##( )*
SwaggerDemoHttpApiClientModule##) G
>##G H
(##H I
)##I J
;##J K
}$$ 	
)$$	 

;$$
 
}%% 
}&& 