// https://github.com/dobin/RedEdr

#include <windows.h>
#include <stdio.h>

int main()
{
	unsigned char payload[] = {
		0xC3
	}; // ret instruction, safe NOP like shellcode for test
	SIZE_T payloadSize = sizeof(payload);
	DWORD oldProtect = 0;
	HANDLE hThread;
	DWORD threadId;

	PVOID shellcodeAddr = VirtualAlloc(
		NULL, payloadSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
	if (shellcodeAddr == NULL) {
		printf("VirtualAlloc failed\n");
		return 1;
	}

	memcpy(shellcodeAddr, payload, payloadSize);

	if (!VirtualProtect(shellcodeAddr, payloadSize, PAGE_EXECUTE_READWRITE,
			    &oldProtect)) {
		printf("VirtualProtect failed\n");
		return 1;
	}

	hThread = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)shellcodeAddr,
			       shellcodeAddr, 0, &threadId);
	if (hThread == NULL) {
		printf("CreateThread failed\n");
		return 1;
	}

	WaitForSingleObject(hThread, INFINITE);
	CloseHandle(hThread);

	return 0;
}
