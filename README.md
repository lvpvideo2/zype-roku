# Zype Roku Template App

This is a boilerplate Rails App using the Zype Platform and Zype Gem.

## Setup

1. You will need your Zype API and Player keys. You can find these in the [Zype Platform](https://admin.zype.com/) under the 'Settings' and 'Video Apps' menu.

![Alt text](screenshots/settings.png)

2. Clone the repo

3. Update the following commands:

  * ROKU_DEV_TARGET: The IP address of your Roku device on your local network.
  * DEVPASSWORD: Your Roku's developer password.

4. Update your Zype configuration. Update the config located here under [source/objects/config.brs](source/objects/config.brs), and enter the following values:

  * key: Your Zype API Key
  * app: Your Zype Player Key
  * player: Your Zype App Key

5. Build the Roku app

  * Run 'make' in your project directory

## License

[![Creative Commons License][image-1]][1]  
This work is licensed under a [Creative Commons Attribution 4.0 International License][1].

[1]:    http://creativecommons.org/licenses/by/4.0/

[image-1]:  https://i.creativecommons.org/l/by/4.0/88x31.png