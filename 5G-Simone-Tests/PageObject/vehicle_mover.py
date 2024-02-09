# Command to be executed
import subprocess
from time import sleep

filedir = open('C:/Users/AbiodunAjibade/PycharmProjects/5G-Simone-Frontend/log/log.html')
cmd = ['C:/Users/AbiodunAjibade/PycharmProjects/5G-Simone-Frontend/5G-Simone-Tests/Resources/VirtualVehicleMover/StartBusLemgo.bat']
proc = subprocess.Popen(cmd)
print(proc.pid)
sleep(30)
proc.terminate()
print('process completed')
