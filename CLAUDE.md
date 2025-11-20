# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

Build all projects using MSBuild:
```cmd
msbuild WindowEnablerGroup.groupproj /t:Build
```

Build individual projects:
```cmd
msbuild WindowEnabler.dproj /t:Build /p:Config=Debug /p:Platform=Win32
msbuild EnablerTest.dproj /t:Build /p:Config=Debug /p:Platform=Win32
```

Clean build:
```cmd
msbuild WindowEnablerGroup.groupproj /t:Clean
```

Output executables are placed in `.\$(Platform)\$(Config)\` (e.g., `.\Win32\Debug\WindowEnabler.exe`).

## Project Overview

This is a Delphi RAD Studio VCL project group containing two Windows desktop applications:

### WindowEnabler (Main Application)
A Windows utility that can enumerate window hierarchies and re-enable disabled windows. Uses Windows API calls:
- `EnumWindows`/`EnumChildWindows` for window enumeration
- `EnableWindow` to enable disabled windows
- `ShowWindow` to show hidden windows

Key components in `WindowEnablerForm.pas`:
- `TMyTreeNode` - Custom tree node storing HWND, caption, and class name
- `MainEnumProc` - Recursive callback for window enumeration
- `GetHandle` - Finds window handle by partial title match

### EnablerTest (Test Application)
A companion test application with buttons that change enabled/visible state based on a radio group selection. Use this to test the WindowEnabler's ability to re-enable disabled controls.

## Architecture Notes

- Project targets Win32 and Win64 platforms
- Uses VCL framework for UI components
- Window enumeration passes context via `EnumClass` object cast to `Longint` (lParam)
- Custom `TMyTreeNode` class extends `TTreeNode` to store window metadata
