using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class WaterController : MonoBehaviour
{
    [SerializeField] private Material waterMat;
    [SerializeField] private Slider heightSlider;
    [SerializeField] private Slider speedSlider;
    [SerializeField] private Slider frecuencySlider;
    [SerializeField] private Slider scaleSlider;

    private void Update()
    {
        if (waterMat != null)
        {
            heightSlider?.onValueChanged.AddListener(val => waterMat.SetFloat("_Height", val));
            speedSlider?.onValueChanged.AddListener(val => waterMat.SetFloat("_Speed", val));
            frecuencySlider?.onValueChanged.AddListener(val => waterMat.SetFloat("_Frecuency", val));
            scaleSlider?.onValueChanged.AddListener(val => waterMat.SetFloat("_Scale", val));
        }
    }
}
