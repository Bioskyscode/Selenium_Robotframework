#!/usr/bin/env python

import subprocess
from time import sleep

proc = subprocess.Popen(
    [
        "docker",
        "run",
        "--rm",
        "-ti",
        "registry.biqx.de/biqx_dev/vehiclemover",
        "s/TestData",
        'd/"https://5gsimone-test.staging.biqx.de:6100"',
        "m/100",
        "c/50",
        "l/r",
    ]
)
print(proc.pid)
sleep(30)
proc.terminate()
print("process completed")

