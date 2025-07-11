using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MoveShaderManager : MonoBehaviour
{
    [SerializeField] private Material objectMat;
    [SerializeField] private Slider heightSlider;
    [SerializeField] private Slider speedSlider;
    [SerializeField] private Slider frecuencySlider;

    private void Update()
    {
        if (objectMat != null)
        {
            heightSlider?.onValueChanged.AddListener(val => objectMat.SetFloat("_Height", val));
            speedSlider?.onValueChanged.AddListener(val => objectMat.SetFloat("_Speed", val));
            frecuencySlider?.onValueChanged.AddListener(val => objectMat.SetFloat("_Frecuency", val));
        }
    }
}
