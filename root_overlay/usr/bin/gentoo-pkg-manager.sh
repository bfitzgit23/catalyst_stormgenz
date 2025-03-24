#!/bin/bash
# Gentoo Package Manager GUI - Enhanced Version

# Fixed window size
window_width=800
window_height=600

# Function to enable verbose output
verbose_output() {
    local command="$1"
    if [ "$verbose_mode" = true ]; then
        echo -e "\n\e[1;33mVERBOSE OUTPUT:\e[0m"
        eval "$command"
    fi
}

# Function to prompt for sudo password
get_sudo_password() {
    sudo_password=$(yad --title "Authentication Required" --entry --hide-text \
        --text="Enter your sudo password:" --button="OK:0" --button="Cancel:1" \
        --width=$window_width --height=$window_height)
    [ $? -ne 0 ] && exit 1
    echo "$sudo_password"
}

# Function to run commands with sudo
run_with_sudo() {
    local cmd="$1"
    local password=$(get_sudo_password)
    echo "$password" | sudo -S bash -c "$cmd" 2>&1
}

# Main menu functions (search, install, remove, update, sync) remain the same as before
# ... [previous functions here] ...

# New function for verbose mode toggle
toggle_verbose() {
    verbose_mode=$(yad --title "Verbose Mode" --list --radiolist \
        --column "Select" --column "Mode" \
        TRUE "Enabled" FALSE "Disabled" \
        --width=$window_width --height=$window_height --button="OK:0")
    
    [[ "$verbose_mode" == *"Enabled"* ]] && verbose_mode=true || verbose_mode=false
}

# Main menu with verbose option
main_menu() {
    while true; do
        choice=$(yad --title "Gentoo Package Manager" --form \
            --field="Select Action:CB" "Search!Install!Remove!Update!Sync!Clear Cache!Clear Catalyst!Verbose Mode!Quit" \
            --button="OK:0" --button="Cancel:1" \
            --width=$window_width --height=$window_height)

        case $choice in
            "Verbose Mode|") toggle_verbose ;;
            # ... [other cases] ...
        esac
    done
}

# Start with verbose mode disabled by default
verbose_mode=false
main_menu
