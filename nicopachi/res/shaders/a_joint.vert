
attribute vec4 a_position;

#if defined(LIGHTING)
attribute vec3 a_normal;
#endif

attribute vec2 a_textCoord;

#if defined(SKINNING)
attribute vec4 a_blendWeights;
attribute vec4 a_blendIndices;
#endif


uniform mat4 u_worldViewProjectionMatrix;
#if defined(SKINNING)
uniform vec4 u_matrixPalette[SKINNING_JOINT_COUNT * 3];
#endif



vec4 getPosition() {
    return a_position;
}

varying vec3 v_a3;

void main() {
    vec4 position = getPosition();
    gl_Position = u_worldViewProjectionMatrix * position;

    v_a3 = vec3(a_blendWeights.x, u_matrixPalette[0].x, 0.0);
}


