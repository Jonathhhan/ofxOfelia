precision highp float;

uniform sampler2D spectrum;
uniform sampler2D image;
uniform float time;
uniform vec2 resolution;

varying vec2 texCoordVarying;

float squared(float value) { return value * value; }

float getAmp(float frequency) { return texture2D(spectrum, vec2(frequency / 256.0, 0)).x; }

float getWeight(float f) {
    return (+ getAmp(f-2.0) + getAmp(f-1.0) + getAmp(f+2.0) + getAmp(f+1.0) + getAmp(f)) / 5.0; }

void main() {    
  vec2 uvTrue = gl_FragCoord.xy / resolution.xy;
  vec2 uv = -1.0 + 2.0 * uvTrue;
  float lineIntensity;
  float glowWidth;
  vec3 color = vec3(0.0);
  for(float i = 0.0; i < 5.0; ++i) {
    uv.y += (0.3 * sin(uv.y + i - 5.0 - time * 0.0));
    float Y = uv.y + getWeight((i) * 20.0) * (texture2D(spectrum, vec2(uvTrue.x, 1)).x - 0.5);
    lineIntensity = 0.5 + squared(0.6 * abs(mod(uvTrue.x + i / 4.3 + time,2.0) - 1.0));
    glowWidth = abs(lineIntensity / (150.0 * Y));
    color += vec3(glowWidth * (1.5 + sin(time * 0.13)), glowWidth * (1.5 - sin(time * 0.23)), glowWidth * (1.5 - cos(time * 0.19)));
    }    
  vec2 texelSize = (1.0,1.0) / resolution;
  vec2 uv2 = gl_FragCoord.xy * texelSize;
  gl_FragColor = mix(vec4(color, 0.7), texture2D(image, uv2), 0.5);
  }
