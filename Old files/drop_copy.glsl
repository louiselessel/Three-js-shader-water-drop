vec2 Drop(vec2 uv, float t) {
        t *= 4.;							// scale time
        //uv *= .20;						// scale of grid
        //uv += 0.1;

        vec2 a = vec2 (1.,1.);			// aspect of grid cell
        //a = vec2(iResolution.x/iResolution.y); // aspect of grid cell based on image
        
        // st used for main drop - uv used for additional drops
        vec2 st = uv*a;					// uv to aspect
        
        // grid cell id's
        vec2 id = floor(st);
        
        // offset grid to look more random
        float noise = random(id.x, 716.34, 768.34);
        //st.y += noise;					// offset main drop
        //uv.y += noise;					// offset trail drops
        
        // make the grid move with time
        //st.y += t*0.22;						// move the grid to fit the drop fall

        // we messed with the offset, so redo the grid id
        //id = floor(st);
        
        // center drop in grid
        //st = fract(st) - 0.5; 				// move drop in center of a grid
        
        // offset timing of drops
        //t+= fract( sin(id.x*71.2 + id.y*1453) *768.9) *TWOPI; 	// * TWOPI to get complete phase shift
        
        // position of drop
        float y = 0.0;
        float x = 0.0;								// x location in grid

        //y = -sin(t+sin(t+sin(t)*0.5)) * 0.43;	// move up slow fast down -  a curve
        //x = 0.5-0.5; 
        //y = 0.5-0.5; 
        
        x = dropPosition.x;           // from external
        y = dropPosition.y;
        vec2 p1 = vec2(x, y);						// set position, y only
        
        // make it round
        vec2 offset1 = (p1-st) / a;				// offset inside box to follow box, used for getting uv
        float d = length(offset1);				// distance to center of box
        float mask1 = S(.02, .1, d);			// mask to make fuzzy or not
        
        // make more circles
        vec2 offset2 = (fract(uv*a.x*vec2(1.,2.)) -.5) / vec2(1.,2.);
        d = length(uv);					// circle in center of image
        d = length(fract(uv*a.x) -.5);	// smaller circles in each grid
        d = length(fract(uv*a.x*vec2(1.,2.)) -.5);		// squeze them in y (make twice the amount) 
        d = length((fract(uv*a.x*vec2(1.,2.)) -.5)/ vec2(1.,2.));		// make round again
        d = length(offset2);
        
        
        float maskDropDirection = S(-.1,.1, st.y-p1.y);		// mask for drops above the current p1
        float mask2 = S(.07, .06, d);
        mask2 = S(.2*(.5-st.y), .0, d);	// fuzzy, distance applied
        mask2 *= maskDropDirection;		// mask applied on drops
        
        //if (st.x > .48|| st.y > 0.49 ) { mask1 = 1.;}		// show grid
        
        // strength, makes uv mask scaled + makes ofsett different for each pixel
        float sm1 = 30.;
        float sm2 = 20.;
        
        // make drops
        vec2 drops = vec2(mask1*offset1*sm1);	
        //drops += vec2(mask2*offset2*sm2);
        
        return vec2(drops);
      }