using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Camera))]
public class BloomController : MonoBehaviour
{
    public Shader postProcessShader;
    private Material postProcessMaterial;

    [SerializeField] private Slider bloomSlider;


    void Awake()
    {
        postProcessMaterial = new Material(postProcessShader);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (postProcessMaterial != null)
        {
            postProcessMaterial.SetFloat("_BloomIntensity", bloomSlider.value);

            Graphics.Blit(source, destination, postProcessMaterial);
        }
        else
        {
            Graphics.Blit(source, destination);
        }
    }
}
