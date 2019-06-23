 /*	---------------------------------------------------------------
	Name:			MVC
	Description:	Second App with Mod Harbour (Evolution)
	Autor:			Carles Aubia
	Date:			17/06/2019
	System: 		HWEB (Harbour for Web)
-------------------------------------------------------------------	*/

//#define __LOG__

FUNCTION Main()

	LOCAL oRequest	:= TRequest():New()
	LOCAL oRoute		:= TRoute():New( oRequest )
		
		oRoute:Map( 'GET'	, '?'							, 'help.prg' )
		oRoute:Map( 'GET'	, '/'							, 'default.prg' )
		oRoute:Map( 'GET'	, 'users'						, 'menu@users.prg' )	
		oRoute:Map( 'GET'	, 'users/(id)'					, 'info@users.prg' )	
		oRoute:Map( 'GET'	, 'users/listado'				, 'listado@users.prg' )	
		oRoute:Map( 'GET'	, 'compras/customer/(id)'		, 'edit@dummy.prg' )	
		oRoute:Map( 'GET'	, 'compras/customer/(id)/(age)'	, 'update@dummy.prg' )	
		oRoute:Map( 'GET'	, 'compras/customer/view/(id)'	, 'view@dummy.prg' )	
		oRoute:Map( 'GET'	, 'vista'						, 'vista.prg' )	
		oRoute:Map( 'GET'	, 'vista/(peticion)'			, 'controlvista.prg' )	
		oRoute:Map( 'DELETE', 'z/dummy'						, 'dummy.prg' )	
		oRoute:Map( 'GET'	, 'list'						, 'list.prg' )
		oRoute:Map( 'PUT'	, 'z2/dummy'					, 'dummy.prg' )	
		oRoute:Map( 'POST'	, 'list'						, 'list.prg' )	
	
	oRoute:Listen()	//	Escucha entrada !
	
RETURN NIL

{% MemoRead( hb_GetEnv("PRGPATH") + "/lib/tmvc.prg") %}