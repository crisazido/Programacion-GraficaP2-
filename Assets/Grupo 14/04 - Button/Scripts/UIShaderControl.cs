using UnityEngine;
using UnityEngine.UI;

public class UIShaderControl : MonoBehaviour
{
    [SerializeField] private Material buttonMat;
    [SerializeField] private Slider angleSlider;
    [SerializeField] private Slider glowSlider;
    [SerializeField] private Slider frecuencySlider;

    void Update()
    {
        if (buttonMat != null)
        {
            angleSlider?.onValueChanged.AddListener(val => buttonMat.SetFloat("_Angle", val));
            glowSlider?.onValueChanged.AddListener(val => buttonMat.SetFloat("_Glow", val));
            frecuencySlider?.onValueChanged.AddListener(val => buttonMat.SetFloat("_Frecuency", val));
        }
    }
}
