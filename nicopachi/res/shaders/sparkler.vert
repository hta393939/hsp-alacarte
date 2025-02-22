// @file sparkler.vert

attribute vec4 a_position;
attribute vec3 a_normal;
attribute vec2 a_texCoord;

uniform mat4 u_worldMatrix;
uniform mat4 u_viewMatrix;
uniform mat4 u_projectionMatrix;

uniform vec4 u_matrixPalette[SKINNING_JOINT_COUNT * 3];

uniform float u_speed;
uniform float u_spread;
uniform float u_side;

varying vec2 v_texCoord;

// Need.
#include "skinning-none.vert"

#define PI 3.141592
#define PI2 (PI*2.0)

void main() {
	v_texCoord = a_texCoord;

	vec4 position = a_position;
	float id = position.z;

	vec4 sk = vec4(u_matrixPalette[0].w,
		u_matrixPalette[1].w,
		u_matrixPalette[2].w,
		1);

	float t = id * 4.1 + u_speed * sk.z;
	float index = floor(t);
	float topo = fract(t);

	float pitch = index * 17.0;
	float head = index * 8.0;
	float rad = u_spread * min(1.0, topo * 1.2);

	float rr = cos(pitch);

	float x = rr * cos(head);
	float y = rr * sin(head);
	float z = sin(pitch);

	vec4 oPos = vec4(rad*x, rad*y, rad*z, 1.0);
	vec4 wPos = u_worldMatrix * oPos;
	vec4 viewPos = u_viewMatrix * wPos;

// ÉJÉÅÉâç¿ïWånÇ≈ë´ÇµÇ±Çﬁ
#ifdef TEXPARTICLE
	float ang = id;
	viewPos.x += (cos(ang) * position.x - sin(ang) * position.y) * u_side * 0.5;
	viewPos.y += (sin(ang) * position.x + cos(ang) * position.y) * u_side * 0.5;
#else
	viewPos.xy += position.xy * u_side * 0.5;
#endif
	gl_Position = u_projectionMatrix * viewPos;
}
