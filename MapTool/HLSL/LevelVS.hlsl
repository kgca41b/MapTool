#include "include/VertexCommon.hlsli"

struct VS_IN
{
    float3 p : F3_POSITION;
    float2 t : F2_TEXTURE;
};

struct VS_OUT
{
    float4 p : SV_POSITION;  
    float2 t : TEXCOORD;
    float lod : TEXCOORD1;
};

VS_OUT VS(VS_IN input)
{
    VS_OUT output = (VS_OUT) 0;
    
    float4 local = float4(input.p, 1.0f);    
    float4 world = mul(local, IdentityMatrix());
    float4 projection = mul(world, ViewProjection());

    output.p = projection;
    output.t = input.t;
    output.lod = GetLod(input.p);

    return output;
}