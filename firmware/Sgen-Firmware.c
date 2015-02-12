/*
             LUFA Library
     Copyright (C) Dean Camera, 2014.

  dean [at] fourwalledcubicle [dot] com
           www.lufa-lib.org
*/

/*
  Copyright 2014  Dean Camera (dean [at] fourwalledcubicle [dot] com)

  Permission to use, copy, modify, distribute, and sell this
  software and its documentation for any purpose is hereby granted
  without fee, provided that the above copyright notice appear in
  all copies and that both that the copyright notice and this
  permission notice and warranty disclaimer appear in supporting
  documentation, and that the name of the author not be used in
  advertising or publicity pertaining to distribution of the
  software without specific, written prior permission.

  The author disclaims all warranties with regard to this
  software, including all implied warranties of merchantability
  and fitness.  In no event shall the author be liable for any
  special, indirect or consequential damages or any damages
  whatsoever resulting from loss of use, data or profits, whether
  in an action of contract, negligence or other tortious action,
  arising out of or in connection with the use or performance of
  this software.
*/

#include "Sgen-Firmware.h"

#define DigiPoti 0x12

/** Buffer to hold the previously generated HID report, for comparison purposes inside the HID class driver. */
static uint8_t PrevHIDReportBuffer[GENERIC_REPORT_SIZE];

//contains the Deviceconfiguration Data
uint8_t DeviceConfig[11] = {0x20, 0x00, 0x40, 0x00, 0x69, 0xf1, 0x00, 0x00, 0x00, 0x00, 0x18};

//Indicates weather the digipoti is respondig for error feedback to the computer
bool StatusDigiPoti = false;

/** LUFA HID Class driver interface configuration and state information. This structure is
 *  passed to all HID Class driver functions, so that multiple instances of the same class
 *  within a device can be differentiated from one another.
 */
USB_ClassInfo_HID_Device_t Generic_HID_Interface =
	{
		.Config =
			{
				.InterfaceNumber              = INTERFACE_ID_GenericHID,
				.ReportINEndpoint             =
					{
						.Address              = GENERIC_IN_EPADDR,
						.Size                 = GENERIC_EPSIZE,
						.Banks                = 1,
					},
				.PrevReportINBuffer           = PrevHIDReportBuffer,
				.PrevReportINBufferSize       = sizeof(PrevHIDReportBuffer),
			},
	};


/** Main program entry point. This routine contains the overall program flow, including initial
 *  setup of all components and the main program loop.
 */
int main(void)
{
	SetupHardware();

	GlobalInterruptEnable();
	//Daten_Verteilen();
	for (;;)
	{
		SPI_ausgabe();
		_delay_ms(500);

		/*
		HID_Device_USBTask(&Generic_HID_Interface);
		USB_USBTask();
		//*/
	}
	
}

/** Configures the board hardware and chip peripherals for the demo's functionality. */
void SetupHardware(void)
{

	/* Disable watchdog if enabled by bootloader/fuses */
	MCUSR &= ~(1 << WDRF);
	wdt_disable();

	/* Disable clock division */https://www.google.de/?gws_rd=ssl
	clock_prescale_set(clock_div_1);

	/* Hardware Initialization */
	USB_Init();
	
	// http://avrbeginners.net/architecture/spi/spi.html
	SPI_Init(SPI_SPEED_FCPU_DIV_32 | SPI_SCK_LEAD_FALLING | SPI_SAMPLE_LEADING | SPI_ORDER_MSB_FIRST | SPI_MODE_MASTER);

	//initialize I²C-Bus
	TWI_Init(TWI_BIT_PRESCALE_1, TWI_BITLENGTH_FROM_FREQ(1, 200000));

	DDRD = 0x38;
	PORTD = 0x38;
}

/** Event handler for the library USB Connection event. */
void EVENT_USB_Device_Connect(void)
{
	
}

/** Event handler for the library USB Disconnection event. */
void EVENT_USB_Device_Disconnect(void)
{
	
}

/** Event handler for the library USB Configuration Changed event. */
void EVENT_USB_Device_ConfigurationChanged(void)
{
	bool ConfigSuccess = true;

	ConfigSuccess &= HID_Device_ConfigureEndpoints(&Generic_HID_Interface);

	USB_Device_EnableSOFEvents();

}

