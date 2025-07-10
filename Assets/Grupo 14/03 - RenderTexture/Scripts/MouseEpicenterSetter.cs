using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class MouseEpicenterSetter : MonoBehaviour
{
    public LayerMask clickableLayer;
    public GameObject markerObject;

    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit, 100f, clickableLayer))
            {
                Vector3 point = hit.point;

                
                Shader.SetGlobalVector("_Epicenter", point);

                
                if (markerObject != null)
                    markerObject.transform.position = point;
            }
        }
    }
}

