using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

public class TestScript : MonoBehaviour
{
    public int processCount;

    void Start()
    {
        Stopwatch operationTime = Stopwatch.StartNew();
        var list = new List<int>();
        for (int i = 0; i < processCount; i++)
        {
            list.Add(i);
        }

        operationTime.Stop();
        var ticks = operationTime.ElapsedTicks;
        var milliSec = operationTime.ElapsedMilliseconds;
        var seconds = operationTime.Elapsed.Seconds;
        print($"ticks: {ticks} seconds:{seconds} milliSec: {milliSec}");
    }

    // Update is called once per frame
    void Update()
    {
    }
}