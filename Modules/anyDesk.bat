runas /user:Administrator 
msiexec /i %1\Apps\AnyDesk.msi /qb!
echo password | "C:\Program Files (x86)\AnyDeskMSI\AnyDeskMSI.exe" --set-password