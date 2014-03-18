/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */

/* At lower zoomlevels, just show major automobile routes: motorways
and trunks. */

#roads_low[zoom>=5][zoom<=8] {
  [type='motorway'] { line-color: @motorway_line; }
  [type='trunk'] { line-color: @trunk_line; }
  [zoom=5] {
    [type='motorway'] { line-width: 0.4; }
    [type='trunk'] { line-width: 0.2; } }
  [zoom=6] {
    [type='motorway'] { line-width: 0.5; }
    [type='trunk'] { line-width: 0.25; } }
  [zoom=7] {
    [type='motorway'] { line-width: 0.6; }
    [type='trunk'] { line-width: 0.3; } }
  [zoom=8] {
    [type='motorway'] { line-width: 1; }
    [type='trunk'] { line-width: 0.5; } }
}

/* At mid-level scales start to show primary and secondary routes
as well. */

#roads_med[zoom>=9][zoom<=10] {
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line;
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line;
  }
  [type='primary'] { line-color: @primary_line; }
  [type='secondary'] { line-color: @secondary_line; }
  [type='tertiary'] { line-color: @standard_line; }
  [zoom=9] {
    [type='motorway'],[type='trunk'] { line-width: 1.0; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.5; }
  }
  [zoom=10] {
    [type='motorway'],[type='trunk'] { line-width: 1.0; }
    [type='primary'],[type='secondary'],
    [type='motorway_link'],[type='trunk_link'] { line-width: 0.0; }
  }
} 

/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* Road width variables that are used in road & bridge styles */
@rdz11_maj: 0.1; @rdz11_med: 0.1; @rdz11_min: 0;
@rdz12_maj: 2.5; @rdz12_med: 1.2; @rdz12_min: 0;
@rdz13_maj: 3;   @rdz13_med: 1.5; @rdz13_min: 1;
@rdz14_maj: 5;   @rdz14_med: 3.5;   @rdz14_min: 3;
@rdz15_maj: 6 + @width_adjust*.3;   @rdz15_med: 9 + @width_adjust*.3; @rdz15_min: 4.5;
@rdz16_maj: 7 + @width_adjust*1.5;  @rdz16_med: 12 + @width_adjust*1.2;  @rdz16_min: 8 + @width_adjust;
@rdz17_maj: 16 + @width_adjust*2.5;  @rdz17_med: 20 + @width_adjust*2.2;  @rdz17_min: 17 + @width_adjust*1.5;
@rdz18_maj: 22 + @width_adjust*2;  @rdz18_med: 26 + @width_adjust*2;  @rdz18_min: 26 + @width_adjust*2;

/* ---- Bike Facilities ---------------------------------------------- */

/* 
H – High (Green)
HP – High, Trail Paved (Green with interior long dashed line)
HU – High Trail Unpaved (Green with interior dotted line)
M - Medium Comfort (Light Blue)
M2 – Medium2 Comfort (Dark Blue)
L - Low Comfort (Yellow/Orange)
EL - Extremely Low Comfort (Red)

RT - Recreational Trail (dark green)
SS - Useful Sidewalks (dark teal)
SW – Sidewalks (very light teal)
B – Bicycle Prohibited (these are very lightly used)
DZ – Dismount Zone (these are very lightly used)
 
Disregard these
U - NA
Null - NA
10 - NA

The attribute OVERUNDER stores the z data you’re looking for. The values here are
NULL – nothing special
O -  The lines crosses over, and does not connect with, another route line
U -  The lines crosses under, and does not connect with, another route line
O2 -  The lines crosses over another route line, but there is a connection very near by
U2 -  The lines crosses under  another route line, but there is a connection very near by

*/

/*
#austin_loc::shadow[zoom>=10] {
	[USE_RATING='H'],#austin_loc[USE_RATING='HP'],#austin_loc[USE_RATING='HU'],
	[USE_RATING='M'],[USE_RATING='M2'],[USE_RATING='L'],[USE_RATING='EL'] { 
  		line-offset: 2;
    	line-color: #333;
		line-width: 6 + @width_adjust;
		opacity: 0.4;
    }
}
*/

