using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ToggleMask : MonoBehaviour
{
    [SerializeField] private Material maskMat;
    [SerializeField] private Button toggleButton;

    private bool maskB = false;
    private void Start()
    {
        if(toggleButton != null && maskMat != null)
        {
            toggleButton.onClick.AddListener(ChangeMask);
        }
    }

    private void ChangeMask()
    {
        maskB = !maskB;
        maskMat.SetFloat("_Mask", maskB ? 1f : 0f);
    }
}
