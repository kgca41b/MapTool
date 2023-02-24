#include "include/MeshCommon.hlsli"

cbuffer cb_data : register(b1)
{
    matrix world_matrix;
};

struct VS_IN
{
	float3 p : F3_POSITION;
	float3 n : F3_NORMAL;
	float4 c : F4_COLOR;
	float2 t : F2_TEXTURE;
};
struct VS_OUT
{
	float4 p : SV_POSITION;
	float4 n : NORMAL;
	float4 c : COLOR;
	float2 t : TEXCOORD;
};

VS_OUT VS(VS_IN input)
{
	VS_OUT output = (VS_OUT)0;

	matrix view_proj = mul(view_matrix, projection_matrix);
	float4 position = float4(input.p, 1.0f);
	float4 projection = mul(position, view_proj);

	output.p = projection;
	output.n = float4(input.n, 0);
	output.c = float4(1, 1, 1, 1);
	output.t = input.t;

	return output;
}