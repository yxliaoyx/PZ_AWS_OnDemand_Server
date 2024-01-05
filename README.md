# PZ_AWS_OnDemand_Server

Set up a Project Zomboid dedicated server quickly and simply.

This repository is inspired by [MineCloud](https://github.com/VeriorPies/MineCloud).

## Features

* Easy to set up
* Bypasses prompts when creating a server
* Automatically shuts down when no one is online

## Quick Start

Run the install script:
```
sudo /bin/bash install.sh
```

## Requirements

[Set up to use Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html)

* Required settings
    * Application and OS Images (Amazon Machine Image)
        * Ubuntu 22.04 LTS
    * Network settings (Add security group rule)
        * Type: Custom UDP
        * Port range: 16261-16262
        * Source type: Anywhere
* Optional settings
    * Advanced details (Request Spot Instances)
        * Request type: Persistent
        * Interruption behavior: Stop

Please refer to [EC2 On-Demand Pricing](https://aws.amazon.com/tw/ec2/pricing/on-demand/) and [Spot Instances Pricing](https://aws.amazon.com/tw/ec2/spot/pricing/) for more information.

> [!WARNING]
> If you no longer want your Spot Instance. To ensure that no new Spot Instance is launched, you must first cancel the Spot Instance request.
> (https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-requests.html#terminating-a-spot-instance)

## Installation

1. Clone this repository:
```
git clone https://github.com/yxliaoyx/PZ_AWS_OnDemand_Server.git
```

2. Edit startup parameters in `PZ_AWS_OnDemand_Server/zomboid.service`. Refer to [Startup parameters](https://pzwiki.net/wiki/Startup_parameters) for details.

3. Run the install script:
```
cd PZ_AWS_OnDemand_Server
sudo /bin/bash install.sh
```

## Management

The following commands are available:
```
# start a server
systemctl start zomboid.service

# stop a server
systemctl stop zomboid.service

# restart a server
systemctl restart zomboid.service

# check server status (ctrl-c to exit)
systemctl status zomboid.service

# access to the logs
journalctl -u zomboid.service -f
```
