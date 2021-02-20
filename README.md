# e()
## Construct complex aggregated objects 
## using a clean & readable syntax

## Important: 
requires underscore https://raw.githubusercontent.com/nftools/underscore/master/_.prg 


```
* Marco Plaza, 2021
* https://github.com/nfTools/e
* @nfoxDev
* 

Public myFoxPc,myePc,my_pc, oResponse

* construct rich response or pass objects with ease:

Select * From Home()+'samples\northwind\customers' Into Array Cust
Cursortoxml(Alias(),"xml")

oResponse = e('cursor','customers','rows',@Cust,'count',_Tally,'dt',Datetime(),'xml',m.xml)


* aggregated objects:

myePc = e('modelName','Ryzen Performance Plus','color','black',;
	'keyboard.specs.colors(2)','white','black',;
	'keyboard.specs.lang(3)','es','us','sp',;
	'cpu',;
	e('model','ryzen 7','clockSpeed',4.3,'coreCount',8),;
	'motherboard',;
	e('formfactor','atx','make','asus'),;
	'hdds(3)',;
	e('capacity','500G','type','ssd','connectors(3)','sata','power','esata'),;
	e('capacity','256G','type','M2'),;
	e('capacity','2T','type','standard'),;
	'monitors(2)',;
	e('size',24,'brand','acer'),;
	e('size',20,'brand','aoc');
	)

* Compare using vfp9 Original syntax:

myFoxPc = Createobject('empty')

With myFoxPc

	AddProperty(myFoxPc,'modelName','Ryzen Performance Plus')
	AddProperty(myFoxPc,'color','black')
	AddProperty(myFoxPc,'keyboard',Createobject('empty'))
	
	AddProperty(.Keyboard,'specs',Createobject('empty'))

	With .Keyboard

		AddProperty(.specs,'colors(2)')
		.specs.Colors(1) = 'black'
		.specs.Colors(2) = 'white'

		AddProperty(.specs,'lang(3)')
		.specs.Lang(1) = 'sp'
		.specs.Lang(2) = 'es'
		.specs.Lang(3) = 'us'

	Endwith


	AddProperty(myFoxPc,'cpu',Createobject('empty'))
	AddProperty(.cpu,'model','Ryzen 7')
	AddProperty(.cpu,'clockSpeed',4.3)
	AddProperty(.cpu,'coreCount',8)

	AddProperty(myFoxPc,'motherboard',Createobject('empty'))
	AddProperty(.motherboard,'formfactor','atx')
	AddProperty(.motherboard,'make','asus')

	AddProperty(myFoxPc,'hdds(2)')

	.hdds(1) = Createobject('empty')
	AddProperty(.hdds(1),'capacity','500gb')
	AddProperty(.hdds(1),'type','ssd')
	AddProperty(.hdds(1),'connectors(3)')
	
	.hdds(1).connectors(1) = 'sata'
	.hdds(1).connectors(2) = 'power'
	.hdds(1).connectors(3) = 'esata'

	.hdds(2) = Createobject('empty')
	AddProperty(.hdds(2),'capacity','256gb')
	AddProperty(.hdds(2),'type','M2')

Endwith

* using underscore:

my_pc = e()  && = CREATEOBJECT('empty')

With _(my_pc)

	.modelName = 'Ryzen Performance plus'
	.Color		= 'black'

	With _(.Keyboard,'specs')
		.ColorS = .newlist('white','black')
	Endwith


	With _(.motherboard)
		.formfactor = 'atx'
		.Make	= 'asus'
	Endwith


	.hdds = .newlist()

	With .NewItem('hdds')
		.capacity = '500G'
		.Type	  = 'ssd'
		.connectors	= .newlist('sata','power','esata')
	Endwith


	.monitors = .newlist()

	With .NewItem('monitors')
		.Size	= 24
		.brand	= 'acer'
	Endwith

	With .NewItem('monitors')
		.Size	= 20
		.brand	= 'aoc'
	Endwith


Endwith

```
