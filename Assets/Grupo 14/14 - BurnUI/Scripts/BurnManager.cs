using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BurnManager : MonoBehaviour
{
    [SerializeField] private Material uiMat;
    [SerializeField] private Slider effectSlider;

    void Update()
    {
        if (uiMat != null)
        {
            effectSlider?.onValueChanged.AddListener(val => uiMat.SetFloat("_Power", val));
            effectSlider?.onValueChanged.AddListener(val => uiMat.SetFloat("_Start", val));
        }
    }
}
