Shader "Holistic/CutoffWithDiffuse" {
    Properties {
        _DiffuseTex("DiffuseTex", 2D) = "diffuse" {}
        _StripeWidth ("StripeWidth", Range(1,20)) = 10

    }
    SubShader {
      CGPROGRAM
      #pragma surface surf Lambert
      struct Input {
          float3 viewDir;
          float3 worldPos;
          float2 uv_MainTex;

      };

        sampler2D _DiffuseTex;
        float _StripeWidth;

      void surf (Input IN, inout SurfaceOutput o) {
          half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
          o.Emission = frac(IN.worldPos.y*(20 - _StripeWidth) * 0.5) > 0.4 ? 
                          float3(0,1,0)*rim: float3(1,0,0)*rim;
                          
          o.Albedo = tex2D(_DiffuseTex, IN.uv_MainTex);
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }