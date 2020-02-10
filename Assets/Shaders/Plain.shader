// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Plain"
{
	Properties
	{
		_A_Cliff("A_Cliff", 2D) = "white" {}
		_A_Grass("A_Grass", 2D) = "white" {}
		_A_Sand("A_Sand", 2D) = "white" {}
		_AO("AO", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Lambert keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _A_Cliff;
		uniform half4 _A_Cliff_ST;
		uniform sampler2D _A_Grass;
		uniform half4 _A_Grass_ST;
		uniform sampler2D _A_Sand;
		uniform half4 _A_Sand_ST;
		uniform half _AO;

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 uv_A_Cliff = i.uv_texcoord * _A_Cliff_ST.xy + _A_Cliff_ST.zw;
			half temp_output_10_0 = ( i.vertexColor.g + i.vertexColor.b );
			half temp_output_15_0 = saturate( ( temp_output_10_0 * temp_output_10_0 * temp_output_10_0 ) );
			float2 uv_A_Grass = i.uv_texcoord * _A_Grass_ST.xy + _A_Grass_ST.zw;
			float2 uv_A_Sand = i.uv_texcoord * _A_Sand_ST.xy + _A_Sand_ST.zw;
			half4 temp_cast_0 = (( saturate( ( i.vertexColor.r * i.vertexColor.r ) ) * _AO )).xxxx;
			o.Albedo = ( ( ( ( ( tex2D( _A_Cliff, uv_A_Cliff ) * ( 1.0 - temp_output_15_0 ) ) + ( temp_output_15_0 * tex2D( _A_Grass, uv_A_Grass ) ) ) * ( 1.0 - i.vertexColor.b ) ) + ( i.vertexColor.b * tex2D( _A_Sand, uv_A_Sand ) ) ) - temp_cast_0 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17500
409;404;1176;455;-386.9159;-97.81648;1;True;True
Node;AmplifyShaderEditor.VertexColorNode;1;-804.0068,62.3777;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;10;-599.087,116.9883;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-476.7746,93.33607;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;15;-334.5171,94.41595;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;20;-145.0474,-10.04791;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;38;-369.3937,278.7871;Inherit;True;Property;_A_Grass;A_Grass;4;0;Create;True;0;0;False;0;-1;0c9f81ffe32191142accad6c3fd3b512;0c9f81ffe32191142accad6c3fd3b512;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;37;-475.0555,-382.3591;Inherit;True;Property;_A_Cliff;A_Cliff;3;0;Create;True;0;0;False;0;-1;64137b251652c4c459371e8f1b62b9bb;64137b251652c4c459371e8f1b62b9bb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;40;704.0223,194.2079;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;23;15.23988,281.7094;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-145.2752,176.8681;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;56.46021,-124.5432;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;262.5047,147.7202;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;39;-12.57385,549.3001;Inherit;True;Property;_A_Sand;A_Sand;5;0;Create;True;0;0;False;0;-1;b8343eb604bdf1a4b8741dee32283213;b8343eb604bdf1a4b8741dee32283213;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;22;250.6502,257.3974;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;925.4373,129.338;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;473.0254,146.5335;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;259.8861,424.4634;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;44;873.8086,371.8903;Inherit;False;Property;_AO;AO;6;0;Create;True;0;0;False;0;0;0.053;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;42;1070.297,233.7789;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;654.5887,401.5607;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;43;1244.004,262.2555;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;33;-320.7162,505.5365;Inherit;False;Property;_Grass;Grass;2;0;Create;True;0;0;False;0;0.4960542,1,0,0;0.7053635,0.764151,0.2703364,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;35;-998.5978,388.7925;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;36;-822.6346,367.4237;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;34;-625.7186,464.1829;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;3;-415.441,-130.8424;Inherit;False;Property;_Cliff;Cliff;0;0;Create;True;0;0;False;0;0.7830189,0.7361757,0.6537469,1;0.9150943,0.8830022,0.8330811,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;32;174.5791,780.1606;Inherit;False;Property;_Sand;Sand;1;0;Create;True;0;0;False;0;1,0.7958159,0.514151,0;1,0.8576329,0.6084906,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;45;1118.951,473.6927;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1345.327,401.4062;Half;False;True;-1;2;ASEMaterialInspector;0;0;Lambert;Plain;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;1;2
WireConnection;10;1;1;3
WireConnection;11;0;10;0
WireConnection;11;1;10;0
WireConnection;11;2;10;0
WireConnection;15;0;11;0
WireConnection;20;1;15;0
WireConnection;6;0;15;0
WireConnection;6;1;38;0
WireConnection;21;0;37;0
WireConnection;21;1;20;0
WireConnection;14;0;21;0
WireConnection;14;1;6;0
WireConnection;22;1;23;3
WireConnection;41;0;40;1
WireConnection;41;1;40;1
WireConnection;28;0;14;0
WireConnection;28;1;22;0
WireConnection;7;0;23;3
WireConnection;7;1;39;0
WireConnection;42;0;41;0
WireConnection;25;0;28;0
WireConnection;25;1;7;0
WireConnection;43;0;42;0
WireConnection;43;1;44;0
WireConnection;36;0;35;0
WireConnection;34;0;36;0
WireConnection;45;0;25;0
WireConnection;45;1;43;0
WireConnection;0;0;45;0
ASEEND*/
//CHKSM=D3139742189839BA9367DE18988C72336CF5DA29