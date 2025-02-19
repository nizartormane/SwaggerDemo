î
Z/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain.Shared/Localization/SwaggerDemoResource.cs
	namespace 	
SwaggerDemo
 
. 
Localization "
;" #
[ $
LocalizationResourceName 
( 
$str '
)' (
]( )
public 
class 
SwaggerDemoResource  
{ 
}		 ¥
Y/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain.Shared/MultiTenancy/MultiTenancyConsts.cs
	namespace 	
SwaggerDemo
 
. 
MultiTenancy "
;" #
public 
static 
class 
MultiTenancyConsts &
{ 
public		 

const		 
bool		 
	IsEnabled		 
=		  !
true		" &
;		& '
}

 ê
U/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain.Shared/SwaggerDemoDomainErrorCodes.cs
	namespace 	
SwaggerDemo
 
; 
public 
static 
class '
SwaggerDemoDomainErrorCodes /
{ 
} ›
W/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain.Shared/SwaggerDemoDomainSharedModule.cs
	namespace 	
SwaggerDemo
 
; 
[ 
	DependsOn 

(
 
typeof 

(
 -
!AbpAuditLoggingDomainSharedModule ,
), -
,- .
typeof 

(
 /
#AbpBackgroundJobsDomainSharedModule .
). /
,/ 0
typeof 

(
 2
&AbpFeatureManagementDomainSharedModule 1
)1 2
,2 3
typeof 

(
 )
AbpIdentityDomainSharedModule (
)( )
,) *
typeof 

(
 +
AbpOpenIddictDomainSharedModule *
)* +
,+ ,
typeof 

(
 5
)AbpPermissionManagementDomainSharedModule 4
)4 5
,5 6
typeof 

(
 2
&AbpSettingManagementDomainSharedModule 1
)1 2
,2 3
typeof 

(
 1
%AbpTenantManagementDomainSharedModule 0
)0 1
) 
] 
public 
class )
SwaggerDemoDomainSharedModule *
:+ ,
	AbpModule- 6
{ 
public 

override 
void  
PreConfigureServices -
(- .'
ServiceConfigurationContext. I
contextJ Q
)Q R
{ 0
$SwaggerDemoGlobalFeatureConfigurator   ,
.  , -
	Configure  - 6
(  6 7
)  7 8
;  8 92
&SwaggerDemoModuleExtensionConfigurator!! .
.!!. /
	Configure!!/ 8
(!!8 9
)!!9 :
;!!: ;
}"" 
public$$ 

override$$ 
void$$ 
ConfigureServices$$ *
($$* +'
ServiceConfigurationContext$$+ F
context$$G N
)$$N O
{%% 
	Configure&& 
<&& '
AbpVirtualFileSystemOptions&& -
>&&- .
(&&. /
options&&/ 6
=>&&7 9
{'' 	
options(( 
.(( 
FileSets(( 
.(( 
AddEmbedded(( (
<((( ))
SwaggerDemoDomainSharedModule(() F
>((F G
(((G H
)((H I
;((I J
})) 	
)))	 

;))
 
	Configure++ 
<++ "
AbpLocalizationOptions++ (
>++( )
(++) *
options++* 1
=>++2 4
{,, 	
options-- 
.-- 
	Resources-- 
... 
Add.. 
<.. 
SwaggerDemoResource.. (
>..( )
(..) *
$str..* .
)... /
.// 
AddBaseTypes// 
(// 
typeof// $
(//$ %!
AbpValidationResource//% :
)//: ;
)//; <
.00 
AddVirtualJson00 
(00  
$str00  ;
)00; <
;00< =
options22 
.22 
DefaultResourceType22 '
=22( )
typeof22* 0
(220 1
SwaggerDemoResource221 D
)22D E
;22E F
}33 	
)33	 

;33
 
	Configure55 
<55 +
AbpExceptionLocalizationOptions55 1
>551 2
(552 3
options553 :
=>55; =
{66 	
options77 
.77 
MapCodeNamespace77 $
(77$ %
$str77% 2
,772 3
typeof774 :
(77: ;
SwaggerDemoResource77; N
)77N O
)77O P
;77P Q
}88 	
)88	 

;88
 
}99 
}:: ¿
^/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain.Shared/SwaggerDemoGlobalFeatureConfigurator.cs
	namespace 	
SwaggerDemo
 
; 
public 
static 
class 0
$SwaggerDemoGlobalFeatureConfigurator 8
{ 
private 
static 
readonly 
OneTimeRunner )
OneTimeRunner* 7
=8 9
new: =
OneTimeRunner> K
(K L
)L M
;M N
public		 

static		 
void		 
	Configure		  
(		  !
)		! "
{

 
OneTimeRunner 
. 
Run 
( 
( 
) 
=> 
{ 	
} 	
)	 

;
 
} 
} ™

`/Users/nizar/SwaggerDemo/src/SwaggerDemo.Domain.Shared/SwaggerDemoModuleExtensionConfigurator.cs
	namespace 	
SwaggerDemo
 
; 
public 
static 
class 2
&SwaggerDemoModuleExtensionConfigurator :
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
{ 
OneTimeRunner 
. 
Run 
( 
( 
) 
=> 
{ 	'
ConfigureExistingProperties '
(' (
)( )
;) *$
ConfigureExtraProperties $
($ %
)% &
;& '
} 	
)	 

;
 
} 
private 
static 
void '
ConfigureExistingProperties 3
(3 4
)4 5
{ 
}$$ 
private&& 
static&& 
void&& $
ConfigureExtraProperties&& 0
(&&0 1
)&&1 2
{'' 
}HH 
}II 