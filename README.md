# gwt-sdk-plugins
This Project builds the GWT SDK Plugins for the GWT Plugin. This allows you to install the SDKs by using the Marketplace or an other repository into eclipse.
Alternativly you can simply download the GWT SDK from the GWT projekts website, and reference it in the eclipse preferences.

## build
To build a SDK Plugin you can simply switch into the directory of the version you want to build, and run ***mvn clean package***. The Update Site will be created in ***repo/target/repository***

## new SDK versions
To add a new SDK Version you can simply call ***bash createNewSDKFolder.sh VERSION***, where VERSION is replaced by the actual version number. 
