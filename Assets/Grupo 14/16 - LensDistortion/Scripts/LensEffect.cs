using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LensEffect : MonoBehaviour
{
    [SerializeField] private Material lensMat;
    [SerializeField] private Slider effectSlider;

    private void Update()
    {
        if (lensMat != null)
        {
            effectSlider?.onValueChanged.AddListener(val => lensMat.SetFloat("_Distort", val));
        }
    }
}
