#version 140

// orbital_shell.vs

uniform mat4 WorldTransform;
uniform mat4 WorldViewProjTransform;

in vec3 a_Position;

out vec3 v_Normal;
out vec3 v_Position;
out vec3 v_Position_ObjectSpace;

void main() 
{
    gl_Position = WorldViewProjTransform * vec4(a_Position, 0.99);
    v_Normal = (WorldTransform * vec4(normalize(a_Position), 0)).xyz;
    v_Normal = normalize(v_Normal);
    v_Position = (WorldTransform * vec4(a_Position,1)).xyz;
    v_Position_ObjectSpace = a_Position;
}
