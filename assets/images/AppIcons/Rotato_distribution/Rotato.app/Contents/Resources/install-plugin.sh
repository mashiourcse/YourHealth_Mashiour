

# Copies local version of sketch plugin to the sketch plugin folder

# For some reason this didn't work
# cp -R ./CameraExporter "/Users/$(whoami)/Library/Application Support/com.bohemiancoding.sketch3/Plugins/CameraExporter.sketchplugin"

echo "To update Sketch plugin, read instructions in the source of this script"

# Instructions
# Use the xcode script to compile a Sketch Plugin
# Hit CMD R to run it, test it
# Go to /Users/mortenjust/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins/ 
# Grab the CameraExporter.sketchplugin
# Archive as zip
# Copy the plugin to the /latest/ folder
# Run this script when the user opens the app (done, don't have to do anything)

#echo "Copying..."
#cp -R latest/CameraExporter.sketchplugin "/Users/$(whoami)/Library/Application Support/com.bohemiancoding.sketch3/Plugins/"
#echo "Installed"

echo "Extracting..."

# d for extract to directory
# o for silently overwrite
unzip -o "$1" -d /Users/$(whoami)/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins/

echo "Done"
