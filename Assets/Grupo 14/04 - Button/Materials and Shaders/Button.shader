// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Button"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Color) = (1,1,1,1)
		
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255

		_ColorMask ("Color Mask", Float) = 15

		[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
		_Frecuency("Frecuency", Range( 0 , 1)) = 0.1
		_Angle("Angle", Range( 0 , 90)) = 20
		_GlowColor("GlowColor", Color) = (0.990566,0.990566,0.990566,1)
		_Glow("Glow", Range( 0 , 8)) = 1.3
		_Base("Base", Color) = (0.5660378,0.5660378,0.5660378,1)

	}

	SubShader
	{
		LOD 0

		Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="True" }
		
		Stencil
		{
			Ref [_Stencil]
			ReadMask [_StencilReadMask]
			WriteMask [_StencilWriteMask]
			CompFront [_StencilComp]
			PassFront [_StencilOp]
			FailFront Keep
			ZFailFront Keep
			CompBack Always
			PassBack Keep
			FailBack Keep
			ZFailBack Keep
		}


		Cull Off
		Lighting Off
		ZWrite Off
		ZTest [unity_GUIZTestMode]
		Blend SrcAlpha OneMinusSrcAlpha
		ColorMask [_ColorMask]

		
		Pass
		{
			Name "Default"
		CGPROGRAM
			
			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0

			#include "UnityCG.cginc"
			#include "UnityUI.cginc"

			#pragma multi_compile __ UNITY_UI_CLIP_RECT
			#pragma multi_compile __ UNITY_UI_ALPHACLIP
			
			#include "UnityShaderVariables.cginc"

			
			struct appdata_t
			{
				float4 vertex   : POSITION;
				float4 color    : COLOR;
				float2 texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};

			struct v2f
			{
				float4 vertex   : SV_POSITION;
				fixed4 color    : COLOR;
				half2 texcoord  : TEXCOORD0;
				float4 worldPosition : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				
			};
			
			uniform fixed4 _Color;
			uniform fixed4 _TextureSampleAdd;
			uniform float4 _ClipRect;
			uniform sampler2D _MainTex;
			uniform float4 _Base;
			uniform float4 _GlowColor;
			uniform float _Angle;
			uniform float _Frecuency;
			uniform float _Glow;

			
			v2f vert( appdata_t IN  )
			{
				v2f OUT;
				UNITY_SETUP_INSTANCE_ID( IN );
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(OUT);
				UNITY_TRANSFER_INSTANCE_ID(IN, OUT);
				OUT.worldPosition = IN.vertex;
				
				
				OUT.worldPosition.xyz +=  float3( 0, 0, 0 ) ;
				OUT.vertex = UnityObjectToClipPos(OUT.worldPosition);

				OUT.texcoord = IN.texcoord;
				
				OUT.color = IN.color * _Color;
				return OUT;
			}

			fixed4 frag(v2f IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				float2 break11 = IN.texcoord.xy;
				float temp_output_13_0 = radians( _Angle );
				float HorizontalP19 = ( ( break11.x * cos( temp_output_13_0 ) ) + ( break11.y * sin( temp_output_13_0 ) ) );
				float Glow25 = pow( ( 1.0 - ( abs( ( frac( ( HorizontalP19 + ( _Time.y * _Frecuency ) ) ) - 0.5 ) ) * 2.0 ) ) , _Glow );
				float4 lerpResult27 = lerp( _Base , _GlowColor , Glow25);
				
				half4 color = lerpResult27;
				
				#ifdef UNITY_UI_CLIP_RECT
                color.a *= UnityGet2DClipping(IN.worldPosition.xy, _ClipRect);
                #endif
				
				#ifdef UNITY_UI_ALPHACLIP
				clip (color.a - 0.001);
				#endif

				return color;
			}
		ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18900
237;81;1382;760;2382.03;496.8499;1.971711;True;False
Node;AmplifyShaderEditor.CommentaryNode;22;-1388.411,337.0497;Inherit;False;1467.384;382.5251;Proyection;10;10;11;12;13;14;15;16;17;18;19;;1,0.9521772,0.6367924,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1338.411,543.2567;Inherit;False;Property;_Angle;Angle;1;0;Create;True;0;0;0;False;0;False;20;0;0;90;0;1;FLOAT;0
Node;AmplifyShaderEditor.RadiansOpNode;13;-1022.322,545.0939;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;10;-1211.262,400.0497;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CosOpNode;14;-833.0359,526.7166;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;11;-899.1922,387.0497;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SinOpNode;15;-827.5227,609.4148;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-557.377,502.8262;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-559.2144,392.5629;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;30;-1903.684,-331.9246;Inherit;False;2061.444;514.5803;Glow;13;5;3;4;1;6;7;8;9;20;21;24;23;25;;1,0.8534628,0,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;18;-333.1736,434.8306;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;3;-1726.977,-34.91251;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-1853.684,67.49591;Inherit;False;Property;_Frecuency;Frecuency;0;0;Create;True;0;0;0;False;0;False;0.1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;19;-160.4279,431.1551;Inherit;False;HorizontalP;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-1544.723,-33.17673;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1;-1717.34,-281.9244;Inherit;True;19;HorizontalP;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6;-1306.322,-81.27581;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;7;-1127.322,-80.27581;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;8;-971.3221,-81.27581;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;9;-793.3221,-81.27581;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-671.1042,-81.25851;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;21;-519.7213,-81.31401;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;24;-693.6967,39.59681;Inherit;False;Property;_Glow;Glow;3;0;Create;True;0;0;0;False;0;False;1.3;1.3;0;8;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;23;-351.9103,-79.65379;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;-81.63942,-84.27897;Inherit;False;Glow;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;28;230.5735,392.22;Inherit;False;Property;_GlowColor;GlowColor;2;0;Create;True;0;0;0;False;0;False;0.990566,0.990566,0.990566,1;0.990566,0.990566,0.990566,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;29;263.8661,602.4876;Inherit;False;25;Glow;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;26;232.3257,201.2264;Inherit;False;Property;_Base;Base;4;0;Create;True;0;0;0;False;0;False;0.5660378,0.5660378,0.5660378,1;0.5660378,0.5660378,0.5660378,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;27;528.4531,346.6618;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;31;707.3137,346.541;Float;False;True;-1;2;ASEMaterialInspector;0;4;Button;5056123faa0c79b47ab6ad7e8bf059a4;True;Default;0;0;Default;2;False;True;2;5;False;-1;10;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;True;True;True;True;True;0;True;-9;False;False;False;False;False;False;False;True;True;0;True;-5;255;True;-8;255;True;-7;0;True;-4;0;True;-6;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;-1;True;0;True;-11;False;True;5;Queue=Transparent=Queue=0;IgnoreProjector=True;RenderType=Transparent=RenderType;PreviewType=Plane;CanUseSpriteAtlas=True;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;0;;0;0;Standard;0;0;1;True;False;;False;0
WireConnection;13;0;12;0
WireConnection;14;0;13;0
WireConnection;11;0;10;0
WireConnection;15;0;13;0
WireConnection;17;0;11;1
WireConnection;17;1;15;0
WireConnection;16;0;11;0
WireConnection;16;1;14;0
WireConnection;18;0;16;0
WireConnection;18;1;17;0
WireConnection;19;0;18;0
WireConnection;4;0;3;0
WireConnection;4;1;5;0
WireConnection;6;0;1;0
WireConnection;6;1;4;0
WireConnection;7;0;6;0
WireConnection;8;0;7;0
WireConnection;9;0;8;0
WireConnection;20;0;9;0
WireConnection;21;0;20;0
WireConnection;23;0;21;0
WireConnection;23;1;24;0
WireConnection;25;0;23;0
WireConnection;27;0;26;0
WireConnection;27;1;28;0
WireConnection;27;2;29;0
WireConnection;31;0;27;0
ASEEND*/
//CHKSM=097AE896458EEE6BE3261D661D8A56F42D015E72