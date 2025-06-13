using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.SceneManagement;

public class LevelManager : MonoBehaviour
{
    public GameObject shapeMask;
    public GameObject greyScale;
    public GameObject renderTexture;
    public GameObject button;
    public GameObject bloom;
    public GameObject pixelation;
    public GameObject outline;
    public GameObject proyector;

    public void ShapeMask()
    {
        SceneManager.LoadScene("01 - ShapeMask");
    }

    public void GreyScale()
    {
        SceneManager.LoadScene("02 - GrayScale");
    }

    public void RenderTexture()
    {
        SceneManager.LoadScene("03 - RenderTexture");
    }

    public void Button()
    {
        SceneManager.LoadScene("04 - Button");
    }

    public void Bloom()
    {
        SceneManager.LoadScene("05 - Bloom");
    }

    public void Pixelation()
    {
        SceneManager.LoadScene("06 - Pixelation");
    }

    public void Outline()
    {
        SceneManager.LoadScene("07 - Outline");
    }

    public void Proyector()
    {
        SceneManager.LoadScene("08 - Proyector");
    }
}