.austin_loc[USE_RATING='HP']::outline[zoom>=14],
.austin_loc[USE_RATING='HU']::outline[zoom>=14],
.austin_loc[USE_RATING='H']::outline[zoom>=14],
.austin_loc[USE_RATING='M']::outline[zoom>=14],
.austin_loc[USE_RATING='M2']::outline[zoom>=14],
.austin_loc[USE_RATING='L']::outline[zoom>=14],
.austin_loc[USE_RATING='L2']::outline[zoom>=14],
.austin_loc[USE_RATING='ML']::outline[zoom>=14],
.austin_loc[USE_RATING='EL']::outline[zoom>=14],
{
  line-color: #000;
  opacity: 0.6;
  [zoom=14] {  line-width: 5 + @width_adjust; }
  [zoom=15] {  line-width: 5 + @width_adjust; }
  [zoom=16] {  line-width: 5 + @width_adjust; }
  [zoom=17] {  line-width: 6 + @width_adjust; }
  [zoom=18] {  line-width: 8 + @width_adjust; }
}

.austin_loc[USE_RATING='TC']::outline[zoom>=14],
.austin_loc[USE_RATING='SS']::outline[zoom>=14],
{
  line-color: #000;
  opacity: 0.6;
  [zoom=14] {  line-width: 3 + @width_adjust; }
  [zoom=15] {  line-width: 3 + @width_adjust; }
  [zoom=16] {  line-width: 3 + @width_adjust; }
  [zoom=17] {  line-width: 4 + @width_adjust; }
  [zoom=18] {  line-width: 5 + @width_adjust; }
}

.austin_loc[USE_RATING='EL'] {
	line-color: @vlow_loc;
}
/*
.austin_loc::outer[USE_RATING='M'] {
	line-color: @standard_fill;
	line-width: 5 + @width_adjust;
}
*/

.austin_loc[USE_RATING='M'],
.austin_loc[USE_RATING='M2']
{
	line-color: lighten(@bike_lane, 10%);
     line-cap: round;
}

.austin_loc[USE_RATING='L'],
.austin_loc[USE_RATING='L2'],
.austin_loc[USE_RATING='ML'],
{
	line-color: @low_loc;
}

.austin_loc[zoom>=10] {
	[USE_RATING='H'],
    [USE_RATING='M2'],
    [USE_RATING='L'],
    [USE_RATING='L2'],
    [USE_RATING='ML'],
    [USE_RATING='EL'] {
  		line-width: 3 + @width_adjust;
  		line-opacity: 1.0;
    	line-cap: round;
   	}
 }


.austin_loc[USE_RATING='SS'] {
	line-color: #ccc;
	line-width: 2 + @width_adjust;
}

.austin_loc[USE_RATING='TC'] {
	line-color: @high_loc;
	line-width: 2 + @width_adjust;
}

.austin_loc[USE_RATING='RT'] {
	line-color: darken(@high_loc, 25%);
	line-width: 2 + @width_adjust;
  
}

.austin_loc[zoom>=10] {
	[USE_RATING='HP'], 
    [USE_RATING='HU'] {
      	line-width: 4 + @width_adjust;
  		line-opacity: 1.0;
    }
}

.austin_loc[USE_RATING='H'],
.austin_loc[USE_RATING='HP'],
.austin_loc[USE_RATING='HU'] {
    line-cap: round;
	line-color: @high_loc;
	line-width: 4 + @width_adjust*1.2;
}

.austin_loc::inner[zoom>=10][USE_RATING='HU']  {
  	line-color: #000;
	line-width: 1 + @width_adjust;
  	line-opacity: 1.0;
    line-dasharray: 2,5; 
}

.austin_loc::inner[zoom>=10][USE_RATING='HP']  {
  	line-color: #000;
	line-width: 1 + @width_adjust;
  	line-opacity: 1.0;
    line-dasharray: 5,6; 
}

.austin_loc::inner[USE_RATING='M'] {
	line-width: 3 + @width_adjust;
  	line-color: lighten(@bike_lane, 10%);
  	line-opacity: 1.0;
    line-cap: round;

}

#austin_loc_hi[OVERUNDER='U'],
#austin_loc_hi[OVERUNDER='U2'],
/* #austin_loc_hi[OVERUNDER=''],
#austin_loc_hi[OVERUNDER=''], 
#austin_loc_hi::inner[OVERUNDER=''],
#austin_loc_hi::inner[OVERUNDER=''], */
#austin_loc_hi::inner[OVERUNDER='U'],
#austin_loc_hi::inner[OVERUNDER='U2'],
#austin_loc_hi::outline[OVERUNDER='U'],
#austin_loc_hi::outline[OVERUNDER='U2'] {
  	line-opacity: 0.0;
}


