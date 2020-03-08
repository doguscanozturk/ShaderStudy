using UnityEngine;
using UnityEngine.Serialization;

namespace MakinStuffGood
{
    [ExecuteInEditMode]
    public class ScreenSpaceRefractions : MonoBehaviour
    {
        [HideInInspector]
        [SerializeField]
        private Camera _camera;
        [SerializeField]
        [Range(1, 5)]
        private int downResFactor;

        [SerializeField]
        [Range(0, 1)]
        private float refractionVisibility = 0;
        [SerializeField]
        [Range(0, 0.1f)]
        private float refractionMagnitude = 0;

        private readonly string globalTextureName = "_GlobalRefractionTex";
        private readonly string globalVisibilityName = "_GlobalVisibility";
        private readonly string globalMagnitudeName = "_GlobalRefractionMag";

        public void VisibilityChange(float value)
        {
            refractionVisibility = value;
            Shader.SetGlobalFloat(globalVisibilityName, refractionVisibility);
        }

        public void MagnitudeChange(float value)
        {
            refractionMagnitude = value;
            Shader.SetGlobalFloat(globalMagnitudeName, refractionMagnitude);
        }

        void OnEnable()
        {
            GenerateRT();
            Shader.SetGlobalFloat(globalVisibilityName, refractionVisibility);
            Shader.SetGlobalFloat(globalMagnitudeName, refractionMagnitude);
        }

        void OnValidate()
        {
            Shader.SetGlobalFloat(globalVisibilityName, refractionVisibility);
            Shader.SetGlobalFloat(globalMagnitudeName, refractionMagnitude);
        }

        void GenerateRT()
        {
            _camera = GetComponent<Camera>();

            if (_camera.targetTexture != null)
            {
                RenderTexture temp = _camera.targetTexture;

                _camera.targetTexture = null;
                DestroyImmediate(temp);
            }

            _camera.targetTexture = new RenderTexture(_camera.pixelWidth >> downResFactor, _camera.pixelHeight >> downResFactor, 16);
            _camera.targetTexture.filterMode = FilterMode.Bilinear;

            Shader.SetGlobalTexture(globalTextureName, _camera.targetTexture);
        }
    }
}