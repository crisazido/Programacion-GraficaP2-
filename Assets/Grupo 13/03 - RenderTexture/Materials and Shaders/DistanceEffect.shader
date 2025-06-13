// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DistanceEffect"
{
	Properties
	{
		_Frecuency("Frecuency", Float) = 4
		_Epicenter("Epicenter", Vector) = (-2,5,1,0)
		_Color0("Color 0", Color) = (0,0.6609852,1,1)
		_Color1("Color 1", Color) = (0.3137255,0.6982637,0.7803922,1)
		_Deformation("Deformation", Vector) = (0,5,0,0)
		_Height("Height", Float) = 0.15
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
			float3 worldPos;
		};

		uniform float3 _Epicenter;
		uniform float _Frecuency;
		uniform float3 _Deformation;
		uniform float _Height;
		uniform float4 _Color0;
		uniform float4 _Color1;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float temp_output_11_0 = sin( ( ( distance( ase_worldPos , _Epicenter ) + _Time.y ) * _Frecuency ) );
			float3 temp_output_17_0 = ( temp_output_11_0 * _Deformation * _Height );
			v.vertex.xyz += temp_output_17_0;
			v.vertex.w = 1;
			v.normal = temp_output_17_0;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float temp_output_11_0 = sin( ( ( distance( ase_worldPos , _Epicenter ) + _Time.y ) * _Frecuency ) );
			float4 lerpResult3 = lerp( _Color0 , _Color1 , (0.0 + (temp_output_11_0 - 0.0) * (1.0 - 0.0) / (1.0 - 0.0)));
			float4 smoothstepResult25 = smoothstep( float4( 0,0,0,0 ) , float4( 1,0,0,0 ) , lerpResult3);
			o.Albedo = smoothstepResult25.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
7.2;30.4;1521.6;757.4;1361.855;158.1491;1.3;True;False
Node;AmplifyShaderEditor.Vector3Node;6;-1180.004,482.9;Inherit;False;Property;_Epicenter;Epicenter;1;0;Create;True;0;0;0;False;0;False;-2,5,1;-2,5,1;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;4;-1201.603,286.1;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DistanceOpNode;7;-919.203,358.9001;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;10;-930.353,513.1683;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-715.2029,363.7001;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-722.7493,503.6285;Inherit;False;Property;_Frecuency;Frecuency;0;0;Create;True;0;0;0;False;0;False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-548.2361,361.9481;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;11;-386.6064,361.8055;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;14;-212.5633,297.0813;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;2;-457.8219,132.7527;Inherit;False;Property;_Color1;Color 1;3;0;Create;True;0;0;0;False;0;False;0.3137255,0.6982637,0.7803922,1;0.6396227,0.8452428,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;1;-459.4218,-97.64752;Inherit;False;Property;_Color0;Color 0;2;0;Create;True;0;0;0;False;0;False;0,0.6609852,1,1;0.138875,0.3499197,0.8867924,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;15;-431.5675,542.3017;Inherit;False;Property;_Deformation;Deformation;4;0;Create;True;0;0;0;False;0;False;0,5,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;3;8.577984,99.15279;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-404.6902,716.8916;Inherit;False;Property;_Height;Height;5;0;Create;True;0;0;0;False;0;False;0.15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;22;-133.24,787.5046;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;23;-111.4001,1000.705;Inherit;False;Constant;_Vector1;Vector 1;7;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;20;-647.0034,999.6639;Inherit;False;Property;_Vector0;Vector 0;6;0;Create;True;0;0;0;False;0;False;1,5,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-191.0898,514.4913;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SmoothstepOpNode;25;210.3635,102.2428;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DistanceOpNode;24;141.32,887.345;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;21;-410.9232,922.7056;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;19;-665.3329,828.6625;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;446.3687,92.62251;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;DistanceEffect;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;4;0
WireConnection;7;1;6;0
WireConnection;8;0;7;0
WireConnection;8;1;10;0
WireConnection;9;0;8;0
WireConnection;9;1;13;0
WireConnection;11;0;9;0
WireConnection;14;0;11;0
WireConnection;3;0;1;0
WireConnection;3;1;2;0
WireConnection;3;2;14;0
WireConnection;17;0;11;0
WireConnection;17;1;15;0
WireConnection;17;2;16;0
WireConnection;25;0;3;0
WireConnection;24;0;22;0
WireConnection;24;1;23;0
WireConnection;21;0;19;0
WireConnection;21;1;20;0
WireConnection;0;0;25;0
WireConnection;0;11;17;0
WireConnection;0;12;17;0
ASEEND*/
//CHKSM=F110A27A09CAF96E1535C515ED31A631515E4D3C