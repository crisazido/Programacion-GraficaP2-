using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using static Unity.VisualScripting.Member;

[RequireComponent(typeof(Camera))]
public class PixelScript : MonoBehaviour
{
    public Shader postProcessShader;
    private Material postProcessMaterial;
    [SerializeField] private Slider pixelSlider;

    void Awake()
    {
        postProcessMaterial = new Material(postProcessShader);
    }

    private void Update()
    {
        if (postProcessMaterial != null)
        {
            pixelSlider?.onValueChanged.AddListener(val => postProcessMaterial.SetFloat("_PixelSlider", val));
        }
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
