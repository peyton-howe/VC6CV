#version 100

attribute vec3 vPos;
attribute vec2 vTex;

varying vec2 uv;

vec3 Distort(vec3 p)
{
    vec3 v = p.xyz;
    float r = length(v);
    if (r > 0.0)
    {
        float theta = atan(p.y,p.x);
        r = r - 0.15*pow(r, 3.0) + 0.01*pow(r, 5.0);
        v.x = r * cos(theta);
        v.y = r * sin(theta);
    }
    return v;
}

void main()
{
    gl_Position = vec4(Distort(vPos), 1.0); //second value is zoom 
    uv = vTex;
}
