// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RenderTexture"
{
	Properties
	{
		_EdgeLength ( "Edge length", Range( 2, 50 ) ) = 15
		_Distance("Distance", Range( 1 , 4)) = 2
		_Height("Height", Range( 0 , 0.5)) = 0.14
		_Center("Center", Vector) = (0,0,0,0)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float3 worldPos;
		};

		uniform float3 _Center;
		uniform float _Distance;
		uniform float _Height;
		uniform float _EdgeLength;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			return UnityEdgeLengthBasedTess (v0.vertex, v1.vertex, v2.vertex, _EdgeLength);
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float temp_output_8_0 = sin( ( ( distance( ase_worldPos , _Center ) + _Time.y ) * _Distance ) );
			float3 temp_output_13_0 = ( temp_output_8_0 * float3(0,4,0) * _Height );
			v.vertex.xyz += temp_output_13_0;
			v.vertex.w = 1;
			v.normal = temp_output_13_0;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color9 = IsGammaSpace() ? float4(0,0.9102712,1,0) : float4(0,0.8078905,1,0);
			float4 color10 = IsGammaSpace() ? float4(0.1415094,0.1415094,0.1415094,0) : float4(0.0177139,0.0177139,0.0177139,0);
			float3 ase_worldPos = i.worldPos;
			float temp_output_8_0 = sin( ( ( distance( ase_worldPos , _Center ) + _Time.y ) * _Distance ) );
			float4 lerpResult11 = lerp( color9 , color10 , (0.0 + (temp_output_8_0 - 0.0) * (1.0 - 0.0) / (1.0 - 0.0)));
			o.Albedo = lerpResult11.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
239;81;1380;760;1096.878;116.7501;1;True;False
Node;AmplifyShaderEditor.WorldPosInputsNode;1;-1133.667,70.87407;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;3;-1113.387,305.5253;Inherit;False;Property;_Center;Center;7;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DistanceOpNode;2;-864.2517,205.5811;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;5;-859.9072,340.2886;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4;-687.5391,204.1327;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-797.6229,443.1294;Inherit;False;Property;_Distance;Distance;5;0;Create;True;0;0;0;False;0;False;2;0;1;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-502.135,204.1327;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;8;-339.9075,205.581;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-646.982,-214.4736;Inherit;False;Constant;_Color0;Color 0;2;0;Create;True;0;0;0;False;0;False;0,0.9102712,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;10;-655.673,-34.86397;Inherit;False;Constant;_Color2;Color 2;2;0;Create;True;0;0;0;False;0;False;0.1415094,0.1415094,0.1415094,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;12;-186.3693,8.589869;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;14;-312.3859,320.0096;Inherit;False;Constant;_Vector;Vector;2;0;Create;True;0;0;0;False;0;False;0,4,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;15;-355.8398,499.6193;Inherit;False;Property;_Height;Height;6;0;Create;True;0;0;0;False;0;False;0.14;1;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;11;-134.2247,-139.1535;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-44.41981,269.3137;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;370.8069,10.13925;Float;False;True;-1;6;ASEMaterialInspector;0;0;Standard;RenderTexture;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;0;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;1;0
WireConnection;2;1;3;0
WireConnection;4;0;2;0
WireConnection;4;1;5;0
WireConnection;6;0;4;0
WireConnection;6;1;7;0
WireConnection;8;0;6;0
WireConnection;12;0;8;0
WireConnection;11;0;9;0
WireConnection;11;1;10;0
WireConnection;11;2;12;0
WireConnection;13;0;8;0
WireConnection;13;1;14;0
WireConnection;13;2;15;0
WireConnection;0;0;11;0
WireConnection;0;11;13;0
WireConnection;0;12;13;0
ASEEND*/
//CHKSM=ACDCFF36113026CCAB34812131370A98CA9F6815