/** Event handler for the library USB Control Request reception event. */
void EVENT_USB_Device_ControlRequest(void)
{
	HID_Device_ProcessControlRequest(&Generic_HID_Interface);
}

/** Event handler for the USB device Start Of Frame event. */
void EVENT_USB_Device_StartOfFrame(void)
{
	HID_Device_MillisecondElapsed(&Generic_HID_Interface);
}

/** HID class driver callback function for the creation of HID reports to the host.
 *
 *  \param[in]     HIDInterfaceInfo  Pointer to the HID class interface configuration structure being referenced
 *  \param[in,out] ReportID    Report ID requested by the host if non-zero, otherwise callback should set to the generated report ID
 *  \param[in]     ReportType  Type of the report to create, either HID_REPORT_ITEM_In or HID_REPORT_ITEM_Feature
 *  \param[out]    ReportData  Pointer to a buffer where the created report should be stored
 *  \param[out]    ReportSize  Number of bytes written in the report (or zero if no report is to be sent)
 *
 *  \return Boolean \c true to force the sending of the report, \c false to let the library determine if it needs to be sent
 */
bool CALLBACK_HID_Device_CreateHIDReport(USB_ClassInfo_HID_Device_t* const HIDInterfaceInfo,
                                         uint8_t* const ReportID,
                                         const uint8_t ReportType,
                                         void* ReportData,
                                         uint16_t* const ReportSize)
{
	uint8_t* Data        = (uint8_t*)ReportData;


	*ReportSize = GENERIC_REPORT_SIZE;

	return false;
}

/** HID class driver callback function for the processing of HID reports from the host.
 *
 *  \param[in] HIDInterfaceInfo  Pointer to the HID class interface configuration structure being referenced
 *  \param[in] ReportID    Report ID of the received report from the host
 *  \param[in] ReportType  The type of report that the host has sent, either HID_REPORT_ITEM_Out or HID_REPORT_ITEM_Feature
 *  \param[in] ReportData  Pointer to a buffer where the received report has been stored
 *  \param[in] ReportSize  Size in bytes of the received HID report
 */
void CALLBACK_HID_Device_ProcessHIDReport(USB_ClassInfo_HID_Device_t* const HIDInterfaceInfo,
                                          const uint8_t ReportID,
                                          const uint8_t ReportType,
                                          const void* ReportData,
                                          const uint16_t ReportSize)
{
	uint8_t* Data       = (uint8_t*)ReportData;
	
	for (int i=0; i<ReportSize; i++)
	{
		DeviceConfig[i] = Data[i];
	}
	//Set the IO-Pins for the analog Multiplexer
	PORTD = DeviceConfig[10];
	
	//Send the frequency and formdata to the AD9833
	SPI_Send2Byte(DeviceConfig[0], DeviceConfig[1]);
	SPI_Send2Byte(DeviceConfig[2], DeviceConfig[3]);
	SPI_Send2Byte(DeviceConfig[4], DeviceConfig[5]);
	
	//Send the TWI-Data, but only if device is responding.
	if (TWI_StartTransmission(DigiPoti, 1) == true)
	{
		StatusDigiPoti = true;

		for (int i = 0; i < 4; i++)
		{
			int PotiWert = i + 6;
	
			TWI_SendByte(0x10 | i);
			TWI_SendByte(DeviceConfig[PotiWert]);
		}

		TWI_SendByte(0x78);
		TWI_SendByte(0x01);
		TWI_StopTransmission();
	}
	else
	{
		StatusDigiPoti = false;
	}
	
	return;
}

SPI_ausgabe()
{
	
	SPI_Send2Byte(0b00100000, 0b00000010);
	_delay_us(5);
	SPI_Send2Byte(0b01010010, 0b11000000);
	_delay_us(5);
	SPI_Send2Byte(0b01100000, 0b11000101);
	_delay_us(5);

	return;
}

Daten_Verteilen()
{
	PORTD = DeviceConfig[10];
	SPI_Send2Byte(DeviceConfig[0], DeviceConfig[1]);
	SPI_Send2Byte(DeviceConfig[2], DeviceConfig[3]);
	SPI_Send2Byte(DeviceConfig[4], DeviceConfig[5]);
}