using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class VignetteManager : MonoBehaviour
{
    [SerializeField] private Material vignetteMat;
    [SerializeField] private Slider powerSlider;
    [SerializeField] private Slider scaleSlider;
    [SerializeField] private Slider hardnessSlider;
    private void Update()
    {
        if (vignetteMat != null)
        {
            powerSlider?.onValueChanged.AddListener(val => vignetteMat.SetFloat("_Power", val));
            scaleSlider?.onValueChanged.AddListener(val => vignetteMat.SetFloat("_Scale", val));
            hardnessSlider?.onValueChanged.AddListener(val => vignetteMat.SetFloat("_Hardness", val));
        }
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (vignetteMat != null)
            Graphics.Blit(source, destination, vignetteMat);
        else
            Graphics.Blit(source, destination);
    }
}
