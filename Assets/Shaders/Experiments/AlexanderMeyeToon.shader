Shader "DozturkExperiement/AlexanderMeyeToon" {
	Properties 
	{
		_Color  ("Color", Color) = (1,1,1,1)
		_Steps ("Steps", Color) = (1,1,1,1)
	}
	
	SubShader 
	{
		
		CGPROGRAM
		#pragma surface surf MyToon

		#include "UnityCG.cginc"

		float4 _Color;
		sampler2D _RampTex;
		float4 _Steps;
		
		float4 LightingMyToon (SurfaceOutput s, fixed3 lightDir, fixed atten)
		{
		    float4 postirizeOut;
		    float lightIntensity = posterize(saturate(dot(s.Normal, lightDir)),_Steps, postirizeOut);
			float4 color;
		    color.rgb = s.Albedo * lightIntensity;
		    color.a = s.Alpha;
			return color;
		}

		struct Input 
		{
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) 
		{			
			o.Albedo = _Color.rgb;
		}
		
		ENDCG
	} 
	
	FallBack "Diffuse"

}
