// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "WaterShader"
{
	Properties
	{
		_EdgeLength ( "Edge length", Range( 2, 50 ) ) = 2
		_Center("Center", Vector) = (0,0,-50,0)
		_Scale("Scale", Range( 3 , 15)) = 15
		_Height("Height", Range( 0 , 0.4)) = 0.4
		_Frecuency("Frecuency", Range( 1 , 10)) = 3
		_Speed("Speed", Range( 0 , 5)) = 5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
			float2 uv_texcoord;
		};

		uniform float3 _Center;
		uniform float _Frecuency;
		uniform float _Speed;
		uniform float _Height;
		uniform float _Scale;
		uniform float _EdgeLength;


		float2 voronoihash2( float2 p )
		{
			
			p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
			return frac( sin( p ) *43758.5453);
		}


		float voronoi2( float2 v, float time, inout float2 id, inout float2 mr, float smoothness )
		{
			float2 n = floor( v );
			float2 f = frac( v );
			float F1 = 8.0;
			float F2 = 8.0; float2 mg = 0;
			for ( int j = -1; j <= 1; j++ )
			{
				for ( int i = -1; i <= 1; i++ )
			 	{
			 		float2 g = float2( i, j );
			 		float2 o = voronoihash2( n + g );
					o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
					float d = 0.5 * dot( r, r );
			 		if( d<F1 ) {
			 			F2 = F1;
			 			F1 = d; mg = g; mr = r; id = o;
			 		} else if( d<F2 ) {
			 			F2 = d;
			 		}
			 	}
			}
			return F1;
		}


		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			return UnityEdgeLengthBasedTess (v0.vertex, v1.vertex, v2.vertex, _EdgeLength);
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float temp_output_9_0 = distance( ase_worldPos , _Center );
			float mulTime14 = _Time.y * _Speed;
			float smoothstepResult16 = smoothstep( 0.0 , 5.0 , temp_output_9_0);
			float temp_output_19_0 = ( sin( ( ( temp_output_9_0 * _Frecuency ) - mulTime14 ) ) * ( 1.0 - smoothstepResult16 ) );
			v.vertex.xyz += ( temp_output_19_0 * float3(0,1,0) * _Height );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color4 = IsGammaSpace() ? float4(0,1,0.9534545,0) : float4(0,1,0.8973653,0);
			float time2 = _Time.y;
			float2 coords2 = i.uv_texcoord * _Scale;
			float2 id2 = 0;
			float2 uv2 = 0;
			float voroi2 = voronoi2( coords2, time2, id2, uv2, 0 );
			float4 Path6 = ( color4 + voroi2 );
			float4 color21 = IsGammaSpace() ? float4(0.4575472,1,0.9744728,1) : float4(0.1768298,1,0.9429092,1);
			float3 ase_worldPos = i.worldPos;
			float temp_output_9_0 = distance( ase_worldPos , _Center );
			float mulTime14 = _Time.y * _Speed;
			float smoothstepResult16 = smoothstep( 0.0 , 5.0 , temp_output_9_0);
			float temp_output_19_0 = ( sin( ( ( temp_output_9_0 * _Frecuency ) - mulTime14 ) ) * ( 1.0 - smoothstepResult16 ) );
			float4 lerpResult23 = lerp( Path6 , color21 , (0.0 + (temp_output_19_0 - 0.0) * (1.0 - 0.0) / (1.0 - 0.0)));
			o.Albedo = lerpResult23.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
192;81;1101;760;1566.716;151.9746;1;True;False
Node;AmplifyShaderEditor.WorldPosInputsNode;8;-1328.529,15.75019;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;10;-1309.529,186.7503;Inherit;False;Property;_Center;Center;5;0;Create;True;0;0;0;False;0;False;0,0,-50;0,0,-50;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;12;-893.4289,19.54965;Inherit;False;Property;_Frecuency;Frecuency;8;0;Create;True;0;0;0;False;0;False;3;10;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-924.5278,211.4496;Inherit;False;Property;_Speed;Speed;9;0;Create;True;0;0;0;False;0;False;5;3;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;9;-1081.528,110.7502;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;7;-951.1658,-641.0355;Inherit;False;1026.997;422.4805;Water;6;1;2;3;4;5;6;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleTimeNode;1;-841.9665,-459.8351;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-616.0286,112.6498;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-901.166,-335.0351;Inherit;False;Property;_Scale;Scale;6;0;Create;True;0;0;0;False;0;False;15;0;3;15;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;14;-641.7282,215.2499;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;13;-445.0282,116.4497;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4;-563.5664,-591.0355;Inherit;False;Constant;_Base;Base;1;0;Create;True;0;0;0;False;0;False;0,1,0.9534545,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VoronoiNode;2;-557.1638,-375.0349;Inherit;False;0;0;1;0;1;False;1;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.SmoothstepOpNode;16;-902.027,340.6495;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-318.7663,-400.6354;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;17;-527.7274,340.6496;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;18;-267.4276,116.4495;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;6;-163.5692,-399.0352;Inherit;False;Path;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-130.6259,120.2494;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;27;125.8885,306.9749;Inherit;False;Constant;_DEF;DEF;6;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ColorNode;21;139.1744,-130.5513;Inherit;False;Constant;_Color0;Color 0;1;0;Create;True;0;0;0;False;0;False;0.4575472,1,0.9744728,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;22;312.0746,-233.1507;Inherit;False;6;Path;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;20;146.7737,67.04939;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;40.77058,471.8425;Inherit;False;Property;_Height;Height;7;0;Create;True;0;0;0;False;0;False;0.4;0.46;0;0.4;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;384.2747,276.0493;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;23;500.1743,-77.35098;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;699.1997,-77.90001;Float;False;True;-1;6;ASEMaterialInspector;0;0;Standard;WaterShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;2;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;0;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;9;0;8;0
WireConnection;9;1;10;0
WireConnection;11;0;9;0
WireConnection;11;1;12;0
WireConnection;14;0;15;0
WireConnection;13;0;11;0
WireConnection;13;1;14;0
WireConnection;2;1;1;0
WireConnection;2;2;3;0
WireConnection;16;0;9;0
WireConnection;5;0;4;0
WireConnection;5;1;2;0
WireConnection;17;0;16;0
WireConnection;18;0;13;0
WireConnection;6;0;5;0
WireConnection;19;0;18;0
WireConnection;19;1;17;0
WireConnection;20;0;19;0
WireConnection;24;0;19;0
WireConnection;24;1;27;0
WireConnection;24;2;26;0
WireConnection;23;0;22;0
WireConnection;23;1;21;0
WireConnection;23;2;20;0
WireConnection;0;0;23;0
WireConnection;0;11;24;0
ASEEND*/
//CHKSM=640AE0DD9C7518894D23D4E74665940ED7A59312