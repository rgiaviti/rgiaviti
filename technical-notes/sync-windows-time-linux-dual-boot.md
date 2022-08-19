When you have a Windows and Linux (Ubuntu at least) in Dual Boot, the time on Windows appears to be unsynced with ubuntu.
We have to adjust a property in regedit.  

Manual steps
```
regedit:

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation\RealTimeIsUniversal
# Setar valor para 1

Ou Criar uma DWORD e setar para 1
```


Or save the content below as `RealTimeIsUniversal.reg` and apply it on Windows.
```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation]
 "RealTimeIsUniversal"=dword:00000001
```
