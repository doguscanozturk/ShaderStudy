Shader "Dozturk/IlluminationModels"
{
    Properties
    {
        _myDiffuse ("Diffuse Texture", 2D) = "white" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myDiffuse;

        struct Input
        {
            float3 worldRefl;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = IN.worldRefl;
         //   o.Albedo = o.Normal;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
