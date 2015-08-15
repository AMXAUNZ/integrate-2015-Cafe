program_name='integrate-2015-cafe'


define_device

dvDebug = 0:1:0

dvEnzo1 = 5011:1:0
dvEnzo2 = 5012:1:0
dvEnzo3 = 5013:1:0
dvEnzo4 = 5014:1:0

dvEncoder = 5015:1:0

dvTp = 10001:1:0


define_constant

integer BTN_SEND_SIGNAGE_ENZO_1 = 1
integer BTN_SEND_SIGNAGE_ENZO_2 = 2
integer BTN_SEND_SIGNAGE_ENZO_3 = 3
integer BTN_SEND_SIGNAGE_ENZO_4 = 4

integer BTN_ENZO_1_ONLINE = 5
integer BTN_ENZO_2_ONLINE = 6
integer BTN_ENZO_3_ONLINE = 7
integer BTN_ENZO_4_ONLINE = 8


define_variable

char udpStreamAddress[250] =  'udp://234.1.0.1:5500'

#include 'amx-device-control'
#include 'amx-modero-control'


define_event

data_event[dvEnzo1]
data_event[dvEnzo2]
data_event[dvEnzo3]
data_event[dvEnzo4]
{               
	online:
	{
		select
		{
			active(data.device == dvEnzo1):
			{
				moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_1)
				channelOn(dvTp,BTN_ENZO_1_ONLINE)
			}
			active(data.device == dvEnzo2):
			{
				moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_2)
				channelOn(dvTp,BTN_ENZO_2_ONLINE)
			}
			active(data.device == dvEnzo3):
			{
				moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_3)
				channelOn(dvTp,BTN_ENZO_3_ONLINE)
			}
			active(data.device == dvEnzo4):
			{
				moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_4)
				channelOn(dvTp,BTN_ENZO_4_ONLINE)
			}
		}
		
	}
	offline:
	{
		select
		{
			active(data.device == dvEnzo1):
			{
				moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_1)
				channelOff(dvTp,BTN_ENZO_1_ONLINE)
			}
			active(data.device == dvEnzo2):
			{
				moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_2)
				channelOff(dvTp,BTN_ENZO_2_ONLINE)
			}
			active(data.device == dvEnzo3):
			{
				moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_3)
				channelOff(dvTp,BTN_ENZO_3_ONLINE)
			}
			active(data.device == dvEnzo4):
			{
				moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_4)
				channelOff(dvTp,BTN_ENZO_4_ONLINE)
			}
		}
	}
}

data_event[dvTp]
{
	online:
	{
		if(dvEnzo1)
		{
			moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_1)
			channelOn(dvTp,BTN_ENZO_1_ONLINE)
		}
		else
		{
			moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_1)
			channelOff(dvTp,BTN_ENZO_1_ONLINE)
		}
		
		if(dvEnzo2)
		{
			moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_2)
			channelOn(dvTp,BTN_ENZO_2_ONLINE)
		}
		else
		{
			moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_2)
			channelOff(dvTp,BTN_ENZO_2_ONLINE)
		}
		
		if(dvEnzo3)
		{
			moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_3)
			channelOn(dvTp,BTN_ENZO_3_ONLINE)
		}
		else
		{
			moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_3)
			channelOff(dvTp,BTN_ENZO_3_ONLINE)
		}
		
		if(dvEnzo4)
		{
			moderoEnableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_4)
			channelOn(dvTp,BTN_ENZO_4_ONLINE)
		}
		else
		{
			moderoDisableButtonPushes(dvTp,BTN_SEND_SIGNAGE_ENZO_4)
			channelOff(dvTp,BTN_ENZO_4_ONLINE)
		}
	}
}

button_event[dvTp,BTN_SEND_SIGNAGE_ENZO_1]
button_event[dvTp,BTN_SEND_SIGNAGE_ENZO_2]
button_event[dvTp,BTN_SEND_SIGNAGE_ENZO_3]
button_event[dvTp,BTN_SEND_SIGNAGE_ENZO_4]
{                                   
	push:
	{
		switch(button.input.channel)
		{
			case BTN_SEND_SIGNAGE_ENZO_1:
			{
				sendCommand(dvEnzo1,"'VIEW-video/mpg,',udpStreamAddress")
			}
			case BTN_SEND_SIGNAGE_ENZO_2:
			{
				sendCommand(dvEnzo2,"'VIEW-video/mpg,',udpStreamAddress")
			}
			case BTN_SEND_SIGNAGE_ENZO_3:
			{
				sendCommand(dvEnzo3,"'VIEW-video/mpg,',udpStreamAddress")
			}
			case BTN_SEND_SIGNAGE_ENZO_4:
			{
				sendCommand(dvEnzo4,"'VIEW-video/mpg,',udpStreamAddress")
			}
		}
	}
}


define_program
