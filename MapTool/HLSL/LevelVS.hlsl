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
	float3 n : NORMAL;
	float4 c : COLOR0;
	float2 t : TEXCOORD0;
	float4 circle_color : TEXCOORD1;
};

cbuffer cb_data : register(b0)
{
	matrix g_matWorld;
};

cbuffer cb_viewproj : register(b1)
{
	matrix g_matView;
	matrix g_matProj;
}

cbuffer cb_hitcircle : register(b2)
{
	bool   is_hit;
	float  circle_radius;
	float4 hitpoint;
	float4 circle_color;
}

VS_OUT VS(VS_IN input)
{
	VS_OUT output = (VS_OUT)0;
	float4 vLocal = float4(input.p, 1.0f);

	float4 vWorld = mul(vLocal, g_matWorld);
	float4 vView = mul(vWorld, g_matView);
	float4 vProj = mul(vView, g_matProj);

	output.p = vProj;
	output.n = input.n;
	output.c = input.c;
	output.t = input.t;

	output.circle_color = float4(1, 1, 1, 1);

	if (is_hit)
	{
		float length_from_point = length((vLocal - hitpoint));
		if (length_from_point < circle_radius)
		{
			output.circle_color = circle_color;
		}
	}

	return output;
}