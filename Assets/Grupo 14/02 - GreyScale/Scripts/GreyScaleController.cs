using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GreyScaleController : MonoBehaviour
{
    public Material material1;
    public Material material2;
    public Slider grayscaleSlider;

    void Update()
    {
        material1.SetFloat("_GrayscaleAmount", grayscaleSlider.value);
        material2.SetFloat("_GrayscaleAmount", grayscaleSlider.value);
    }
}
