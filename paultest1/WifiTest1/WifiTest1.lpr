program WifiTest1;

{$mode objfpc}{$H+}
{$hints off}

{ Raspberry Pi Zero Application                                                }
{  Add your program code below, add additional units to the "uses" section if  }
{  required and create new units by selecting File, New Unit from the menu.    }
{                                                                              }
{  To compile your program select Run, Compile (or Run, Build) from the menu.  }

uses
  RaspberryPi,
  GlobalConfig,
  GlobalConst,
  GlobalTypes,
  Platform,
  Threads,
  SysUtils,
  Classes,
  Console,
  SysCalls,
  Ultibo,
  logging
  { Add additional units here };
{$linklib wifiscan}
{$linklib wifijoin}
var
  Console1 : TWindowHandle;
  MyPLoggingDevice : ^TLoggingDevice;

 procedure test_scan; cdecl; external 'libwifiscan' name 'test_scan';
 procedure test_wifi; cdecl; external 'libwifijoin' name 'test_wifi';
//function scanit : integer; cdecl; external libwifi' name scanit;
//function joinit : integer; cdecl; external libwifi' name joinit;
procedure Log (s : string);
begin
  ConsoleWindowWriteLn (Console1, s);
end;

procedure WaitForSDDrive;
begin
  while not DirectoryExists ('C:\') do sleep (500);
end;

begin
  Console1 := ConsoleWindowCreate (ConsoleDeviceGetDefault, CONSOLE_POSITION_FULL, true);
  LoggingDeviceSetTarget(LoggingDeviceFindByType(LOGGING_TYPE_FILE),'c:\wifi.log');
 LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_FILE));
 MyPLoggingDevice:=LoggingDeviceGetDefault;
 LoggingDeviceRedirectOutput(MyPLoggingDevice);
  //Log ('WIFI Demo #1.');
  WaitForSDDrive;
  //Log ('SD Drive Ready.');
  //test_scan();
  test_wifi();
  ThreadHalt (0);
end.

