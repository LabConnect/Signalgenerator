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

/** Buffer to hold the previously generated HID report, for comparison purposes inside the HID class driver. */
static uint8_t PrevHIDReportBuffer[GENERIC_REPORT_SIZE];

uint8_t DeviceConfig[20] = {0x20, 0x00, 0x40, 0x00, 0x69, 0xf1};

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
	
	
	for (;;)
	{
		SPI_ausgabe();
		_delay_ms(1);
		PORTD = 0x38;
		

		_delay_ms(5000);
			/* code */
		
		/*
		HID_Device_USBTask(&Generic_HID_Interface);
		USB_USBTask();
		*/
	}
	
}

/** Configures the board hardware and chip peripherals for the demo's functionality. */
void SetupHardware(void)
{

	/* Disable watchdog if enabled by bootloader/fuses */
	MCUSR &= ~(1 << WDRF);
	wdt_disable();

	/* Disable clock division */
	clock_prescale_set(clock_div_1);

	/* Hardware Initialization */
	USB_Init();
	Init_Serial();
	DDRD = 0x38;
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
	/*
	for (int i=0; i<ReportSize; i++)
	{
		DeviceConfig[i] = Data[i];
	}
	*/
	
	S_S(0);
	SPI_SendByte(DeviceConfig[0x20]);
	SPI_SendByte(DeviceConfig[0x00]);
	S_S(1);

	_delay_ms(5);

	S_S(0);
	SPI_SendByte(DeviceConfig[0x40]);
	SPI_SendByte(DeviceConfig[0x00]);
	S_S(1);

	_delay_ms(5);

	S_S(0);
	SPI_SendByte(DeviceConfig[0x69]);
	SPI_SendByte(DeviceConfig[0xf1]);
	S_S(1);
	return;
}

//routine to initialise the different serial ports of the of the mega32u2
void Init_Serial()
{
	SPI_Init(SPI_SPEED_FCPU_DIV_16 | SPI_SCK_LEAD_RISING | SPI_SAMPLE_LEADING | SPI_ORDER_MSB_FIRST | SPI_MODE_MASTER);
}

//this funkction is to shorten the high or low of the Slave select (!SS) Pin.
void S_S(int SlaveBit)
{
	if(SlaveBit == 1)
	{
		_delay_us(1);
		PORTB |= (1 << 0);
	}
	else if (SlaveBit == 0)
	{
		PORTB &= ~(1 << 0);
		_delay_us(1);
	}
	return;
}

SPI_ausgabe()
{
	
	SPI_Send2Byte(0x00, 0x21);
	SPI_Send2Byte(0xC7, 0x50);
	SPI_Send2Byte(0x00, 0x40);
	SPI_Send2Byte(0x00, 0xC0);
	SPI_Send2Byte(0x00, 0x20);

	return;
}