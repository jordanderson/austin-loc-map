/* ****************************************************************** */
/* OSM BRIGHT for Imposm                                              */
/* ****************************************************************** */

/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */
 
/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); buffer-size: 512; }

/* set up font sets for various weights and styles */
@sans_lt:           "Open Sans Regular","DejaVu Sans Book","unifont Medium";
@sans:              "Open Sans Semibold","DejaVu Sans Book","unifont Medium";
@sans_bold:         "Open Sans Bold","DejaVu Sans Bold","unifont Medium";
@sans_italic:       "Open Sans Semibold Italic","DejaVu Sans Italic","unifont Medium";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Italic","unifont Medium";

/* Retina adjustments */
@text_adjust: 		0; /* 0 for non-retina. 7-ish for retina */
@width_adjust: 		0; /* 0 for non-retina. 2-ish for retina */
@retina_color: 		1; /* 1 for non-retina. 1 for retina */
@one_way_scale_15: 	"scale(1)";
@one_way_scale_16: 	"scale(1)"; /* 1 for non-retina. 1.5 for retina */
@one_way_scale_17: 	"scale(1.5)"; /* 1.5 for non-retina. 2 for retina */


/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@land:              #e8e6df * 1.02;
@water:             #a8c3e0;
@water_edge:        #ffffff;
@grass:             #c6e0b1;
@beach:             #FFEEC7;
@park:              #C3D9AD; 
@cemetery:          #D6DED2;
@wooded:            #C3D9AD;
@agriculture:       #F2E8B6;

@building:          #E4E0E0;
@hospital:          #E4E0E0;
@school:            #C3D9AD;
@sports:            #C3D9AD;
@high_loc:          #aad46e;

@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           @land * 0.96;


@coast_outer: #bcddf4;
@coast_inner: #7eaac1;


/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_line:     #f7f1ee * 0.85; /* #f7f1ee * 0.85; /* #f7f3f3 * 0.8; */
@motorway_fill:     lighten(@motorway_line,10%);
@motorway_case:     @motorway_line * 0.7;

@motorway_link_line:     lighten(@motorway_line,10%);
@motorway_link_fill:     lighten(@motorway_fill,10%);
@motorway_link_case:     lighten(@motorway_case,10%);

@trunk_line:        #f7f1ee;
@trunk_fill:        lighten(@trunk_line,10%);
@trunk_case:        @trunk_line * 0.9;

@primary_line:      #f7f5f1;
@primary_fill:      lighten(@primary_line,10%);
@primary_case:      @primary_line * 0.9;

@secondary_line:    #fcfaf3;
@secondary_fill:    lighten(@secondary_line,10%);
@secondary_case:    @secondary_line * 0.9;

@standard_line:     @land * 0.85;
@standard_fill:     #fff;
@standard_case:     @land * 0.9;

@pedestrian_line:   @park;
@pedestrian_fill:   #FAFAF5;
@pedestrian_case:   @land;

@cycle_line:        @park;
@cycle_fill:        #FAFAF5;
@cycle_case:        @land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ccc;

@bike_lane:         #2B94D6;
@greenway:          #c3d9ad;
@bike_shared:       @bike_lane;

@high_loc: 			@greenway;
@medium_loc: 		@bike_lane;
@medium2_loc: 		@bike_lane;
@low_loc: 			#ffa500; /* #ffa500 */
@vlow_loc: 			#ff0000;


/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,34%);

@country_text:      #435 * @retina_color;
@country_halo:      @place_halo;

@state_text:        #546 * @retina_color;
@state_halo:        @place_halo;

@city_text:         #444 * @retina_color;
@city_halo:         @place_halo;

@town_text:         #666 * @retina_color;
@town_halo:         @place_halo;

@poi_text:          #888 * @retina_color;

@road_text:         #111 * @retina_color;
@road_halo:         rgba(255, 255, 255, 0.7);

@other_text:        #888 * @retina_color;
@other_halo:        @place_halo;

@locality_text:     #aaa * @retina_color;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #888 * @retina_color;
@village_halo:      @place_halo;

/* ****************************************************************** */



