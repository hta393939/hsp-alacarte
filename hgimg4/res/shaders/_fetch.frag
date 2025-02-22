varying vec3 v_pos;
void main() {
	float level = v_pos.z;
	gl_FragColor = vec4(0.5, level, 1.0, 1.0);
}
