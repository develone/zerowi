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
  Ultibo
  { Add additional units here };
{$linklib wifi}
var
  Console1 : TWindowHandle;

 procedure scanit; cdecl; external 'libwifi' name 'scanit';
 procedure joinit; cdecl; external 'libwifi' name 'joinit';
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
  Log ('WIFI Demo #1.');
  WaitForSDDrive;
  Log ('SD Drive Ready.');
  scanit();
  joinit();
  ThreadHalt (0);
end.

