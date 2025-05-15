# hpe_scripts

Some nifty scripts to handle HPE servers

## hpe_amsd.sh

Install the `agentless management service daemon` on HPE servers.
Typically this is what you want if you are having trouble lowering the fan speed on HPE servers.

> Note: Set the minimal fan speed in the iLO settings to something lower than before.
> After you've run this script you'd notice a decrease of the fan noise after a little while

Confirm that the AMSD is running by checking in iLO "System Information", under Subystems and Devices
You'll see the "Agentless Management Service" listed with a green checkmark
