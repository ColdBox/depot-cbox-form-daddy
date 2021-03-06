<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2005-2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Luis Majano & Henrik Joreteg
Date        :	06/18/2009
Description :
	An incredible validator for all the following:
	
Validations (Can be a list):
- boolean
- date
- email
- eurodate
- exactLen-X
- numeric or float
- guid
- integer
- maxLen-X
- minLen-X
- range-1..4
- regex-{regexhere}
- sameAs-{fieldname}
- ssn
- string
- telephone
- udf-{UDF Method}
- URL
- uuid
- USdate: a U.S. date of the format mm/dd/yy, with 1-2 digit days and months, 1-4 digit years. 
- zipcode 5 or 9 digit format zip codes

----------------------------------------------------------------------->
<cfcomponent name="Validator" 
			 extends="shared.frameworks.coldbox_2_60.coldbox.system.plugin" 
			 output="false" 
			 hint="Our incredible validator for EVERYTHING!"
			 cache="true"
			 cacheTimeout="10">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------>

	<cffunction name="init" access="public" output="false" returntype="any" hint="Constructor">
		<cfargument name="controller" type="any" required="true" hint="The coldbox daddy"/>
		<cfscript>
			super.init(argumentCollection=arguments);
			
			/* Plugin Properties */
			setPluginName("Validator");
			setPluginVersion("1.0");
			setPluginDescription("Validate Stuff now!");
			//setPluginAuthor("Luis Majano & Henrik Joreteg");
			//setPluginAuthorURL("http://coldbox.org,http://joreteg.com/");

			/* Return Instance */
			return this;
		</cfscript>
	</cffunction>
	
<!------------------------------------------- PUBLIC ------------------------------------------>
	
	<cfscript>		
		function checkAlphaOnly(str){
			if( reFindNoCase("^[a-zA-Z\s]*$",arguments.str) eq 0){ return false; }
			else{ return true; }
		}
		
		function checkBoolean(str){ return isBoolean(arguments.str); }
		
		function checkDate(str){ return isValid("date",arguments.str); }
		
		function checkEmail(str){ return isValid("email",arguments.str); }
		
		function checkEurodate(str){ return isValid("eurodate",arguments.str); }
		
		function checkExactLen(str,length){ return ( len(arguments.str) eq arguments.length); }
		
		function checkNumeric(str){ return isValid("numeric",arguments.str); }
		
		function checkGUID(str){ return isValid("guid",arguments.str); }
		
		function checkInteger(str){ return isValid("integer",arguments.str); }
		
		function checkMaxLen(str,length){ return (len(arguments.str) lte arguments.length); }
		
		function checkMinLen(str,length){ return (len(arguments.str) gte arguments.length); }
		
		function checkRange(str,min,max){ return isValid("range",arguments.str,arguments.min,arguments.max); }
		
		function checkRegex(str,regex){ return isValid("regex",arguments.str,arguments.regex); }
		
		function checkSameAsNoCase(str1,str2){ 
			if( compareNoCase(arguments.str1,arguments.str2) eq 0){ return true; }
			else{ return false; } 
		}
		
		function checkSameAs(str1,str2){
			if( compare(arguments.str1,arguments.str2) eq 0){ return true; }
			else{ return false; } 
		}
		
		function checkSSN(str){ return isValid("ssn",arguments.str); }
		
		function checkString(str){ return isValid("string",arguments.str); }
		
		function checkTelephone(str){ return isValid("telephone",arguments.str); }
		
		function checkWithUDF(str,udf){
			var udfCall = arguments.udf;
			return udfCall(arguments.str);
		}
		
		function checkURL(str){ return isValid("URL",arguments.str); }
		
		function checkUUID(str){ return isValid("UUID",arguments.str); }
		
		function checkUSDate(str){ return isValid("usdate",arguments.str); }
		
		function checkZipCode(str){ return isValid("zipcode",arguments.str); }
		
		function checkIPAddress(str){
			if( refindnocase("\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b",arguments.str) eq 0 ){ return false; }
			else{ return true; }
		}	
	</cfscript>
</cfcomponent>