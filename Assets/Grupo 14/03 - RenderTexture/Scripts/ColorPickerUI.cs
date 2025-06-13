using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;

public class ColorPickerUI : MonoBehaviour
{
    public Material targetMaterial;

    public Image colorPreviewA;
    public Image colorPreviewB;

    public Slider redSlider;
    public Slider greenSlider;
    public Slider blueSlider;

    private bool isPickingColorA = true;

    void Start()
    {
        UpdateColor();
    }

    public void OpenColorPickerA()
    {
        isPickingColorA = true;
        LoadSlidersFromColor(colorPreviewA.color);
    }

    public void OpenColorPickerB()
    {
        isPickingColorA = false;
        LoadSlidersFromColor(colorPreviewB.color);
    }

    public void OnSliderChange()
    {
        UpdateColor();
    }

    private void LoadSlidersFromColor(Color c)
    {
        redSlider.value = c.r;
        greenSlider.value = c.g;
        blueSlider.value = c.b;
    }

    private void UpdateColor()
    {
        Color c = new Color(redSlider.value, greenSlider.value, blueSlider.value);

        if (isPickingColorA)
        {
            colorPreviewA.color = c;
            targetMaterial.SetColor("_Color0", c);
        }
        else
        {
            colorPreviewB.color = c;
            targetMaterial.SetColor("_Color1", c);
        }
    }
}


