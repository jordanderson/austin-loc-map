/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land[zoom>=0][zoom<6],
#shoreline_300[zoom>=6][zoom<10],
#processed_p[zoom>=10] {
  polygon-fill: @land;
  polygon-gamma: 0.75;
}


#processed_p[zoom>=15]
{
  line-width: 6 + @width_adjust;
  line-color: lighten(@coast_outer,5);
  line-join: round;
  line-opacity: 0.6;
  building-fill: @land;
  building-height: 4.0;
  
  [zoom=14] { line-width: 4 + @width_adjust; }
  [zoom=15] { building-height: 5.0; }
  [zoom=16] { 
    building-height: 5.0; 
    line-width: 6 + @width_adjust; 
  }
  [zoom>=17] { line-width: 8 + @width_adjust; }
}


#landuse_gen0[zoom>3][zoom<=9],
#landuse_gen1[zoom>9][zoom<=12],
#landuse[zoom>12] {
  
  [type='wetland']       { polygon-fill: @water; }
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='forest']        { polygon-fill: @wooded; }
  [type='golf_course']   { polygon-fill: @park; }
  [type='grass']         { polygon-fill: @park; }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-fill: @industrial; }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='school']        { polygon-fill: @school; }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='wood']          { polygon-fill: @wooded; }
  [type='beach']         { polygon-fill: @beach; }
  [type='swimming_pool'] { polygon-fill: @water; }
}

#landuse_overlays[type='nature_reserve'][zoom>6] {
  line-color: darken(@wooded,25%);
  line-opacity:  0.3;
  line-dasharray: 1,1;
  polygon-fill: darken(@wooded,25%);
  polygon-opacity: 0.1;
  [zoom=7] { line-width: 0.4 + @width_adjust; }
  [zoom=8] { line-width: 0.6 + @width_adjust; }
  [zoom=9] { line-width: 0.8 + @width_adjust; }
  [zoom=10] { line-width: 1.0 + @width_adjust; }
  [zoom=11] { line-width: 1.5 + @width_adjust; }
  [zoom>=12] { line-width: 2.0 + @width_adjust; }
}

#landuse[type='wetland'][zoom>11] {
  [zoom>11][zoom<=14] { polygon-pattern-file:url(img/marsh-16.png); }
  [zoom>14] { polygon-pattern-file:url(img/marsh-32.png);}
}

#landuse_overlays[type='wetland'][zoom>11] {
  [zoom>11][zoom<=14] { polygon-pattern-file:url(img/marsh-16.png); }
  [zoom>14] { polygon-pattern-file:url(img/marsh-32.png);}
  }

/* ---- BUILDINGS ---- */
#buildings[zoom>10][zoom<=16] {
  polygon-fill:@building;
  [zoom>13] {
    line-color:darken(@building,5);
    line-width:0.2 + @width_adjust;
  }
  [zoom>15] {
    line-color:darken(@building,10);
    line-width:0.4 + @width_adjust;
  }
}
/* At the highest zoom levels, render buildings in fancy pseudo-3D */
#buildings[zoom>=16][type != 'hedge'] {
  building-fill:@building;
  building-height:1.25;
  [zoom=16] { building-height: 0.75}
}

#buildings[zoom>=16][type = 'hedge'] {
  building-fill:@wooded;
  building-height:1.25;
  [zoom=16] { building-height: 0.75}
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map { background-color: @water; }

#water_gen0[zoom>3][zoom<=9],
#water_gen1[zoom>9][zoom<=12],
#water[zoom>12][zoom<=15] {
  polygon-fill: @water;
 /* polygon-gamma: 0.75; */
}

#water[zoom>=16] {
  building-fill: @water;
  line-width: 2 + @width_adjust;
  line-color: lighten(@coast_outer,5);
  line-opacity: 0.6;
}


/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway_low[zoom>=8][zoom<=12] {
  line-color: @water;
  [zoom=8] { line-width: 0.1 + @width_adjust; }
  [zoom=9] { line-width: 0.2 + @width_adjust; }
  [zoom=10]{ line-width: 0.4 + @width_adjust; }
  [zoom=11]{ line-width: 0.6 + @width_adjust; }
  [zoom=12]{ line-width: 0.8 + @width_adjust; }
}

#waterway_med[zoom>=13][zoom<=14] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=13]{ line-width: 1 + @width_adjust; }
    [zoom=14]{ line-width: 1.5 + @width_adjust; }
  }
  [type='stream'] {
    [zoom=13]{ line-width: 0.2 + @width_adjust; }
    [zoom=14]{ line-width: 0.4 + @width_adjust; }
  }
}
  
#waterway_high[zoom>=15] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=15]{ line-width: 2 + @width_adjust; }
    [zoom=16]{ line-width: 3 + @width_adjust; }
    [zoom=17]{ line-width: 4 + @width_adjust; }
    [zoom=18]{ line-width: 5 + @width_adjust; }
    [zoom=19]{ line-width: 6 + @width_adjust; }
    [zoom>19]{ line-width: 7 + @width_adjust; }
  }
  [type='stream'] {
    [zoom=15]{ line-width: 0.6 + @width_adjust; }
    [zoom=16]{ line-width: 0.8 + @width_adjust; }
    [zoom=17]{ line-width: 1 + @width_adjust; }
    [zoom=18]{ line-width: 1.5 + @width_adjust; }
    [zoom>18]{ line-width: 2 + @width_adjust; }
  }
  [type='ditch'],
  [type='drain'] {
    [zoom=15]{ line-width: 0.1 + @width_adjust; }
    [zoom=16]{ line-width: 0.3 + @width_adjust; }
    [zoom=17]{ line-width: 0.5 + @width_adjust; }
    [zoom=18]{ line-width: 0.7 + @width_adjust; }
    [zoom=19]{ line-width: 1 + @width_adjust; }
    [zoom>19]{ line-width: 1.5 + @width_adjust; }
  }
}

/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */


#admin[admin_level=2][zoom>1] {
  line-color:@admin_2;
  line-width:0.5 + @width_adjust;
  [zoom=2] { line-opacity: 0.25; }
  [zoom=3] { line-opacity: 0.3; }
  [zoom=4] { line-opacity: 0.4; }
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */


#barrier_points[zoom>=17][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[zoom>=17][stylegroup = 'gate'] {
  line-width:2.5 + @width_adjust;
  line-color:#aab;
  line-dasharray:3,2;
}

#barrier_lines[zoom>=17][stylegroup = 'fence'] {
  line-width:1.75 + @width_adjust;
  line-color:#aab;
  line-dasharray:1,1;
}

#barrier_lines[zoom>=17][stylegroup = 'hedge'] {
  line-width:3 + @width_adjust;
  line-color:darken(@park,5);

}

/* ================================================================== */
/* SUBWAY ICONS
/* ================================================================== */
/*
#subway {
  [zoom=15] {
    point-file: url(./res/metro-10.png);
    point-opacity: 0.8;
  }
  [zoom=16] {
    point-file: url(./res/metro-15.png);
    point-allow-overlap: true;
  }
  [zoom=17] {
    point-file: url(./res/metro-15.png);
    point-allow-overlap: true; 
  }
}
*/
