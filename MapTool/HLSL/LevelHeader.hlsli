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
	float3 o : POSITION;
	float3 n : NORMAL;
	float4 c : COLOR;
	float2 t : TEXCOORD0;

	float1 strength : TEXCOORD1;
	float4 circle : TEXCOORD2;
};

struct GS_IN
{
	float4 p : SV_POSITION;
	float3 o : POSITION;
	float3 n : NORMAL;
	float4 c : COLOR;
	float2 t : TEXCOORD;
};