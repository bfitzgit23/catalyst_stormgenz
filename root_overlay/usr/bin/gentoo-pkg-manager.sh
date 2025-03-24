#!/bin/bash

# Gentoo Package Manager GUI using YAD and Zenity

# Fixed window size
window_width=800
window_height=600

# Function to prompt for sudo password
get_sudo_password() {
    sudo_password=$(yad --title "Authentication Required" --entry --hide-text --text="Enter your password:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -ne 0 ]; then
        yad --title "Error" --text="Authentication failed or canceled." --button="Close:0" --width=$window_width --height=$window_height
        exit 1
    fi
    echo "$sudo_password"
}

# Function to run a command with sudo
run_with_sudo() {
    local command="$1"
    local password
    password=$(get_sudo_password)
    echo "$password" | sudo -S bash -c "$command"
}

# Function to display the main menu
main_menu() {
    while true; do
        choice=$(yad --title "Gentoo Package Manager" --form --field="Select Action:CB" "Search!Install!Remove!Update!Sync!Clear Cache!Clear Catalyst!Quit" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)

        case $choice in
            "Search|")
                search_packages
                ;;
            "Install|")
                install_package
                ;;
            "Remove|")
                remove_package
                ;;
            "Update|")
                update_packages
                ;;
            "Sync|")
                sync_portage
                ;;
            "Clear Cache|")
                clear_pkg_cache
                ;;
            "Clear Catalyst|")
                clear_catalyst
                ;;
            "Quit|")
                exit 0
                ;;
            *)
                exit 0
                ;;
        esac
    done
}

