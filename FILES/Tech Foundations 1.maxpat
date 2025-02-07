{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 237.0, 89.0, 1103.0, 685.0 ],
		"bglocked" : 0,
		"defrect" : [ 237.0, 89.0, 1103.0, 685.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "< 1",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 500.0, 297.0, 32.5, 20.0 ],
					"outlettype" : [ "int" ],
					"id" : "obj-5",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "random 4",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 500.0, 269.0, 61.0, 20.0 ],
					"outlettype" : [ "int" ],
					"id" : "obj-3",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "use blading.mov",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 52.0, 218.0, 100.0, 20.0 ],
					"id" : "obj-68",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "playbar",
					"numinlets" : 1,
					"presentation_rect" : [ 15.0, 240.0, 267.0, 16.0 ],
					"numoutlets" : 2,
					"patching_rect" : [ 130.0, 313.0, 224.0, 16.0 ],
					"presentation" : 1,
					"outlettype" : [ "", "int" ],
					"id" : "obj-66"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 260.118134, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 940.0, 363.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-65",
					"blinkcolor" : [ 0.0, 1.0, 0.05098, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"presentation_rect" : [ 338.0, 12.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"patching_rect" : [ 885.0, 558.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "int" ],
					"id" : "obj-64"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gswitch2",
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 537.0, 335.0, 39.0, 32.0 ],
					"outlettype" : [ "", "" ],
					"id" : "obj-62"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "5. Show selection of compenents to be displayed in presentation mode.",
					"linecount" : 4,
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 128.0, 603.0, 150.0, 62.0 ],
					"id" : "obj-60",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "4. Show how to create a movie viewer, load a movie, get basic info, then drive it with semi-random drunk.",
					"linecount" : 5,
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 222.0, 227.0, 154.0, 75.0 ],
					"id" : "obj-58",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "3. Show how random can make random values (and notes), and how scale can be used to make it usable.",
					"linecount" : 4,
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 563.0, 533.0, 154.0, 62.0 ],
					"id" : "obj-56",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 36.0, 112.0, 20.0, 20.0 ],
					"outlettype" : [ "bang" ],
					"id" : "obj-54"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "1. Show how a button makes a bang message, then how a metro clocks bangs for us. Also, speed control.",
					"linecount" : 5,
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 165.0, 44.0, 150.0, 75.0 ],
					"id" : "obj-52",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "2. Show the use of a counter to step through numbers, and select activity based on the number.",
					"linecount" : 4,
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 785.0, 142.0, 169.0, 62.0 ],
					"id" : "obj-50",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Mute:",
					"numinlets" : 1,
					"presentation_rect" : [ 290.0, 12.0, 45.0, 20.0 ],
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 822.0, 558.0, 58.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-48",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Timing:",
					"numinlets" : 1,
					"presentation_rect" : [ 17.0, 12.0, 53.0, 20.0 ],
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 36.0, 12.0, 150.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-46",
					"fontsize" : 12.0,
					"frgb" : [ 0.101961, 0.121569, 0.172549, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"patching_rect" : [ 822.0, 251.0, 50.0, 20.0 ],
					"outlettype" : [ "int", "bang" ],
					"id" : "obj-45",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 231.037033, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 921.0, 341.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-39",
					"blinkcolor" : [ 0.87451, 0.25098, 0.717647, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 200.506546, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 902.0, 318.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-40"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 169.976074, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 883.0, 363.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-36",
					"blinkcolor" : [ 0.0, 1.0, 0.05098, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 139.445572, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 865.0, 341.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-37",
					"blinkcolor" : [ 0.87451, 0.25098, 0.717647, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 108.501091, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 846.0, 318.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-38"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 78.000725, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 827.0, 363.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-35",
					"blinkcolor" : [ 0.0, 1.0, 0.05098, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 46.64225, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 809.0, 340.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-33",
					"blinkcolor" : [ 0.87451, 0.25098, 0.717647, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"presentation_rect" : [ 17.0, 270.0, 20.587418, 20.587418 ],
					"numoutlets" : 1,
					"patching_rect" : [ 790.0, 317.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "bang" ],
					"id" : "obj-31"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "select 0 1 2 3 4 5 6 7 8",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 10,
					"patching_rect" : [ 790.0, 283.0, 187.5, 20.0 ],
					"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "" ],
					"id" : "obj-29",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 0 8",
					"numinlets" : 5,
					"fontname" : "Arial",
					"numoutlets" : 4,
					"patching_rect" : [ 790.0, 214.0, 73.0, 20.0 ],
					"outlettype" : [ "int", "", "", "int" ],
					"id" : "obj-28",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "scale 0 127 48 72",
					"numinlets" : 6,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 557.0, 382.0, 105.0, 20.0 ],
					"outlettype" : [ "" ],
					"id" : "obj-27",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "length",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 162.0, 275.0, 43.0, 18.0 ],
					"outlettype" : [ "" ],
					"id" : "obj-26",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "print",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 36.0, 600.0, 34.0, 20.0 ],
					"id" : "obj-20",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "drunk 7240 724",
					"numinlets" : 3,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 36.0, 246.0, 94.0, 20.0 ],
					"outlettype" : [ "int" ],
					"id" : "obj-19",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "imovie",
					"numinlets" : 1,
					"presentation_rect" : [ 15.0, 47.0, 267.0, 193.0 ],
					"numoutlets" : 3,
					"autofit" : 1,
					"patching_rect" : [ 36.0, 338.0, 320.0, 240.0 ],
					"presentation" : 1,
					"outlettype" : [ "int", "int", "int" ],
					"id" : "obj-15",
					"name" : "blading.mov",
					"films" : [ "dvkite.mov", "wheel.mov" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "nslider",
					"numinlets" : 2,
					"presentation_rect" : [ 289.0, 47.0, 72.57576, 191.600006 ],
					"numoutlets" : 2,
					"patching_rect" : [ 475.0, 421.0, 65.0, 171.600006 ],
					"presentation" : 1,
					"outlettype" : [ "int", "int" ],
					"id" : "obj-14"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"patching_rect" : [ 581.0, 416.0, 50.0, 20.0 ],
					"outlettype" : [ "int", "bang" ],
					"id" : "obj-13",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "noteout",
					"numinlets" : 3,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patching_rect" : [ 557.0, 491.0, 51.0, 20.0 ],
					"id" : "obj-10",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "makenote 100 800",
					"numinlets" : 3,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"patching_rect" : [ 557.0, 450.0, 110.0, 20.0 ],
					"outlettype" : [ "float", "float" ],
					"id" : "obj-9",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "random 128",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 557.0, 298.0, 75.0, 20.0 ],
					"outlettype" : [ "int" ],
					"id" : "obj-8",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"presentation_rect" : [ 99.0, 12.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"numoutlets" : 2,
					"patching_rect" : [ 82.0, 45.0, 50.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "int", "bang" ],
					"id" : "obj-7",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"presentation_rect" : [ 74.0, 12.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"patching_rect" : [ 36.0, 45.0, 20.0, 20.0 ],
					"presentation" : 1,
					"outlettype" : [ "int" ],
					"id" : "obj-4"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 200",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 36.0, 80.0, 65.0, 20.0 ],
					"outlettype" : [ "bang" ],
					"id" : "obj-2",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 557.0, 213.0, 20.0, 20.0 ],
					"outlettype" : [ "bang" ],
					"id" : "obj-1"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "read",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patching_rect" : [ 145.0, 247.0, 35.0, 18.0 ],
					"outlettype" : [ "" ],
					"id" : "obj-16",
					"fontsize" : 12.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-62", 1 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 8 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 1 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 2 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 3 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 4 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 5 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 6 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 7 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-62", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-2", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 1 ],
					"destination" : [ "obj-10", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
