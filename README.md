# Locked Muter

A simple application that mutes your mac when the screen is locked and unmutes when it unlocks.
My first time using XCode & Swift etc for a tiny need and I survived.
Volume controlling code helpfully borrowed from https://github.com/mabi99/NSSound_SystemVolumeExtension.

## To run on login

Following the steps outlined in https://stackoverflow.com/a/13372744/2620122, once the application is built,
create a `plist` file similar to

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>com.user.locked-muter</string>
    <key>ProgramArguments</key>
    <array>
      <string>/path/to/binary/locked-muter</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
  </dict>
</plist>
```

And then submit it to launchd
