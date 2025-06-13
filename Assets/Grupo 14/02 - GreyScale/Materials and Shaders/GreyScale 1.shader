// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "GreyScale 1"
{
	Properties
	{
		_GrayscaleAmount("_GrayscaleAmount", Range( 0 , 1)) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			half filler;
		};

		uniform float _GrayscaleAmount;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color1 = IsGammaSpace() ? float4(0.1603774,0.1603774,0.1603774,0) : float4(0.02207366,0.02207366,0.02207366,0);
			float4 color2 = IsGammaSpace() ? float4(0.9858491,1,0.9879484,0) : float4(0.9681102,1,0.972803,0);
			float luminance3 = Luminance(color2.rgb);
			float4 temp_cast_1 = (luminance3).xxxx;
			float4 lerpResult5 = lerp( color1 , temp_cast_1 , _GrayscaleAmount);
			o.Albedo = lerpResult5.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
200;73;1203;636;1447.11;443.9704;1.847215;False;False
Node;AmplifyShaderEditor.ColorNode;2;-765.6816,49.32301;Inherit;False;Constant;_Final;Final;0;0;Create;True;0;0;0;False;0;False;0.9858491,1,0.9879484,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1;-758.9036,-171.0938;Inherit;False;Constant;_Base;Base;0;0;Create;True;0;0;0;False;0;False;0.1603774,0.1603774,0.1603774,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LuminanceNode;3;-526.7983,52.35386;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-799.4836,233.9088;Inherit;False;Property;_GrayscaleAmount;_GrayscaleAmount;0;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;5;-302.3317,4.106309;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-75.73578,5.541643;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;GreyScale 1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3;0;2;0
WireConnection;5;0;1;0
WireConnection;5;1;3;0
WireConnection;5;2;4;0
WireConnection;0;0;5;0
ASEEND*/
//CHKSM=04FAAEDFFC9193F90F4113EF9B220AE201209BCF