#if defined(OPENGL_ES) || defined(GL_ES)
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#endif

uniform vec3 u_ambientColor;
uniform vec4 u_diffuseColor;

varying vec3 v_a3;

void main() {
    gl_FragColor = vec4(1.0, v_a3.x, v_a3.y, 1.0);
}


