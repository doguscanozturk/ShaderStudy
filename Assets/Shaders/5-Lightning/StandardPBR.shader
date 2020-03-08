Shader "Dozturk/StandardPBR" {
Properties{
		_Color("Color", Color) = (1,1,1,1)
        _MetallicTex ("Metallic (R)", 2D) = "white" {}
        _Metallic("Metallic", Range(0.0, 1.0)) = 0.0
        _Emissiveness("Emissiveness", Range(0.0, 1.0)) = 0
	}
	SubShader
	{
		Tags{
			"Queue" = "Geometry"
		}

		CGPROGRAM
		#pragma surface surf Standard

        sampler2D _MetallicTex;
        half _Metallic;
        fixed4 _Color;
        half _Emissiveness;

		struct Input {
			float2 uv_MetallicTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o) {
            o.Albedo = _Color.rgb;
            float4 metallicTex = tex2D (_MetallicTex, IN.uv_MetallicTex);
            o.Smoothness = metallicTex.r;
            o.Metallic = _Metallic;
            o.Emission = metallicTex * _Emissiveness;
		}
		ENDCG
	}
	FallBack "Diffuse"

}
