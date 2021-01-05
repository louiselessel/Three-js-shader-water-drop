      
      // fragment shader
      /*
      precision mediump float;
      uniform vec2 resolution;
      uniform float time;
      uniform vec2 dropPosition;

      // Draw a circle at vec2 `pos` with radius `rad` and color `color`.
      
      vec4 circle(vec2 uv, vec2 pos, float rad, vec3 color) {
        float d = (length(pos - uv) - rad);
        float t = clamp(d, 0.0, 1.0);
        return vec4(color, 1.0 - t);
      }
      float circle2(in vec2 _st, in float _radius){
        vec2 dist = _st-vec2(0.5);
        return 1.-smoothstep(_radius-(_radius*0.01), _radius+(_radius*0.01), dot(dist,dist)*4.0);
      }

      vec4 sphere(vec2 uv, vec2 pos, float size, float intensity, vec3 color){
        float ratio = (resolution.x/resolution.y); 
        uv.x *= ratio;
        pos.x *= ratio;
        vec2 dist = (pos.xy-uv.xy) * size;
        float flash = 1./dot(dist,dist);
        vec4 newcolor = vec4(color * flash * intensity, 1.);
        //vec4 newcolor = vec4(color * intensity, 1.);
        return vec4(newcolor);
      }
      
      vec3 test(vec2 uv) {
        return vec3(uv.x, uv.y, 0.);
      }

      void main() {
        // center the shader
        vec2 st = (gl_FragCoord.xy /resolution.xy - vec2(0.5));
        
        vec4 color = vec4(0.5);
        color.a = 1.0;

        // color the frame so we can see that it takes up the whole screen.
        if (st.x > 0.99) {color.rgb = vec3(0,0,1);}
        if (st.x < 0.01) {color.rgb = vec3(1,0,0);}
        if (st.y > 0.99) {color.rgb = vec3(0,0,1);}
        if (st.y < 0.01) {color.rgb = vec3(1,0,0);}

        // make cross
        if (st.x > 0.45 && st.x < 0.55) {color.rgb = vec3(1,1,1);}
        if (st.y > 0.45 && st.y < 0.55) {color.rgb = vec3(1,1,1);}
        
        // make moving cross
        float x = dropPosition.x;
        float y = dropPosition.y;
        if (st.x > x-0.05 && st.x < x+0.05) {color.rgb = vec3(1,0,0);}
        if (st.y > y-0.05 && st.y < y+0.05) {color.rgb = vec3(0,1,0);}


        //vec4 drop = circle(st, vec2(0.5,0.5), 0.1, vec3(0,1,0) );
        //vec4 drop = sphere(st, vec2(0.5,0.5), 0.0000000001, 0.0001, vec3(0,1,0));
        
        //vec4 drop = vec4(vec3( circle2( vec2(st.x - (1.-x), st.y - (1.-y)) ,.1) ) , 1.0);
        vec4 drop = vec4( vec3( circle2( vec2(st.x-x, st.y), 0.1) ), 1.0);
        
        //color = vec4(test(st),1.);
        color = color + drop;
        
        gl_FragColor = color;
        
      }
        */