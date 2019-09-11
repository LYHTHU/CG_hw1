#version 300 es
precision highp float;

uniform float uTime;   // TIME, IN SECONDS
in vec3 vPos;     // -1 < vPos.x < +1
// -1 < vPos.y < +1
//      vPos.z == 0

out vec4 fragColor; 
 
void main() {

  // HERE YOU CAN WRITE ANY CODE TO
  // DEFINE A COLOR FOR THIS FRAGMENT
  float x = cos(uTime)*vPos.x;
  float y = sin(uTime)*vPos.y;
  float y2 = cos(uTime)*vPos.y;
  float t = x*vPos.x + y*vPos.y;

  float red = max(0., cos((vPos.y)*t*sqrt(uTime)));
  float green = max(0., x-y);
  float blue = max(0., y2);

  // R,G,B EACH RANGE FROM 0.0 TO 1.0  
  vec3 color = vec3(red, green, blue);
    
  // THIS LINE OUTPUTS THE FRAGMENT COLOR
  fragColor = vec4(sqrt(color), 1.0);
}