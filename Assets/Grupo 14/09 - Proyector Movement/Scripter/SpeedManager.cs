using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SpeedManager : MonoBehaviour
{
    [SerializeField] private Material projectorMat;
    [SerializeField] private Slider speedSlider;

    private void Update()
    {
        if (projectorMat != null)
        {
            speedSlider?.onValueChanged.AddListener(val => projectorMat.SetFloat("_Speed", val));
        }
    }
}
