using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ShaderController : MonoBehaviour
{
    public Material targetMaterial;

    public Slider heightSlider;
    public Slider frequencySlider;
    public Image colorAImage;
    public Image colorBImage;

    private void Start()
    {
        // Asignar valores iniciales (opcional)
        heightSlider.value = targetMaterial.GetFloat("_Height");
        frequencySlider.value = targetMaterial.GetFloat("_Frequency");
    }

    private void Update()
    {
        // Actualizar valores del shader en tiempo real
        targetMaterial.SetFloat("_Height", heightSlider.value);
        targetMaterial.SetFloat("_Frequency", frequencySlider.value);
        targetMaterial.SetColor("_Color0", colorAImage.color);
        targetMaterial.SetColor("_Color1", colorBImage.color);
    }
}

