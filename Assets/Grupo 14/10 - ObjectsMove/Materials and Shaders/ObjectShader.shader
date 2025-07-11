// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ObjectShader"
{
	Properties
	{
		_Speed("Speed", Range( 0 , 5)) = 1
		_Frecuency("Frecuency", Range( 1 , 3)) = 2
		_Height("Height", Range( 0 , 1)) = 0.55
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			half filler;
		};

		uniform float _Speed;
		uniform float _Frecuency;
		uniform float _Height;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 objToWorld1 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
			float4 transform2 = mul(unity_WorldToObject,float4( objToWorld1 , 0.0 ));
			float mulTime6 = _Time.y * _Speed;
			float temp_output_10_0 = sin( ( ( distance( float4( float3(0,0,0) , 0.0 ) , transform2 ) + mulTime6 ) * _Frecuency ) );
			float3 temp_output_15_0 = ( temp_output_10_0 * float3(0,1,0) * _Height );
			v.vertex.xyz += temp_output_15_0;
			v.vertex.w = 1;
			v.normal = temp_output_15_0;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color12 = IsGammaSpace() ? float4(0.06587124,1,0,0) : float4(0.005517841,1,0,0);
			float4 color13 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float3 objToWorld1 = mul( unity_ObjectToWorld, float4( float3( 0,0,0 ), 1 ) ).xyz;
			float4 transform2 = mul(unity_WorldToObject,float4( objToWorld1 , 0.0 ));
			float mulTime6 = _Time.y * _Speed;
			float temp_output_10_0 = sin( ( ( distance( float4( float3(0,0,0) , 0.0 ) , transform2 ) + mulTime6 ) * _Frecuency ) );
			float4 lerpResult14 = lerp( color12 , color13 , (0.0 + (temp_output_10_0 - 0.0) * (1.0 - 0.0) / (1.0 - 0.0)));
			o.Albedo = lerpResult14.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
192;81;1101;760;1299.24;806.6196;2.094432;False;False
Node;AmplifyShaderEditor.TransformPositionNode;1;-975.7633,88.25408;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;7;-793.0155,290.1115;Inherit;False;Property;_Speed;Speed;0;0;Create;True;0;0;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;3;-707.0178,-76.57632;Inherit;False;Constant;_Epic;Epic;0;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldToObjectTransfNode;2;-735.6843,93.03168;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;6;-486.0506,243.529;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;4;-480.0784,64.36562;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-312.8587,119.3091;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-350.4056,326.1567;Inherit;False;Property;_Frecuency;Frecuency;1;0;Create;True;0;0;0;False;0;False;2;0;1;3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-84.22715,120.6509;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;10;83.77214,118.3085;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;16;90.09126,242.215;Inherit;False;Constant;_DEF;DEF;2;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;12;64.06093,-461.4839;Inherit;False;Constant;_Color0;Color 0;2;0;Create;True;0;0;0;False;0;False;0.06587124,1,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;13;52.29818,-264.9609;Inherit;False;Constant;_Color2;Color2;2;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;17;51.23645,448.447;Inherit;False;Property;_Height;Height;2;0;Create;True;0;0;0;False;0;False;0.55;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;11;276.4457,12.62277;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;14;356.1005,-343.6027;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;374.0338,215.3153;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;689.2321,-85.65623;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ObjectShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;1;0
WireConnection;6;0;7;0
WireConnection;4;0;3;0
WireConnection;4;1;2;0
WireConnection;5;0;4;0
WireConnection;5;1;6;0
WireConnection;8;0;5;0
WireConnection;8;1;9;0
WireConnection;10;0;8;0
WireConnection;11;0;10;0
WireConnection;14;0;12;0
WireConnection;14;1;13;0
WireConnection;14;2;11;0
WireConnection;15;0;10;0
WireConnection;15;1;16;0
WireConnection;15;2;17;0
WireConnection;0;0;14;0
WireConnection;0;11;15;0
WireConnection;0;12;15;0
ASEEND*/
//CHKSM=AF016A1FFA642E2A63B3A4E0CCE3E6268C403874