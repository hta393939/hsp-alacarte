// @file sparkler.frag

#if defined(OPENGL_ES) || defined(GL_ES)
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#endif


#ifdef TEXPARTICLE
uniform sampler2D u_diffuseTexture;
#else
uniform vec4 u_diffuseColor;
uniform float u_coeff;
#endif

varying vec2 v_texCoord;

void main() {


#ifdef TEXPARTICLE
//	gl_FragColor = texture2D(u_diffuseTexture, v_texCoord);


	vec4 col = texture2D(u_diffuseTexture, v_texCoord);
	gl_FragColor.a = col.r;
	gl_FragColor.rgb = vec3(1.0, 1.0, 0.0);
#else
	float rr = length(v_texCoord - 0.5) * 2.0;
	float lv = clamp((1.0 - rr) * u_coeff, 0.0, 1.0);
	gl_FragColor.rgb = u_diffuseColor.rgb;
	gl_FragColor.a = lv;
#endif


}