#austin_loc_low[OVERUNDER='O'],
#austin_loc_low[OVERUNDER='O2'],
#austin_loc_low::inner[OVERUNDER='O'],
#austin_loc_low::inner[OVERUNDER='O2'],
#austin_loc_low::outline[OVERUNDER='O'],
#austin_loc_low::outline[OVERUNDER='O2']{
  	line-opacity: 0.0;
}

#austin_loc_hi[ALTEREDGEO='F'],
#austin_loc_low[ALTEREDGEO='F'],
.austin_loc[ALTEREDGEO='F'],
.austin_loc::outline[ALTEREDGEO='F'],
.austin_loc::inner[ALTEREDGEO='F'],
#austin_loc_hi::inner[ALTEREDGEO='F'],
#austin_loc_low::inner[ALTEREDGEO='F'],
#austin_loc_hi[ALTEREDGEO='H'],
#austin_loc_low[ALTEREDGEO='H'],
.austin_loc[ALTEREDGEO='H'],
.austin_loc::outline[ALTEREDGEO='H'],
.austin_loc::inner[ALTEREDGEO='H'],
#austin_loc_hi::inner[ALTEREDGEO='H'],
#austin_loc_low::inner[ALTEREDGEO='H']
{
  line-opacity: 0.0;	
}

/* ---- Casing ----------------------------------------------- */

#roads_high::outline[zoom>=11][zoom<=20],
#tunnel[render='1_outline'][zoom>=11][zoom<=20],
#bridge[render='1_outline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-cap: round;
  [bridge=1] {
    line-cap: butt;
    /*line-opacity: 0.5; */
  }

  line-join: round;
  line-color: @standard_case;
  [bridge=1] { line-color: @standard_case * 0.9; }
  /* [type='motorway'], */
  [type='motorway_link'] {
    line-color: @motorway_case;
    [bridge=1] { line-color: @motorway_case * 0.95; }
  }
  [type='motorway_link'] {
    line-color: @motorway_link_case;
    [bridge=1] { line-color: @motorway_link_case * 0.95; }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_case;
    [bridge=1] { line-color: @trunk_case * 0.7; }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_case;
    [bridge=1] { line-color: @primary_case * 0.7; }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_case;
    [bridge=1] { line-color: @secondary_case * 0.8; }
  }
  [stylegroup='railway'] {
    line-color: fadeout(@land,50%);
    [bridge=1] { line-color: @secondary_case * 0.7; }
    [tunnel=1] { line-opacity: 0.0; }
  }
  [tunnel=1] { 
    line-dasharray: 3,3; 
    line-opacity: 0.1;
  }        
  /* -- Casing widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj + 1; }
    /* No minor bridges yet */
    [stylegroup='mainroad'] { line-width: 0; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj + 1; }
  	[stylegroup='mainroad'] { line-width: 0; }
    [stylegroup='minorroad']{ line-width: 0; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj + 2; }
   	[stylegroup='mainroad'] { line-width: 0; }
    [stylegroup='minorroad']{ line-width: 0; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
  } 
  [zoom=14] {
    
    [stylegroup='motorway'] { line-width: @rdz14_maj + 2; }
  	[stylegroup='mainroad'] { line-width: @rdz14_med + 1.5; }
    [stylegroup='minorroad']{ line-width: @rdz14_min + 1; }
    /* No minor bridges yet */
    [stylegroup='service']  { line-width: 0; }
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 0; }
    [type='motorway_link'] { line-width: 2 + @width_adjust; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj + 2.5; }
    [stylegroup='mainroad'] { line-width: @rdz15_med + 2; }
    [stylegroup='minorroad']{ line-width: @rdz15_min + 1.5; }
    [stylegroup='service']  { line-width: @rdz15_min / 3 + 1; }
  /*  [stylegroup='noauto']   { line-width: @rdz15_min / 4 + 1; } */
    [stylegroup='railway']  { line-width: 1.5 + 1 + @width_adjust; }
    [type='motorway_link'] { line-width: 3 + @width_adjust; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj + 2; }
    [stylegroup='mainroad'] { line-width: @rdz16_med + 5; }
    [stylegroup='minorroad']{ line-width: @rdz16_min + 5; }
    [stylegroup='service']  { line-width: @rdz16_min / 3 + 2; }
    /* [stylegroup='noauto']   { line-width: @rdz16_min / 4 + 2; } */
    [stylegroup='railway']  { line-width: 2 + 2 + @width_adjust; }
    [type='motorway_link'] { line-width: 5 + @width_adjust; }
  }
  [zoom>=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj + 3; }
    [stylegroup='mainroad'] { line-width: @rdz17_med + 5; }
    [stylegroup='minorroad']{ line-width: @rdz17_min + 5; }
    [stylegroup='service']  { line-width: @rdz17_min / 3 + 2; }
  /*  [stylegroup='noauto']   { line-width: @rdz17_min / 4 + 4; } */
    [stylegroup='railway']  { line-width: 3 + 4 + @width_adjust; } // 3 + 4
    [type='motorway_link'] { line-width: 8 + @width_adjust; }
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj + 4; }
    [stylegroup='mainroad'] { line-width: @rdz18_med + 4; }
    [stylegroup='minorroad']{ line-width: @rdz18_min + 4; }
    [stylegroup='service']  { line-width: @rdz18_min / 3 + 5; }
  /*  [stylegroup='noauto']   { line-width: @rdz18_min / 4 + 6; } */
    [stylegroup='railway']  { line-width: 8 + @width_adjust; }
  }
}

