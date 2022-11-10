; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "v2rayA"
#define MyAppVersion "TheRealVersion"
#define MyAppPublisher "v2rayA Organization"
#define MyAppURL "https://v2raya.org/"
#define MyAppExeName "v2rayA-service.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B991C73A-599E-460D-A35A-D1ED414DADBF}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ArchitecturesInstallIn64BitMode=x64
DefaultDirName={autopf}\{#MyAppName}
; DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=D:\LICENSE.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=D:\
OutputBaseFilename=installer_windows_inno_x64
Compression=lzma
SolidCompression=yes
UninstallDisplayName={#MyAppName}-{#MyAppVersion}
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "D:\v2raya-x86_64-windows\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\v2raya-x86_64-windows\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\v2raya-x86_64-windows\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\v2raya-x86_64-windows\config\*"; DestDir: "{app}\config"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "D:\v2raya-x86_64-windows\v2rayA-service.xml"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\v2rayA Web Panel"; Filename: "http://localhost:2017"
Name: "{group}\v2rayA Wiki"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters: "install";
Filename: "{app}\{#MyAppExeName}"; Parameters: "start";

[UninstallRun]
Filename: "{app}\{#MyAppExeName}"; Parameters: "stop";
Filename: "{app}\{#MyAppExeName}"; Parameters: "uninstall";

[UninstallDelete]
Type: files; Name: "{app}\v2rayA-service.wrapper.log"
Type: files; Name: "{app}\v2rayA-service.out.log"
Type: files; Name: "{app}\v2rayA-service.wrapper.log"
Type: files; Name: "{app}\v2rayA-service.wrapper.log.old"
Type: files; Name: "{app}\v2rayA-service.out.log.old"
Type: files; Name: "{app}\v2rayA-service.wrapper.log.old"
Type: files; Name: "{app}\v2rayA-service.err.log"
Type: files; Name: "{app}\v2rayA-service.err.log.old"

[code]
function InitializeSetup(): boolean;
var
  ResultCode: integer;
begin
  if Exec(ExpandConstant('{sys}\sc.exe'), 'stop v2rayA', '', SW_SHOW,
     ewWaitUntilTerminated, ResultCode) then
  begin
    // handle success if necessary; ResultCode contains the exit code
  end
  else begin
    // handle failure if necessary; ResultCode contains the error code
  end;

  // Proceed Setup
  Result := True;

end;