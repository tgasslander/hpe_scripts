# hpe_scripts

Some nifty scripts to handle HPE servers

Disclaimer: No warranties are made about the correctness of these scripts. Use at your own risk.

## hpe_amsd.sh

> Note: This has only been tested on a single HPE ProLiant DL20 Gen10 server. Use at your own risk.

Install the `agentless management service daemon` on HPE servers.
Typically this is what you want if you are having trouble lowering the fan speed on HPE servers.

> Note: Set the minimal fan speed in the iLO settings to something lower than before.
> After you've run this script you'd notice a decrease of the fan noise after a little while

Confirm that the AMSD is running by checking in iLO "System Information", under Subystems and Devices.
You should see the "Agentless Management Service" listed with a green checkmark.
