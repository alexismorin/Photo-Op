using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomRot : MonoBehaviour {
    void Start () {
        Vector3 randomRot = new Vector3 (0f, Random.Range (0f, 360f), 0f);
        transform.localEulerAngles = randomRot;
        Destroy (this);
    }

}