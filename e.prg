**************************************************************
* Author: Marco Plaza, 2018
* @nfoxDev, http://www.noVfp.com
* nfTools https://github.com/nfTools
****************************************************************************************
* requires underscore function ( "_.prg"  )
* download from https://github.com/nftools/underscore/blob/master/_.prg 
*--------------------------------------------------------------------------
Lparameters p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26

If Pcount() = 0
	Return Createobject('empty')
Endif

Local cerrormsg,retvalue,ox,Y,x,oException,nProperties,nItem,pName,npar

npar = PCOUNT()

cerrormsg = ''
retvalue = .F.

Try

	ox = Create('empty')
	x = 1

	DO WHILE x <  m.nPar

		Y = Transform( m.x )
		pName = m.p&Y

		If Right(m.pName,1) = ')'
		
			_(m.ox,m.pName)

			pName = Left(m.pName,Atc('(',m.pName)-1)
			nItem = 1

			Do While m.nItem <=  Alen(ox.&pName) 
				x = m.x + 1
				Y = Transform( m.x )
				ox.&pName(m.nItem) = m.p&Y
				nItem = m.nItem + 1
			Enddo

		Else

			x = m.x + 1
			Y = Transform( m.x  )

			_(m.ox,m.pName,@p&Y)
			

		Endif

		x = m.x + 1

	ENDDO

	retvalue = m.ox


Catch To oException

	cerrormsg = m.oException.message()
	retvalue = .Null.

Endtry

If !Empty(m.cerrormsg)
	Error m.cerrormsg
Endif

Return m.retvalue
