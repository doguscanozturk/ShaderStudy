using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class MeshTest : MonoBehaviour
{
    public MeshFilter meshFilter;
    public Transform mTransform;
    public float normalLength;
    public bool isDrawingVerticesAndNormals;

    private void DrayRayNormals(Mesh mesh)
    {
        foreach (var normal in mesh.normals)
        {
            Debug.DrawRay(mTransform.position, normal * 5f, Color.red);
        }
    }

    private void DrawRayVerticesAndNormals(Mesh mesh)
    {
        for (int i = 0; i < mesh.vertices.Length; i++)
        {
            var vertexPosition = mesh.vertices[i];
            vertexPosition.x *= mTransform.localScale.x;
            vertexPosition.y *= mTransform.localScale.y;
            vertexPosition.z *= mTransform.localScale.z;
            vertexPosition += mTransform.position;
            
            // Vector3 posRot = mTransform.rotation * vertexPosition;
            var normal = mesh.normals[i];

            var rotatedNormal = Quaternion.AngleAxis(mTransform.localEulerAngles.x, Vector3.right) * normal;
            rotatedNormal = Quaternion.AngleAxis(mTransform.localEulerAngles.y, Vector3.up) * rotatedNormal;
            rotatedNormal = Quaternion.AngleAxis(mTransform.localEulerAngles.z, Vector3.forward) * rotatedNormal;
                
            Debug.DrawRay(vertexPosition, (normal * normalLength), Color.red);
        }
    }

    private void Update()
    {
        if (isDrawingVerticesAndNormals)
        {
            DrawRayVerticesAndNormals(meshFilter.sharedMesh);
        }
    }
}