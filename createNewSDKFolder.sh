#!/bin/bash
VERSION=$1
VERSION_UNDERSCORE=${VERSION//./_}
if [ -z "${VERSION}" ]; then
    echo "No Version given. Use it like this:"
    echo "  bash createNewSDKFolder.sh 9.9.9"
    echo "Where 9.9.9 is to be replaced by the new SDK Version"
    exit 1
fi
if [ -d ${VERSION} ]; then
    echo "There is already an directory named ${VERSION}"
    exit 2
fi

echo "Creating $VERSION" from template
cp -R template ${VERSION}

echo "Renaming feature folder"
DIR=${VERSION}/features/com.gwtplugins.eclipse.sdkbundle.gwtSDK_VERSION_UNDERSCORE.feature
VDIR="${DIR/SDK_VERSION_UNDERSCORE/$VERSION_UNDERSCORE}"
mv $DIR $VDIR

echo "Renaming plugins folder"
DIR=${VERSION}/plugins/com.gwtplugins.gwt.eclipse.sdkbundle.gwtSDK_VERSION_UNDERSCORE
VDIR="${DIR/SDK_VERSION_UNDERSCORE/$VERSION_UNDERSCORE}"
mv $DIR $VDIR


find ${VERSION}/ -type f \
  -exec echo "Replacing VERSIONs in " {} \; \
  -exec sed -i "s/SDK_VERSION_UNDERSCORE/${VERSION_UNDERSCORE}/g" {} \; \
  -exec sed -i "s/SDK_VERSION_DOT/${VERSION}/g" {} \;

echo ""
echo "Finished. You can now build the SDK Plugin by running"
echo "  cd ${VERSION}"
echo "  mvn clean package"

