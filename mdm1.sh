        "Bypass MDM from Recovery")
            # Ask for Volume Name
            echo ""
            read -p "Enter the Volume Name (e.g., 'Macintosh HD'): " volumeName
            read -p "Enter the Volume Data Name (e.g., 'Macintosh HD - Data'): " volumeDataName

            # Rename data volume if needed
            if [ -d "/Volumes/$volumeDataName" ]; then
                diskutil rename "$volumeDataName" "Data"
                volumeDataName="Data"
            fi

            echo -e "${YEL}Bypass MDM from Recovery"

            # Create Temporary User
            echo -e "${NC}Create a Temporary User"
            read -p "Enter Temporary Fullname (Default is 'Apple'): " realName
            realName="${realName:=Apple}"
            read -p "Enter Temporary Username (Default is 'Apple'): " username
            username="${username:=Apple}"
            read -p "Enter Temporary Password (Default is '1234'): " passw
            passw="${passw:=1234}"

            # Create User
            dscl_path="/Volumes/$volumeDataName/private/var/db/dslocal/nodes/Default"
            echo -e "${GREEN}Creating Temporary User"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" UserShell "/bin/zsh"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" RealName "$realName"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" UniqueID "501"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" PrimaryGroupID "20"
            mkdir "/Volumes/$volumeDataName/Users/$username"
            dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" NFSHomeDirectory "/Users/$username"
            dscl -f "$dscl_path" localhost -passwd "/Local/Default/Users/$username" "$passw"
            dscl -f "$dscl_path" localhost -append "/Local/Default/Groups/admin" GroupMembership $username

            # Block MDM domains
            echo "0.0.0.0 deviceenrollment.apple.com" >>"/Volumes/$volumeName/etc/hosts"
            echo "0.0.0.0 mdmenrollment.apple.com" >>"/Volumes/$volumeName/etc/hosts"
            echo "0.0.0.0 iprofiles.apple.com" >>"/Volumes/$volumeName/etc/hosts"
            echo -e "${GRN}Successfully blocked MDM & Profile Domains"

            # Remove configuration profiles
            touch "/Volumes/$volumeDataName/private/var/db/.AppleSetupDone"
            rm -rf "/Volumes/$volumeName/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord"
            rm -rf "/Volumes/$volumeName/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound"
            touch "/Volumes/$volumeName/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled"
            touch "/Volumes/$volumeName/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound"

            echo -e "${GRN}MDM enrollment has been bypassed!${NC}"
            echo -e "${NC}Exit terminal and reboot your Mac.${NC}"
            break
