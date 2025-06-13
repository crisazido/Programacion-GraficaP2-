using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Camera))]
public class PixelScript : MonoBehaviour
{
    public Shader postProcessShader;
    private Material postProcessMaterial;

    void Awake()
    {
        postProcessMaterial = new Material(postProcessShader);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (postProcessMaterial != null)
        {
            Graphics.Blit(source, destination, postProcessMaterial);
        }
        else
        {
            Graphics.Blit(source, destination);
        }
    }
}
