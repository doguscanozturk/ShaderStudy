using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotator : MonoBehaviour
{
    public Transform subjectTransform;
    public Vector3 rotation;
    public bool isRotating;
    // Update is called once per frame
    void Update()
    {
        if (subjectTransform == null || !isRotating) return;
        
        subjectTransform.Rotate(rotation * Time.deltaTime);
    }
}
