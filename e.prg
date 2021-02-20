**************************************************************
* Author: Marco Plaza, 2018
* @nfoxDev, http://www.noVfp.com
* nfTools https://github.com/nfTools
****************************************************************************************
* requires underscore function ( "_.prg"  )
* download from https://github.com/nftools/underscore/blob/master/_.prg 
*--------------------------------------------------------------------------
Lparameters p1,v1,p2,v2,p3,v3,p4,v4,p5,v5,p6,v6,p7,v7,p8,v8,p9,v9,p10,v10

If Pcount() = 0
	Return Createobject('empty')
Endif

Local cerrormsg,retvalue,o,Y,x,oException

cerrormsg = ''
retvalue = .F.

Try

	o = Create('empty')

	For x = 1 To Round(Pcount()/2,0)

		Y = Transform( m.x )

		_(m.o,m.p&Y,@v&Y)

	Endfor

	retvalue = m.o

Catch To oException

	cerrormsg = oException.Message
	retvalue = .Null.

Endtry

If !Empty(m.cerrormsg)
	Error 'e.prg: '+m.cerrormsg
Endif

Return m.retvalue
