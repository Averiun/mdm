{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red15\green112\blue1;\red255\green255\blue255;\red45\green45\blue45;
\red0\green0\blue109;\red0\green0\blue0;\red144\green1\blue18;\red101\green76\blue29;\red157\green0\blue210;
\red0\green0\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c50196\c0;\cssrgb\c100000\c100000\c100000;\cssrgb\c23137\c23137\c23137;
\cssrgb\c0\c6275\c50196;\cssrgb\c0\c0\c0;\cssrgb\c63922\c8235\c8235;\cssrgb\c47451\c36863\c14902;\cssrgb\c68627\c0\c85882;
\cssrgb\c0\c0\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 #!/bin/bash\cf4 \cb1 \strokec4 \
\
\cf2 \cb3 \strokec2 # Define color codes\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 RED\cf4 \strokec6 =\cf7 \strokec7 '\\033[1;31m'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GRN\cf4 \strokec6 =\cf7 \strokec7 '\\033[1;32m'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 BLU\cf4 \strokec6 =\cf7 \strokec7 '\\033[1;34m'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 YEL\cf4 \strokec6 =\cf7 \strokec7 '\\033[1;33m'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 PUR\cf4 \strokec6 =\cf7 \strokec7 '\\033[1;35m'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 CYAN\cf4 \strokec6 =\cf7 \strokec7 '\\033[1;36m'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 NC\cf4 \strokec6 =\cf7 \strokec7 '\\033[0m'\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 # Function to get the default drive name, or custom if the default is not found\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf8 \cb3 \strokec8 get_drive_name\cf4 \strokec4 () \{\cb1 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf9 \strokec9 while\cf4 \strokec4  \cf7 \strokec7 true\cf4 \strokec4 ; \cf9 \strokec9 do\cf4 \cb1 \strokec4 \
\cb3         \cf9 \strokec9 if\cf4 \strokec4  [ \strokec6 -d\strokec4  \cf7 \strokec7 "/Volumes/Macintosh HDD"\cf4 \strokec4  ]; \cf9 \strokec9 then\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 "Macintosh HDD"\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 return\cf4 \cb1 \strokec4 \
\cb3         \cf9 \strokec9 else\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 read\cf4 \strokec4  \cf10 \strokec10 -p\cf4 \strokec4  \cf7 \strokec7 "Default drive name 'Macintosh HDD' not found. Please enter your drive name: "\cf4 \strokec4  \cf7 \strokec7 drive_name\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 if\cf4 \strokec4  [ \strokec6 -d\strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 drive_name\cf7 \strokec7 \}"\cf4 \strokec4  ]; \cf9 \strokec9 then\cf4 \cb1 \strokec4 \
\cb3                 \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $drive_name\cf7 \strokec7 "\cf4 \cb1 \strokec4 \
\cb3                 \cf9 \strokec9 return\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 else\cf4 \cb1 \strokec4 \
\cb3                 \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 RED\cf7 \strokec7 \}Error: The drive '$\{\cf5 \strokec5 drive_name\cf7 \strokec7 \}' was not found. Please try again.$\{\cf5 \strokec5 NC\cf7 \strokec7 \}"\cf4 \strokec4  \strokec6 >&2\cb1 \strokec4 \
\cb3             \cf9 \strokec9 fi\cf4 \cb1 \strokec4 \
\cb3         \cf9 \strokec9 fi\cf4 \cb1 \strokec4 \
\cb3     \cf9 \strokec9 done\cf4 \cb1 \strokec4 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 # Display header\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf8 \cb3 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 CYAN\cf7 \strokec7 \}Bypass MDM By Assaf Dori (assafdori.com)$\{\cf5 \strokec5 NC\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cf8 \cb3 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 ""\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 # Get drive name\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 DRIVE_NAME\cf4 \strokec6 =\strokec4 $(\cf8 \strokec8 get_drive_name\cf4 \strokec4 )\cb1 \
\cf5 \cb3 \strokec5 DATA_VOLUME\cf4 \strokec6 =\cf7 \strokec7 "$\{\cf5 \strokec5 DRIVE_NAME\cf7 \strokec7 \} - Data"\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec2 # Prompt user for choice\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb3 \strokec5 PS3\cf4 \strokec6 =\cf7 \strokec7 'Please enter your choice: '\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 options\cf4 \strokec6 =\strokec4 (\cf7 \strokec7 "Bypass MDM from Recovery"\cf4 \strokec4  \cf7 \strokec7 "Reboot & Exit"\cf4 \strokec4 )\cb1 \
\pard\pardeftab720\partightenfactor0
\cf9 \cb3 \strokec9 select\cf4 \strokec4  \cf5 \strokec5 opt\cf4 \strokec4  in \cf7 \strokec7 "$\{\cf5 \strokec5 options\cf7 \strokec7 [\cf4 \strokec6 @\cf7 \strokec7 ]\}"\cf4 \strokec4 ; \cf9 \strokec9 do\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf4 \cb3     \cf9 \strokec9 case\cf4 \strokec4  \cf5 \strokec5 $opt\cf4 \strokec4  \cf9 \strokec9 in\cf4 \cb1 \strokec4 \
\cb3         \cf7 \strokec7 "Bypass MDM from Recovery"\cf4 \strokec6 )\cb1 \strokec4 \
\cb3             \cf2 \strokec2 # Bypass MDM from Recovery\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 YEL\cf7 \strokec7 \}Bypass MDM from Recovery"\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 if\cf4 \strokec4  [ \strokec6 -d\strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}"\cf4 \strokec4  ]; \cf9 \strokec9 then\cf4 \cb1 \strokec4 \
\cb3                 \cf8 \strokec8 diskutil\cf4 \strokec4  \cf7 \strokec7 rename\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}"\cf4 \strokec4  \cf7 \strokec7 "Data"\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 fi\cf4 \cb1 \strokec4 \
\
\cb3             \cf2 \strokec2 # Create Temporary User\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 NC\cf7 \strokec7 \}Create a Temporary User"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 read\cf4 \strokec4  \cf10 \strokec10 -p\cf4 \strokec4  \cf7 \strokec7 "Enter Temporary Fullname (Default is 'Apple'): "\cf4 \strokec4  \cf7 \strokec7 realName\cf4 \cb1 \strokec4 \
\cb3             \cf5 \strokec5 realName\cf4 \strokec6 =\cf7 \strokec7 "$\{\cf5 \strokec5 realName\cf4 \strokec6 :=\cf5 \strokec5 Apple\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 read\cf4 \strokec4  \cf10 \strokec10 -p\cf4 \strokec4  \cf7 \strokec7 "Enter Temporary Username (Default is 'Apple'): "\cf4 \strokec4  \cf7 \strokec7 username\cf4 \cb1 \strokec4 \
\cb3             \cf5 \strokec5 username\cf4 \strokec6 =\cf7 \strokec7 "$\{\cf5 \strokec5 username\cf4 \strokec6 :=\cf5 \strokec5 Apple\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 read\cf4 \strokec4  \cf10 \strokec10 -p\cf4 \strokec4  \cf7 \strokec7 "Enter Temporary Password (Default is '1234'): "\cf4 \strokec4  \cf7 \strokec7 passw\cf4 \cb1 \strokec4 \
\cb3             \cf5 \strokec5 passw\cf4 \strokec6 =\cf7 \strokec7 "$\{\cf5 \strokec5 passw\cf4 \strokec6 :=\cf5 \strokec5 1234\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\
\cb3             \cf2 \strokec2 # Create User\cf4 \cb1 \strokec4 \
\cb3             \cf5 \strokec5 dscl_path\cf4 \strokec6 =\cf7 \strokec7 '/Volumes/Data/private/var/db/dslocal/nodes/Default'\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 GREEN\cf7 \strokec7 \}Creating Temporary User"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -create\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -create\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 UserShell\cf4 \strokec4  \cf7 \strokec7 "/bin/zsh"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -create\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 RealName\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $realName\cf7 \strokec7 "\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -create\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 UniqueID\cf4 \strokec4  \cf7 \strokec7 "501"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -create\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 PrimaryGroupID\cf4 \strokec4  \cf7 \strokec7 "20"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 mkdir\cf4 \strokec4  \cf7 \strokec7 "/Volumes/Data/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -create\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 NFSHomeDirectory\cf4 \strokec4  \cf7 \strokec7 "/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -passwd\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Users/\cf5 \strokec5 $username\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $passw\cf7 \strokec7 "\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 dscl\cf4 \strokec4  \cf10 \strokec10 -f\cf4 \strokec4  \cf7 \strokec7 "\cf5 \strokec5 $dscl_path\cf7 \strokec7 "\cf4 \strokec4  \cf7 \strokec7 localhost\cf4 \strokec4  \cf10 \strokec10 -append\cf4 \strokec4  \cf7 \strokec7 "/Local/Default/Groups/admin"\cf4 \strokec4  \cf7 \strokec7 GroupMembership\cf4 \strokec4  \cf5 \strokec5 $username\cf4 \cb1 \strokec4 \
\
\cb3             \cf2 \strokec2 # Block MDM domains\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 "0.0.0.0 deviceenrollment.apple.com"\cf4 \strokec4  \strokec6 >>\cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/etc/hosts"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 "0.0.0.0 mdmenrollment.apple.com"\cf4 \strokec4  \strokec6 >>\cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/etc/hosts"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 "0.0.0.0 iprofiles.apple.com"\cf4 \strokec4  \strokec6 >>\cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/etc/hosts"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 GRN\cf7 \strokec7 \}Successfully blocked MDM & Profile Domains"\cf4 \cb1 \strokec4 \
\
\cb3             \cf2 \strokec2 # Remove configuration profiles\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 touch\cf4 \strokec4  \cf7 \strokec7 /Volumes/Data/private/var/db/.AppleSetupDone\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 rm\cf4 \strokec4  \cf10 \strokec10 -rf\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 rm\cf4 \strokec4  \cf10 \strokec10 -rf\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 touch\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 touch\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound"\cf4 \cb1 \strokec4 \
\
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 GRN\cf7 \strokec7 \}MDM enrollment has been bypassed!$\{\cf5 \strokec5 NC\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 NC\cf7 \strokec7 \}Exit terminal and reboot your Mac.$\{\cf5 \strokec5 NC\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 break\cf4 \cb1 \strokec4 \
\cb3             ;;\cb1 \
\cb3         \cf7 \strokec7 "Disable Notification (SIP)"\cf4 \strokec6 )\cb1 \strokec4 \
\cb3             \cf2 \strokec2 # Disable Notification (SIP)\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 RED\cf7 \strokec7 \}Please Insert Your Password To Proceed$\{\cf5 \strokec5 NC\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 sudo\cf4 \strokec4  \cf7 \strokec7 rm\cf4 \strokec4  \cf7 \strokec7 /var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 sudo\cf4 \strokec4  \cf7 \strokec7 rm\cf4 \strokec4  \cf7 \strokec7 /var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 sudo\cf4 \strokec4  \cf7 \strokec7 touch\cf4 \strokec4  \cf7 \strokec7 /var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 sudo\cf4 \strokec4  \cf7 \strokec7 touch\cf4 \strokec4  \cf7 \strokec7 /var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 break\cf4 \cb1 \strokec4 \
\cb3             ;;\cb1 \
\cb3         \cf7 \strokec7 "Disable Notification (Recovery)"\cf4 \strokec6 )\cb1 \strokec4 \
\cb3             \cf2 \strokec2 # Disable Notification (Recovery)\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 rm\cf4 \strokec4  \cf10 \strokec10 -rf\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 rm\cf4 \strokec4  \cf10 \strokec10 -rf\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 touch\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 touch\cf4 \strokec4  \cf7 \strokec7 "/Volumes/$\{\cf5 \strokec5 DATA_VOLUME\cf7 \strokec7 \}/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound"\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 break\cf4 \cb1 \strokec4 \
\cb3             ;;\cb1 \
\cb3         \cf7 \strokec7 "Check MDM Enrollment"\cf4 \strokec6 )\cb1 \strokec4 \
\cb3             \cf2 \strokec2 # Check MDM Enrollment\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 ""\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 GRN\cf7 \strokec7 \}Check MDM Enrollment. Error is success$\{\cf5 \strokec5 NC\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 ""\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf10 \strokec10 -e\cf4 \strokec4  \cf7 \strokec7 "$\{\cf5 \strokec5 RED\cf7 \strokec7 \}Please Insert Your Password To Proceed$\{\cf5 \strokec5 NC\cf7 \strokec7 \}"\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 ""\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 sudo\cf4 \strokec4  \cf7 \strokec7 profiles\cf4 \strokec4  \cf7 \strokec7 show\cf4 \strokec4  \cf10 \strokec10 -type\cf4 \strokec4  \cf7 \strokec7 enrollment\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 break\cf4 \cb1 \strokec4 \
\cb3             ;;\cb1 \
\cb3         \cf7 \strokec7 "Reboot & Exit"\cf4 \strokec6 )\cb1 \strokec4 \
\cb3             \cf2 \strokec2 # Reboot & Exit\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 "Rebooting..."\cf4 \cb1 \strokec4 \
\cb3             \cf8 \strokec8 reboot\cf4 \cb1 \strokec4 \
\cb3             \cf9 \strokec9 break\cf4 \cb1 \strokec4 \
\cb3             ;;\cb1 \
\cb3         \strokec6 *)\strokec4  \cf8 \strokec8 echo\cf4 \strokec4  \cf7 \strokec7 "Invalid option \cf5 \strokec5 $REPLY\cf7 \strokec7 "\cf4 \strokec4  ;;\cb1 \
\cb3     \cf9 \strokec9 esac\cf4 \cb1 \strokec4 \
\pard\pardeftab720\partightenfactor0
\cf9 \cb3 \strokec9 done\cf4 \cb1 \strokec4 \
\
}