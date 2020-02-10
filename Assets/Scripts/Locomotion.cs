using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Locomotion : MonoBehaviour {
    [SerializeField]
    Transform head;

    CharacterController character;
    bool moving = false;

    void Start () {

        character = GetComponent<CharacterController> ();
        character.SimpleMove (head.forward);
    }

    public void StartMoving () {
        moving = true;
    }
    public void StopMoving () {
        moving = false;
    }

    public void Update () {
        if (moving) {
            character.SimpleMove (head.forward * 4f);
        }

    }
}