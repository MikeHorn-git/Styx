// https://sensepost.com/blog/2024/sensecon-23-from-windows-drivers-to-an-almost-fully-working-edr/

#include <Ntifs.h>
#include <ntddk.h>
#include <wdf.h>

// Global variables
UNICODE_STRING DEVICE_NAME =
	RTL_CONSTANT_STRING(L"\\Device\\MyDumbEDR"); // Driver device name
UNICODE_STRING SYM_LINK =
	RTL_CONSTANT_STRING(L"\\??\\MyDumbEDR"); // Device symlink

void UnloadMyDumbEDR(_In_ PDRIVER_OBJECT DriverObject)
{
	DbgPrintEx(DPFLTR_IHVDRIVER_ID, DPFLTR_INFO_LEVEL,
		   "MyDumbEDR: Unloading routine called\n");
	// Delete the driver device
	IoDeleteDevice(DriverObject->DeviceObject);
	// Delete the symbolic link
	IoDeleteSymbolicLink(&SYM_LINK);
}

NTSTATUS DriverEntry(_In_ PDRIVER_OBJECT DriverObject,
		     _In_ PUNICODE_STRING RegistryPath)
{
	// Prevent compiler error in level 4 warnings
	UNREFERENCED_PARAMETER(RegistryPath);

	DbgPrintEx(DPFLTR_IHVDRIVER_ID, DPFLTR_INFO_LEVEL,
		   "MyDumbEDR: Initializing the driver\n");

	// Variable that will store the output of WinAPI functions
	NTSTATUS status;

	// Initializing a device object and creating it
	PDEVICE_OBJECT DeviceObject;
	UNICODE_STRING deviceName = DEVICE_NAME;
	UNICODE_STRING symlinkName = SYM_LINK;
	status = IoCreateDevice(
		DriverObject, // Our driver object
		0, // Extra bytes needed (we don't need any)
		&deviceName, // The device name
		FILE_DEVICE_UNKNOWN, // The device type
		0, // Device characteristics (none)
		FALSE, // Sets the driver to not exclusive
		&DeviceObject // Pointer in which is stored the result of IoCreateDevice
	);

	if (!status) {
		DbgPrintEx(DPFLTR_IHVDRIVER_ID, DPFLTR_ERROR_LEVEL,
			   "MyDumbEDR: Device creation failed\n");
		return status;
	}

	// Creating the symlink that we will use to contact our driver
	status = IoCreateSymbolicLink(&symlinkName, // The symbolic link name
				      &deviceName // The device name
	);

	if (!NT_SUCCESS(status)) {
		DbgPrintEx(DPFLTR_IHVDRIVER_ID, DPFLTR_ERROR_LEVEL,
			   "MyDumbEDR: Symlink creation failed\n");
		IoDeleteDevice(DeviceObject);
		return status;
	}

	// Setting the unload routine to execute
	DriverObject->DriverUnload = UnloadMyDumbEDR;

	return status;
}
