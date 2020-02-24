Shader "Dozturk/BumpedEnvironmentChallenge" 
{
    Properties {
        _myNormalMap ("Normal Map", 2D) = "bump" {}
        _myNormalMapMultiplier ("Normal Map Multiplier", Range(0,10)) = 0.3
        _myCube ("Cube Map  ", CUBE) = "white" {}
    }
    
    SubShader 
    {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _myNormalMap;
        half _myNormalMapMultiplier;
        samplerCUBE _myCube;

        struct Input {
            float2 uv_myBump;
            float3 worldRefl; INTERNAL_DATA
        };
        
        void surf (Input IN, inout SurfaceOutput o) 
        {
             o.Normal = UnpackNormal(tex2D(_myNormalMap, IN.uv_myBump)) * _myNormalMapMultiplier;
             o.Albedo = texCUBE (_myCube, WorldReflectionVector (IN, o.Normal)).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