#roads_high[zoom>=11][zoom<=20],
#tunnel[render='3_inline'][zoom>=11][zoom<=20],
#bridge[render='3_inline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-color: @standard_fill;
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_fill;
    [tunnel=1] { 
      line-color: lighten(@motorway_fill, 10%); 
      line-opacity: 0.3;
      [zoom>=17] {line-opacity: 0.5; }
    }
   [type='motorway_link'] { line-color: @motorway_link_fill; }
   [type='motorway_link'][zoom=14] { line-width: .75 + @width_adjust; }
   [type='motorway_link'][zoom=15] { line-width: 2 + @width_adjust; }
   [type='motorway_link'][zoom=16] { line-width: 3 + @width_adjust; }
   [type='motorway_link'][zoom=17] { line-width: 5 + @width_adjust; }

  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_fill;
    [tunnel=1] { 
      line-color: lighten(@trunk_fill, 10%); 
      line-opacity: 0.3;
      [zoom>=17] {line-opacity: 0.5; }
    }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_fill;
    [tunnel=1] { 
      line-color: lighten(@primary_fill, 10%); 
      line-opacity: 0.3;
      [zoom>=17] {line-opacity: 0.5; }
    }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_fill;
    [tunnel=1] { 
      line-color: lighten(@secondary_fill, 10%); 
      line-opacity: 0.3;
      [zoom>=17] {line-opacity: 0.5; }
    }
  }
  [stylegroup='railway'] {
    line-color: @rail_line;
    line-dasharray: 1,1;
    [tunnel=1] { 
      line-opacity: 0.0; 
    }
    [zoom>15] { line-dasharray: 1,2; } 
  }
  [stylegroup='noauto'],
  [stylegroup='service'],
  [stylegroup='minorroad'] {
    line-width: 0;
  }
  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'] {
    line-cap: round;
    line-join: round;
  }
  [stylegroup='noauto'] {
    line-join: round;
  }
  
  /* -- widths -- */

  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj; }
    [stylegroup='mainroad'] { line-width: @rdz11_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']  { line-width: 0.2; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj; }
    [stylegroup='mainroad'] { line-width: @rdz12_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']  { line-width: 0.4; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj; }
    [stylegroup='mainroad'] { line-width: @rdz13_med; }
    [stylegroup='minorroad']{ line-width: @rdz13_min; }
    [stylegroup='service']  { line-width: @rdz13_min / 3; }
    [stylegroup='railway']  { line-width: 0.8; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj; }
    [stylegroup='mainroad'] { line-width: @rdz14_med; }
    [stylegroup='minorroad']{ line-width: @rdz14_min; }
    [stylegroup='service']  { line-width: @rdz14_min / 3; }
  /*  [stylegroup='noauto']   { 
      line-width: @rdz14_min / 4; 
      line-dasharray: 1,1;
      line-opacity: 0.6;
    } */
    [stylegroup='railway']  { line-width: 1; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='service']  { line-width: @rdz15_min / 3; }
 /*   [stylegroup='noauto']   { 
      line-width: @rdz15_min / 6;
      line-dasharray: 1,2; 
      line-color: @rail_fill;
      line-opacity: 0.8;
     } */
    [stylegroup='railway']  { line-width: 1.5 + @width_adjust; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj; }
    [stylegroup='mainroad'] { line-width: @rdz16_med+3; }
    [stylegroup='minorroad']{ line-width: @rdz16_min+3; }
    [stylegroup='service']  { line-width: @rdz16_min / 3; }
  /*  [stylegroup='noauto']   { 
      line-width: @rdz16_min / 6; 
      line-dasharray: 2,2;
      line-color: @rail_fill;
      line-opacity: 0.8;
    } */
    [stylegroup='railway']  { line-width: 2; }
  }
  [zoom=17] {
    [stylegroup='motorway'] { line-width: @rdz17_maj; }
    [stylegroup='mainroad'] { line-width: @rdz17_med+3; }
    [stylegroup='minorroad']{ line-width: @rdz17_min+3; }
    [stylegroup='service']  { line-width: @rdz17_min / 3; }
 /*   [stylegroup='noauto']   { 
      line-width: @rdz17_min / 5; 
      line-dasharray: 2,2;
      line-opacity: 0.7;
    } */
    [stylegroup='railway']  { line-width: 3; }
  }
  [zoom>=18] {
    [stylegroup='motorway'] { line-width: @rdz18_maj; }
    [stylegroup='mainroad'] { line-width: @rdz18_med; }
    [stylegroup='minorroad']{ line-width: @rdz18_min; }
    [stylegroup='service']  { line-width: @rdz18_min / 2; }
 /*   [stylegroup='noauto']   { 
      line-width: @rdz18_min / 5; 
      line-dasharray: 3,3; 
      line-opacity: 0.8;
    } */
    [stylegroup='railway']  { line-width: 4 + @width_adjust; }
  }
}

