## anti debug code
```

__PPEB GetProcessEnvironmentBlock()
{
    ULONG_PTR pPeb;
#ifdef _WIN64
    pPeb = __readgsqword(0x60);
#else
#ifdef WIN_ARM
    pPeb = *(DWORD *)( (BYTE *)_MoveFromCoprocessor( 15, 0, 13, 0, 2 ) + 0x30 );
#else
    // _WIN32
    pPeb = __readfsdword(0x30);
#endif
#endif
    return (__PPEB)pPeb;
}

inline void anti_debug(void) {
    DWORD errorValue = 1111;
    SetLastError(errorValue);
    if (GetLastError() != errorValue) {
        #ifdef _DEBUG_
            MessageBoxA(NULL, "Stop debugging program!", "Error", MB_OK | MB_ICONERROR);
        #endif
        exit(0);
    }

    __PPEB peb = GetProcessEnvironmentBlock();
    if (peb->bBeingDebugged) {
        exit(0);
    }

    if (peb->dwNtGlobalFlag & NT_GLOBAL_FLAG_DEBUGGED) {
        exit(0);
    }
}
```

## references
- [debug-flags](https://anti-debug.checkpoint.com/techniques/debug-flags.html)
- [PEzor anti_debug](https://github.com/phra/PEzor/blob/master/PEzor.cpp)
- [github Anti-Debug](https://github.com/OsandaMalith/Anti-Debug)