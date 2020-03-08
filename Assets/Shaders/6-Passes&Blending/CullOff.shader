Shader "Dozturk/CullOff" {
Properties{
		_MainTex ("MainTex", 2D) = "white" {}
	}
	SubShader{
		Tags{
			"Queue" = "Transparent"
		}
    
        Blend SrcAlpha OneMinusSrcAlpha
        Cull Off
        
        Pass{
            SetTexture [_MainTex] { combine texture }
        }
		
	}
	FallBack "Diffuse"

}
