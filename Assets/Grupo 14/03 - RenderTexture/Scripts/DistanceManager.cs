using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DistanceManager : MonoBehaviour
{
    [SerializeField] private Material distanceMat;
    [SerializeField] private Slider heightSlider;
    [SerializeField] private Slider distanceSlider;

    private void Start()
    {
        if (distanceMat != null)
        {
            distanceSlider?.onValueChanged.AddListener(val => distanceMat.SetFloat("_Distance", val));
            heightSlider?.onValueChanged.AddListener(val => distanceMat.SetFloat("_Height", val));
        }
    }
}