/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='2_line'][zoom>=14][zoom<=20],
#bridge[render='2_line'][zoom>=14][zoom<=20]{
  /* -- colors & styles -- */
  [stylegroup='noauto'] {
    line-color: @land;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='railway'] {
    line-color: @land;
    line-join: round;
  }
  [tunnel=1] {
          line-opacity: 0.0;
     }
  
  /* -- widths -- */
  [zoom=14] {
    [stylegroup='noauto']   { line-width: @rdz14_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1 + 1 + @width_adjust; }
  }
  [zoom=15] {
    [stylegroup='noauto']   { line-width: @rdz15_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1.5 + 1 + @width_adjust; }
  }
  [zoom=16] {
    [stylegroup='noauto']   { line-width: @rdz16_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 2 + 1 + @width_adjust; }
  }
  [zoom=17] {
    [stylegroup='noauto']   { line-width: @rdz17_min / 4 + 6; }
    [stylegroup='railway']  { line-width: 3 + 2 + @width_adjust; }
  }
  [zoom>=18] {
    [stylegroup='noauto']   { line-width: @rdz18_min / 4 + 3; }
    [stylegroup='railway']  { line-width: 4 + 3 + @width_adjust; }
  }
  
  /* ---- motorway links --------------------------------------------------- */
  [type='motorway_link'] {
    line-width: 0.2 + @width_adjust;
    
  }
  
}


/* ---- Turning Circles --------------------------------------------- */
#turning_circle_case[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning_circle_fill[zoom>=14] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning_circle_case,
#turning_circle_fill {
  [zoom=14] { marker-width:@rdz14_min * 1.1; }
  [zoom=15] { marker-width:@rdz15_min * 1.1; }
  [zoom=16] { marker-width:@rdz16_min * 1.1; }
  [zoom=17] { marker-width:@rdz17_min * 1.1; }
  [zoom>=18] { marker-width:@rdz18_min * 1.1; }
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>9] {
  line-color:@aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=10]{ line-width:1 + @width_adjust; }
    [zoom=11]{ line-width:2 + @width_adjust; }
    [zoom=12]{ line-width:3 + @width_adjust; }
    [zoom=13]{ line-width:5 + @width_adjust; }
    [zoom=14]{ line-width:7 + @width_adjust; }
    [zoom=15]{ line-width:11 + @width_adjust; }
    [zoom=16]{ line-width:15 + @width_adjust; }
    [zoom=17]{ line-width:19 + @width_adjust; }
    [zoom>17]{ line-width:23 + @width_adjust; }
  }
  [type='taxiway'] {
    [zoom=10]{ line-width:0.2 + @width_adjust; }
    [zoom=11]{ line-width:0.2 + @width_adjust; }
    [zoom=12]{ line-width:0.2 + @width_adjust; }
    [zoom=13]{ line-width:1 + @width_adjust; }
    [zoom=14]{ line-width:1.5 + @width_adjust; }
    [zoom=15]{ line-width:2 + @width_adjust; }
    [zoom=16]{ line-width:3 + @width_adjust; }
    [zoom=17]{ line-width:4 + @width_adjust; }
    [zoom>17]{ line-width:5 + @width_adjust; }
  }
}

/******************************************************************* */