# Function to search for packages
search_packages() {
    search_term=$(yad --title "Search Packages" --entry --text "Enter package name or keyword:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        results=$(eix "$search_term")
        yad --title "Search Results" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$results"
    fi
}

# Function to install a package
install_package() {
    package=$(yad --title "Install Package" --entry --text "Enter package name to install:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        # Run emerge and capture output
        emerge_output=$(run_with_sudo "emerge -av $package")
        yad --title "Installation Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
    fi
}

# Function to remove a package
remove_package() {
    package=$(yad --title "Remove Package" --entry --text "Enter package name to remove:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        # Run emerge -C and capture output
        emerge_output=$(run_with_sudo "emerge -Cav $package")
        yad --title "Removal Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
    fi
}

# Function to update packages
update_packages() {
    # Run emerge -avuDN @world and capture output
    emerge_output=$(run_with_sudo "emerge -avuDN @world")
    yad --title "Update Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
}

# Function to sync Portage tree
sync_portage() {
    sync_choice=$(yad --title "Sync Portage Tree" --form --field="Select Sync Mode:CB" "Verbose!Quiet" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        case $sync_choice in
            "Verbose|")
                emerge_output=$(run_with_sudo "emerge --sync")
                ;;
            "Quiet|")
                emerge_output=$(run_with_sudo "emerge --sync --quiet")
                ;;
            *)
                return
                ;;
        esac
        yad --title "Sync Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
    fi
}

# Function to clear package cache
clear_pkg_cache() {
    confirm=$(yad --title "Clear Package Cache" --question --text="Are you sure you want to clear the package cache?\nThis will remove files from /var/cache/binpkgs and /var/cache/distfiles." --button="Yes:0" --button="No:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        clear_output=$(run_with_sudo "rm -rf /var/cache/binpkgs/* /var/cache/distfiles/*")
        yad --title "Clear Cache Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$clear_output"
    fi
}

# Function to clear Catalyst build directory
clear_catalyst() {
    confirm=$(yad --title "Clear Catalyst Build Directory" --question --text="Are you sure you want to clear the Catalyst build directory?\nThis will remove files from /var/tmp/catalyst." --button="Yes:0" --button="No:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        clear_output=$(run_with_sudo "rm -rf /var/tmp/catalyst/*")
        yad --title "Clear Catalyst Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$clear_output"
    fi
}

# Start the main menu
main_menu#!/bin/bash

# Gentoo Package Manager GUI using YAD and Zenity

# Fixed window size
window_width=800
window_height=600

# Function to prompt for sudo password
get_sudo_password() {
    sudo_password=$(yad --title "Authentication Required" --entry --hide-text --text="Enter your password:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -ne 0 ]; then
        yad --title "Error" --text="Authentication failed or canceled." --button="Close:0" --width=$window_width --height=$window_height
        exit 1
    fi
    echo "$sudo_password"
}

# Function to run a command with sudo
run_with_sudo() {
    local command="$1"
    local password
    password=$(get_sudo_password)
    echo "$password" | sudo -S bash -c "$command"
}

# Function to display the main menu
main_menu() {
    while true; do
        choice=$(yad --title "Gentoo Package Manager" --form --field="Select Action:CB" "Search!Install!Remove!Update!Sync!Clear Cache!Clear Catalyst!Quit" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)

        case $choice in
            "Search|")
                search_packages
                ;;
            "Install|")
                install_package
                ;;
            "Remove|")
                remove_package
                ;;
            "Update|")
                update_packages
                ;;
            "Sync|")
                sync_portage
                ;;
            "Clear Cache|")
                clear_pkg_cache
                ;;
            "Clear Catalyst|")
                clear_catalyst
                ;;
            "Quit|")
                exit 0
                ;;
            *)
                exit 0
                ;;
        esac
    done
}

# Function to search for packages
search_packages() {
    search_term=$(yad --title "Search Packages" --entry --text "Enter package name or keyword:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        results=$(eix "$search_term")
        yad --title "Search Results" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$results"
    fi
}

# Function to install a package
install_package() {
    package=$(yad --title "Install Package" --entry --text "Enter package name to install:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        # Run emerge and capture output
        emerge_output=$(run_with_sudo "emerge -av $package")
        yad --title "Installation Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
    fi
}

# Function to remove a package
remove_package() {
    package=$(yad --title "Remove Package" --entry --text "Enter package name to remove:" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        # Run emerge -C and capture output
        emerge_output=$(run_with_sudo "emerge -Cav $package")
        yad --title "Removal Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
    fi
}

# Function to update packages
update_packages() {
    # Run emerge -avuDN @world and capture output
    emerge_output=$(run_with_sudo "emerge -avuDN @world")
    yad --title "Update Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
}

# Function to sync Portage tree
sync_portage() {
    sync_choice=$(yad --title "Sync Portage Tree" --form --field="Select Sync Mode:CB" "Verbose!Quiet" --button="OK:0" --button="Cancel:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        case $sync_choice in
            "Verbose|")
                emerge_output=$(run_with_sudo "emerge --sync")
                ;;
            "Quiet|")
                emerge_output=$(run_with_sudo "emerge --sync --quiet")
                ;;
            *)
                return
                ;;
        esac
        yad --title "Sync Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$emerge_output"
    fi
}

# Function to clear package cache
clear_pkg_cache() {
    confirm=$(yad --title "Clear Package Cache" --question --text="Are you sure you want to clear the package cache?\nThis will remove files from /var/cache/binpkgs and /var/cache/distfiles." --button="Yes:0" --button="No:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        clear_output=$(run_with_sudo "rm -rf /var/cache/binpkgs/* /var/cache/distfiles/*")
        yad --title "Clear Cache Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$clear_output"
    fi
}

# Function to clear Catalyst build directory
clear_catalyst() {
    confirm=$(yad --title "Clear Catalyst Build Directory" --question --text="Are you sure you want to clear the Catalyst build directory?\nThis will remove files from /var/tmp/catalyst." --button="Yes:0" --button="No:1" --width=$window_width --height=$window_height)
    if [ $? -eq 0 ]; then
        clear_output=$(run_with_sudo "rm -rf /var/tmp/catalyst/*")
        yad --title "Clear Catalyst Log" --text-info --width=$window_width --height=$window_height --button="Close:0" <<< "$clear_output"
    fi
}

# Start the main menu
main_menu
