using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FilmNoiseManager : MonoBehaviour
{
    [SerializeField] private Material filmNoiseMat;
    [SerializeField] private Slider intensitySlider;
    private void Update()
    {
        if (filmNoiseMat != null)
        {
            intensitySlider?.onValueChanged.AddListener(val => filmNoiseMat.SetFloat("_Intensity", val));
        }
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (filmNoiseMat != null)
            Graphics.Blit(source, destination, filmNoiseMat);
        else
            Graphics.Blit(source, destination);
    }
}
