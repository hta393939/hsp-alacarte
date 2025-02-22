attribute vec4 a_position;
uniform mat4 u_worldViewProjectionMatrix;
uniform vec4 u_coeff;
uniform sampler2D u_infotexture;
varying vec3 v_pos;
void main() {
	vec4 col = texelFetch(u_infotexture, ivec2(int(a_position.x), int(a_position.y)), 0);
	float z = (col.r * 77.0 + col.g * 150.0 + col.b * 29.0) / 256.0;
	vec3 pos = vec3(a_position.x * u_coeff.x, a_position.y * u_coeff.y, z);
	v_pos = pos;
	pos = pos * 2.0 - 1.0;
	pos.z = z;
	gl_Position = u_worldViewProjectionMatrix * vec4(pos, 1.0);
}
