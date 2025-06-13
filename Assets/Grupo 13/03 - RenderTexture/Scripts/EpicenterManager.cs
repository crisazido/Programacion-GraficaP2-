using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class EpicenterManager : MonoBehaviour
{
    public Transform epicenterTransform;

    void Update()
    {
        Shader.SetGlobalVector("_Epicenter", epicenterTransform.position);
    }
}

